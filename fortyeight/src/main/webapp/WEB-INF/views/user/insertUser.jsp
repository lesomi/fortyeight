<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>
	
	
	
	<!-- JavaScript 키 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9850d7308637af77fec67df708e3954a&libraries=services"></script>
	<!-- REST API 키 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb95a399f7176e84725066cf63338419&libraries=services"></script>
	
	<!-- 지도 라이브러리 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	
	
	

	<style>
		div#titleDiv {
			font-weight: bolder;
			font-size: 25px;
			color: #4f4f4f;
			/* 폰트 가운데로 */
			text-align : center;
		}
		div#titleDiv:hover {
			cursor: default;
		}
		
		/* 회원가입 컨텐츠 영역 위치 설정 */
		table#insertTable {
			margin: 0 auto;
			
			/* 근데 띄울거지롱 */
			margin-top: 100px;
			margin-bottom: 100px;
		}
		
		/* 무조건 입력해야 하는 '별' 설정 */
		span.blankStar {
			font-weight: bolder;
			color: red;
			
			/* 살짝 오른쪽 띄우기 */
			margin-right: 10px;
		}
		
		
		/* td 영역 설정 */
		table tr td {
			/* 글씨 가운데 */
			text-align: center;
			font-weight: bolder;
		}
		
		/* 입력칸 왼쪽 띄우기 */
		input.control2, label#upFile {
			margin-left: 50px;
			width: 400px;
		}
		
		/* 안내메세지 영역 살짝 아래로 */
		p.blankTopP {
			/* 일단은 안 보이게 처리 */
			visibility: hidden;
		
			margin-top: 10px;
			margin-left: 30px;
		}
		
		/* 비밀번호 확인 안내메세지 설정 */
		p#pwchkMsg {
			visibility: hidden; 
			margin-top: 10px; 
			margin-left: 10px;
		}
		
		/* 이메일 안내글 설정 */
		div#userEmail-container {
			position:relative; padding:0px;
		}
		
		/* 인증번호 보내기 span 설정 */
		span#numberSender {
			display: none;
			font-size: 12px;
			position: absolute; 
			top:12px; 
			right:10px;
		}
		
		
		/* 지도 top 살짝 띄우기 */
		div#map {
			margin: 0 auto;
			margin-top: 50px;
		}
		
		
		
		
		/* 버튼의 위치 설정 */
		button#insert {
			margin-left: 34%;
			margin-right: 5%;
		}
		
		/* 버튼 설정 */
		button.enrollBtn {
			font-weight: bolder;
			width: 150px;
			height: 50px;
		}
		
		/* 버튼에 마우스를 올렸을 때  */
		button.enrollBtn:hover {
			color: rgb(251, 192, 41);
		}
		
		/* 프로필 이미지 영역 설정 */
		div#preview > img {
			border-radius: 50px;
		}
		
		/* 프로필 이미지 설정 */
		img#profile {
			width: 100px; 
			height: 100px;
		}
	</style>
	
<section>
	<div class="container" style="margin-top: 200px;">
	
		<!-- 회원가입 타이틀 -->
		<div id="titleDiv">
			<img src="${path}/resources/img/title.PNG">
		</div>
		
		
		<!-- 회원가입 작성 -->
		<div id="insertContent">
			<form action="${path}/user/insertUserEnd.do" method="post" enctype="multipart/form-data">
				<table id="insertTable">
					<tr>
						<td>
							<div id="preview" style="width: 100px; height: 100px;">
								<img id="profile" src="${path}/resources/img/default_profile.png"/>
							</div>
						</td>
						<td>
							<div class="custom-file">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
			                    <label class="custom-file-label" style="width: 400px; margin-left: 50px;" for="upFile">파일을 선택하세요</label>
			                </div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="position:relative; left: 65px; height:50px;">사진 크기는 10mb 이하 업로드 가능합니다.</p>
						</td>
					</tr>
				
				
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">아이디</span>
						</td>
						<td>
							<input type="text" class="form-control control2" name="userId" id="userId" required/>
						</td>
						<td>
							
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="idMsg">아이디 메세지</p>
						</td>
					</tr>
					
					
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">비밀번호</span>
						</td>
						<td>
							<input type="password" class="form-control control2" name="password" id="password" required/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="pwMsg" style="margin-left: 50px;">비밀번호 제약조건 메세지</p>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="password" class="form-control control2" name="pwCheck" id="pwCheck" placeholder="비밀번호 확인" required/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p id="pwchkMsg">비밀번호와 비교</p>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">닉네임</span>
						</td>
						<td>
							<input type="text" class="form-control control2" name="nickName" id="nickName" placeholder="2글자 이상" required/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="nickMsg">닉네임 중복확인 메세지</p>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">이메일</span>
						</td>
						<td>
							<div id="userEmail-container">
								<input type="email" class="form-control control2" name="email" id="email" required/>
								<span id="numberSender">인증번호 전송하기</span>
							</div>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="emailMsg">이메일 중복확인 메세지</p>
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td>
							<input type="text" class="form-control control2" name="emailNumber" id="emailNumber" placeholder="인증번호 입력" required/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="numMsg">인증번호 중복확인 메세지</p>
						</td>
					</tr>
					
					
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">전화번호</span>
						</td>
						<td>
							<input type="text" class="form-control control2" name="phone" id="phone" placeholder="예 : 01012345678" required/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<p class="blankTopP" id="phoneMsg">휴대폰 중복확인 메세지</p>
						</td>
					</tr>
					
					<tr>
						<td>
							<span class="blankStar">*</span>
							<span class="blankRight">거래주소</span>
						</td>
						<td>
							<input type="text" class="form-control control2" name="dealaddr" id="dealaddr" placeholder="지번주소 또는 도로명주소 작성" required/>
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<!-- 지도를 표시할 div -->
							<div id="map" style="width:500px; height:400px;"></div>
						</td>
					</tr>
				</table>
				<button type="submit" id="insert" class="btn btn-dark enrollBtn">회원가입</button>
				<button type="button" class="btn btn-dark enrollBtn" onclick="javascript:history.back();">뒤로가기</button>	
			</form>
			
		</div>
		
	</div>
	<div class="push"></div>
</section>


<script>
/* -------------------------------------------------- [프로필 사진 설정] ------------------------------------------------------------ */
	$(function() {
		var upFile = document.querySelector('#upFile');
		upFile.addEventListener('change', function(e) {
			// 파일명 변경
			const fileName = this.files[0].name;
			$(this).next(".custom-file-label").html(fileName);
	
			// 업로드한 파일 속성 보기
			var getFile = e.target.files;
			console.log(getFile);
	
			// 이미지 태그 생성
			//var image = document.createElement('img');
			var img = document.getElementById('profile');
	
			/* FileReader 객체 생성 */
			var reader = new FileReader();
	
			/* reader 시작시 함수 구현 */
			reader.onload = (function(aImg) {
				console.log(1);
	
				return function(e) {
					console.log(3);
					/* base64 인코딩 된 스트링 데이터 */
					// aImg.src = e.target.result
					aImg.setAttribute("src",e.target.result);
				}
			})(img);
	
			if (getFile) {
				/* 
				    get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
				    onload 에 설정했던 return 으로 넘어간다.
				        이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
				 */
				reader.readAsDataURL(getFile[0]);
				console.log(2);
			}
	
			preview.appendChild(img);
		});
	});
/* -------------------------------------------------- [아이디 유효성 검사] ------------------------------------------------------------ */
/* 참고 : ajax 1번째 활용 */
	 $(function() {
		$("#userId").keyup(function() {
			const id = $(this).val();
			// 아이디 글자가 공백이 없고 5~12글자에 포함되면 ...
			if( (id.trim().length>4 && id.trim().length<13) || id.indexOf(" ")>=0 ) {
				// 아이디 유효성 검사 
				/* var idReg = /^[a-z0-9{4,12}]+$/; // 영문자(소문자), 숫자, 5글자 이상만 가능 -> 안써! */
				var idReg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{4,12}$/; // 최소 8 자, 최소 하나의 문자 및 하나의 숫자
				
				if(idReg.test(id)) {
					// 아이디가 유효성 검사에 일치하면...
					$.ajax({
						url: "${path}/user/checkId.do",
						data: {userId : id},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if( data=='false' ) { 
								// 아이디가 존재, 사용할 수 없음 
								$("#idMsg").css("visibility", "visible");
								$("#idMsg").css("color", "red");
								$("#idMsg").html('이 아이디는 사용할 수 없습니다.');
							} else {
								// 아이디가 존재하지 않음, 사용할 수 있음
								$("#idMsg").css("visibility", "visible");
								$("#idMsg").css("color", "green");
								$("#idMsg").html('이 아이디는 사용할 수 있습니다.');
							}
						}
					});
				}
				else {
					// 아이디가 유효성 검사에 일치하지 않으면... 
					$("#idMsg").css("visibility", "visible");
					$("#idMsg").css("color", "red");
					$("#idMsg").html('1개 이상의 문자와 숫자 필수 작성.');
					return;
				}
			}else {
				// 아이디 글자에 공백이 있고 5~12글자에 포함되지 않으면 ...
				$("#idMsg").css("visibility", "visible");
				$("#idMsg").css("color", "red");
				$("#idMsg").html('공백제외, 5글자 이상 12글자 이하 작성필요');
				return;
			}
		});
	});
/* -------------------------------------------------- [비밀번호 유효성 검사] ------------------------------------------------------------ */
/* ajax 3번째 활용 */
//  비밀번호 정규식 표현 출처 : 
//  https://beagle-dev.tistory.com/114
	$(function () {
		$('#password').keyup(function() {
			const pw = $(this).val();
			if( pw.trim().length>7 || pw.indexOf(" ")>=0 ) {
				console.log("입력한 비밀번호 : "+pw);
				console.log('공백이 없고 비밀번호 길이가 8글자 이상입니다.');
				// 비밀번호 정규식 표현 : 최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상
				var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
				if(pwReg.test(pw)) {
					// 비밀번호가 정규식 표현과 일치할 때
					$("#pwMsg").css("visibility", "visible");
					$("#pwMsg").css("color", "green");
					$("#pwMsg").html('비밀번호 유효성 검사 완료');
				}
				else {
					// 비밀번호가 정규식 표현이 일치하지 않을 때
					$("#pwMsg").css("visibility", "visible");
					$("#pwMsg").css("color", "red");
					$("#pwMsg").html('공백제외/영문자(대소문자)/숫자/특수문자 1개 이상');
					return;
				}
			}
			else {
				// 공백이 있고, 길이가 8글자 미만이면...
				$("#pwMsg").css("visibility", "visible");
				$("#pwMsg").css("color", "red");
				$("#pwMsg").html('공백제외, 8글자 이상 작성필요');
				return;
			}
		});
	});

/* -------------------------------------------------- [비밀번호 확인 유효성 검사] ------------------------------------------------------------ */
	$(function () {
		$('#pwCheck').keyup(function () {
			const pwchk =$(this).val();
			console.log("사용자가 입력한 비밀번호 확인 값 : "+pwchk);
			
			if(pwchk.trim().length>7 || pwchk.indexOf(" ")>0) {
				console.log('첫번째 if문에 들어옵니다');
				// 비밀번호 확인 글자가 8글자 이상이거나 공백이 없으면 [비밀번호]와 비교한다
				if(pwchk==$('#password').val()) {
					// 일치하면...
					console.log('두 비밀번호가 일치합니다.');
					$("#pwchkMsg").css("visibility", "visible");
					$("#pwchkMsg").css("color", "green");
					$("#pwchkMsg").html('비밀번호가 일치합니다.');
				}
				else {
					// 일치하지 않으면...	
					console.log('두 비밀번호가 일치하지 않습니다.');
					$("#pwchkMsg").css("visibility", "visible");
					$("#pwchkMsg").css("color", "red");
					$("#pwchkMsg").html('비밀번호가 일치하지 않습니다.');
					return;
				}
			}
			else {
				// 공백이 있고, 8글자 미만이면...
				console.log('첫번째 else문에 들어옵니다');
				$("#pwchkMsg").css("visibility", "visible");
				$("#pwchkMsg").css("color", "red");
				$("#pwchkMsg").html('공백제외, 8글자 이상 작성필요');
				return;
			}
		});
	});
	
/* -------------------------------------------------- [닉네임 유효성 검사] ------------------------------------------------------------ */	
	$(function () {
		$('#nickName').keyup(function () {
			const nick =$(this).val();
			console.log("사용자가 입력한 닉네임 : "+nick);
			
			if((nick.trim().length>=2 && nick.trim().length<=10) || nick.indexOf(" ")>0) { // 공백이 없고, 닉네임이 2글자 이상이면...
				console.log('2글자 이상, 공백없음');
				var nickReg = /^[a-zA-Zㄱ-힣]*$/; // 닉네임 정규식 표현 : 한글, 영문만 입력 가능
				
				if(nickReg.test(nick)) { // 닉네임 유효성 검사에 일치하면..
					console.log('닉네임 유효성 검사 일치');
				
					$.ajax({
						url: "${path}/user/checkNick.do",
						data: {nickName : nick},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data) { 
								// 닉네임이 존재, 사용할 수 없음 
								console.log('닉네임이 존재합니다. 사용할 수 없습니다.');
								$("#nickMsg").css("visibility", "visible");
								$("#nickMsg").css("color", "red");
								$("#nickMsg").html('이 닉네임은 사용할 수 없습니다.');
							} else {
								// 닉네임이 존재하지 않음, 사용할 수 있음
								console.log('닉네임이 존재하지 않습니다. 사용할 수 있습니다.');
								$("#nickMsg").css("visibility", "visible");
								$("#nickMsg").css("color", "green");
								$("#nickMsg").html('이 닉네임은 사용할 수 있습니다.');
							}
						}
					});
				}
				else {
					console.log('닉네임 유효성 검사 불일치...');
					$("#nickMsg").css("visibility", "visible");
					$("#nickMsg").css("color", "red");
					$("#nickMsg").html('한글과 영문자 조합으로 입력하세요.');
					return;
				}
			}
			else { // 공백이 있고, 닉네임이 2글자 미만이면...
				console.log('닉네임 유효성 검사 실패!');
				$("#nickMsg").css("visibility", "visible");
				$("#nickMsg").css("color", "red");
				$("#nickMsg").html('2~10글자 사이로 작성하세요.');
				return;
			}
		});
	});
	
/* -------------------------------------------------- [전화번호 유효성 검사] ------------------------------------------------------------ */	
	$(function () {
		$('#phone').keyup(function() {
			const phone = $(this).val();
			console.log("사용자가 입력한 전화번호 : "+phone);
			console.log(phone.trim().length==11 || phone.indexOf(" ")>0);
			if(phone.trim().length==11 || phone.indexOf(" ")>0) {
				var phoneReg = /^[0-9]*$/; // 숫자만 입력가능
				console.log("전화번호 테스트 값 : "+phoneReg.test(phone));
				if(phoneReg.test(phone)) {
					console.log('전화번호 유효성 검사 성공');
					$.ajax({
						url: "${path}/user/checkPhone.do",
						data: {phone : phone},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data) { 
								// 전화번호가 존재, 사용할 수 없음 
								console.log('전화번호가 존재합니다. 사용할 수 없습니다.');
								$("#phoneMsg").css("visibility", "visible");
								$("#phoneMsg").css("color", "red");
								$("#phoneMsg").html('이 전화번호는 사용할 수 없습니다.');
							} else {
								// 전화번호가 존재하지 않음, 사용할 수 있음
								console.log('전화번호가 존재하지 않습니다. 사용할 수 있습니다.');
								$("#phoneMsg").css("visibility", "visible");
								$("#phoneMsg").css("color", "green");
								$("#phoneMsg").html('이 전화번호는 사용할 수 있습니다.');
							}
						}
					});
				}
				else {
					console.log("전화번호 유효성검사 불일치...");
					$("#phoneMsg").css("visibility", "visible");
					$("#phoneMsg").css("color", "red");
					$("#phoneMsg").html('숫자만 입력하세요.');
					return;
				}
			}
			else {
				console.log('전화번호 유효성 검사 실패!');
				$("#phoneMsg").css("visibility", "visible");
				$("#phoneMsg").css("color", "red");
				$("#phoneMsg").html('공백없이 숫자로 11글자 입력이 필요합니다.');
				return;
			}
		});
	});
	
/* -------------------------------------------------- [이메일 유효성 검사] ------------------------------------------------------------ */	
//  이메일 출처 :  https://olsh1108o.tistory.com/entry/JS-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%EC%9C%A0%ED%9A%A8%EC%84%B1-%EA%B2%80%EC%82%AC
	$(function () {
		$('#email').keyup(function() {
			const email = $(this).val();
			console.log('사용자가 입력한 email값 : '+email);
			console.log(email.indexOf(" ")>0);
			
			if(email.indexOf(" ">0)) {
				console.log('이메일에 공백없음!');
				var emailReg = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{3,}$/;
				console.log("사용자가 입력한 이메일 값 : "+emailReg.test(email));
				
				if(emailReg.test(email)) {
					console.log('이메일 유효성 검사 성공');
					$.ajax({
						url: "${path}/user/checkEmail.do",
						data: {email : email},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data) { 
								console.log('이메일이 존재합니다. 사용할 수 없습니다.');
								$("#emailMsg").css("visibility", "visible");
								$("#emailMsg").css("color", "red");
								$("#emailMsg").html('이 이메일은 사용할 수 없습니다.');
							} else {
								console.log('이메일이 존재하지 않습니다. 사용할 수 있습니다.');
								$("#emailMsg").css("visibility", "visible");
								$("#emailMsg").css("color", "green");
								$("#emailMsg").html('이 이메일은 사용할 수 있습니다.');
								
								// span 영역 발동!!
								$('#numberSender').css("display", "inline");
								$('#numberSender').css("cursor", "pointer");
								$('#numberSender').css("color", "blue");
								$('#numberSender').click(function() {
									alert('인증번호가 전송되었습니다.');
									$('#numberSender').css("display", "inline");
									$('#numberSender').css("cursor", "default");
									$('#numberSender').css("color", "gray");
									$("#numberSender").html('전송완료!');
									$("#numberSender").off('click');
								});
							}
						}
					});
				}
				else {
					console.log('이메일 유효성 검사 불일치...');
					$("#emailMsg").css("visibility", "visible");
					$("#emailMsg").css("color", "red");
					$("#emailMsg").html('이메일 형식이 일치하지 않습니다.');
					return;
				}
			}
			else {
				console.log('이메일에 공백있음...');
				$("#emailMsg").css("visibility", "visible");
				$("#emailMsg").css("color", "red");
				$("#emailMsg").html('공백없이 숫자로 11글자 입력이 필요합니다.');
				return;
			}
		});
	});
/* -------------------------------------------------- [이메일 인증번호 ajax] ------------------------------------------------------------ */
	$(function () {
		$('#numberSender').click(function() {
			$.ajax({
				url: "${path}/user/insertMailSending.do",
				data: {email : $('#email').val()},
				success: function(data) {
					console.log("찍어주나요~? "+ (!data==$('#numberSender').val()));
					$('#emailNumber').keyup(function() {
						const code = $('#emailNumber').val();
						console.log("이건 찍나요~?"+code);
						if(data==code) {
							console.log('if문-인증번호를 보냈습니다.'+data);
							$("#numMsg").css("visibility", "visible");
							$("#numMsg").css("color", "green");
							$("#numMsg").html("인증번호가 일치합니다.");
						}
						else {
							console.log('else문-인증번호를 보냈습니다.'+data);
							$("#numMsg").css("visibility", "visible");
							$("#numMsg").css("color", "red");
							$("#numMsg").html("인증번호가 일치하지 않습니다.");
						}
					});
				}
			});
		});
	});

/* -------------------------------------------------------[kakao map api] ------------------------------------------------------------ */
 	/* 참고사이트 : https://apis.map.kakao.com/web/sample/addr2coord/ */
	/* [kakao 지도 스크립트] */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	    
	};
	
	// 지도생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	/* 지도 위에 마커 */
	// 마커 표시 위치
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
	// 마커 생성
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	
	// 주소-좌표 변환 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	/* 입력한 주소를 대입 */
	$(function(){
		console.log($("#dealaddr").val());
		
		$("#dealaddr").keyup(function() {
			// 주소로 좌표를 검색합니다(이때, 주소는 사용자가 입력한 [거래주소]로 값을 대입한다.)
			geocoder.addressSearch( $('#dealaddr').val() , function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 console.log($("#dealaddr").val());
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 당신의 <br> <span style="color: rgb(252, 192, 41)">거래주소</span>입니다.</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		});
	});
	
</script>


<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>