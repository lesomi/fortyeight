<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
	const websocket=new WebSocket("ws://localhost:9090${path}/chatting");
	//const websocket=new WebSocket("wss://rclass.iptime.org${path}/chatting"); // 서버배포용
	
	let receiver=${param.receiver};
	let room=${param.userNo};
	
	websocket.onopen=function(data){
		console.log(data);
		websocket.send(JSON.stringify(new Chatting(0,"new",'${loginUser.userNo}',${param.receiver},null,"접속 -chatting",room)));
	}
	
	websocket.onmessage=function(data){
		const msg=JSON.parse(data.data);
		switch(msg.chatType){
			case "msg" : addMessage(msg);break;
		}
	}
	
	function addMessage(msg){
		$("#msg-container").append("<p>"+msg.sender+" : "+msg.chatting+"</p>");
		receiver=msg.sender;
	}
	
	function Chatting(chatNo,chatType,sender,receiver,chatDate,chatting,roomNo){
		this.chatNo=chatNo;
		this.chatType=chatType;
		this.sender=sender;
		this.receiver=receiver;
		this.chatDate=chatDate;
		this.chatting=chatting;
		this.roomNo=roomNo;
	}
	
	$(function(){
		$("#sendBtn").click(function(){
			const chat=$("#sendChat").val();
			if(chat.trim().length==0){
				alert("전송할 데이터가 없습니다.");
				return;
			}else{
				websocket.send(JSON.stringify(new Chatting(0,"msg",'${loginUser.userNo}',receiver,null,chat,room)));
				$("#sendChat").val("");
			}
		});
		
		$("#sendChat").keydown(function(key) {
			if (key.keyCode == 13) {
				const chat=$("#sendChat").val();
				if(chat.trim().length==0){
					alert("전송할 데이터가 없습니다.");
					return;
				}else{
					websocket.send(JSON.stringify(new Chatting(0,"msg",'${loginUser.userNo}',receiver,null,chat,room)));
					$("#sendChat").val("");
				}
			}
		});
	});
</script>
</head>
<body>
	<div id="msg-container" style="height:540px;overflow:auto;"></div>
	<div class="d-flex">
		<input type="text" class="form-control m-2" id="sendChat" name="sendChat" style="width:300px">
		<input type="button" class="btn btn-warning m-2" id="sendBtn" name="sendBtn" value="전송">
	</div>
</body>
</html>