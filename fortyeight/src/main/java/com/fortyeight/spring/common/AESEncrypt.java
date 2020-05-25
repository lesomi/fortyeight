package com.fortyeight.spring.common;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

import com.fortyeight.spring.user.model.vo.User;





public class AESEncrypt {
//	양방향 암호화 객체(AES방식-대칭키)
	private static SecretKey key;
	private String path;
	
	public AESEncrypt() {
		String path = this.getClass().getResource("/").getPath(); // target 경로 안에 찍힘
		this.path = path.substring(0, path.indexOf("/target"));  // 개발용
//		this.path = path.substring(0, path.indexOf("/classes")); // 서버용
		
//		key가 없으면 생성한다
		File f = new File(path+"/src/main/webapp/WEB-INF/secretKey_ysk"); // 개발용
//		File f = new File(path+"/secretKey_ysk"); // 서버용
		if(f.exists()) {
//			Object 파일 읽어오기
			try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f));) {
				key = (SecretKey)ois.readObject();
			}
			catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			catch(IOException e) {
				e.printStackTrace();
			}
		}
		else {
			getGeneric(); // key를 새로 생성하는 메소드
		}
	}
	
//	key를 생성하는 것은 외부에서도 이용하면 안 되기 때문에 private 선언!
	private void getGeneric() {
//		여기서 key를 생성할 거에용!
//		1. salt값을 생성한다.
		SecureRandom salt = new SecureRandom();
//		2. SecretKey를 생성하는 객체를 만든다. : keyGenerator
		KeyGenerator kegen;
//		알고리즘을 불러오는 것이기 때문에 try-catch 로 예외처리 해야한다.
		try {
			kegen = KeyGenerator.getInstance("AES");
			kegen.init(128, salt); // 128bit, salt값
//			3. key를 생성한다.
			key = kegen.generateKey();
		}
		catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
//		만든 key값을 file에 저장해야 한다
//		1. 파일 저장위치를 선택한다 : 객체가 생성될 때(서버가 실행될 때) 받아서 처리한다.
//		어플리케이션이기 때문에 WEB-INF 폴더 밑에 저장할 것이다.(외부에서 접근하지 못하기 때문)
//		서버가 켜지자마자 파일을 가동시켜야 한다. 
//		2. 저장 위치에 SecretKey 객체를 파일로 저장해야 한다.
		File f = new File(path+"/src/main/webapp/WEB-INF/secretKey_ysk");
//		저장하기 위해 필요한 outputstream(byte단위)이 필요함.
//		byte단위 -> 객체를 저장하는 ObjectOutputStream 이용
		try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(f));) {
//			생성된 key값을 secretkey.bs파일에 저장하게 된다.
			oos.writeObject(key);
		}
		catch(IOException e) {
			e.printStackTrace();
		}
//		파일까지 저장하는 것을 key값 생성하는 것이다!
	}
	
	
//	AES암호화 메소드
	public static String encrypt(String target) { // 암호화할 대상이 필요해서 매개변수가 필요하다
//		cipher 객체를 이용해서 암호화를 진행한다
		try {
//			암호화/복호화 하는 객체 생성 
			Cipher cipher = Cipher.getInstance("AES"); // 알고리즘 넣기 AES
			cipher.init(Cipher.ENCRYPT_MODE, key); // 암호화모드, key값
			byte[] oriStr = target.getBytes(); // 원본값
			byte[] encStr = cipher.doFinal(oriStr); // 암호화
			
			return Base64.getEncoder().encodeToString(encStr);
		}
		catch(IllegalBlockSizeException e) {
			e.printStackTrace();
		}
		catch(BadPaddingException e) {
			e.printStackTrace();
		}
		catch(InvalidKeyException e) {
			e.printStackTrace();
		}
		catch(NoSuchPaddingException e) {
			e.printStackTrace();
		}
		catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return target; // 암호화처리가 안 되면 원본값을 리턴한다
	}
	
//	AES복호화 메소드
	public static String decrypt(String target) throws UnsupportedEncodingException {
//		암호화된 값만 들어올 것이다
		byte[] decryptStr = null;
		try {
			Cipher cipher = Cipher.getInstance("AES"); 
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] decodeStr = Base64.getDecoder().decode(target.getBytes());
			decryptStr = cipher.doFinal(decodeStr);
		}
		catch(Exception e) {
			e.printStackTrace();
//			따라서 암호화가 되지 않은 데이터는 복호화하지 않고, 원본값을 리턴한다.
			return target;
		}
//		여기서 nullpoint 에러가 뜬다. 왜? 복호화할 것이 없기 때문이다!
		return new String(decryptStr, "UTF-8");
	}
	
	
	public static void encryptUser(User u) {
		u.setPassword(encrypt(u.getPassword()));
		u.setPhone(encrypt(u.getPhone()));
	}
	
	public static void decryptMember(User u) {
		try {
			u.setPassword(decrypt(u.getPassword()));
			u.setPhone(decrypt(u.getPhone()));
		}
		catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
































