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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	const websocket=new WebSocket("ws://localhost:9090${path}/chatting");
	
	let receiver=0;
	
	websocket.onopen=function(data){
		console.log(data);
		websocket.send(JSON.stringify(new Chatting(0,"new",'${loginUser.userNo}',0,null,"",0)));
	}
	
	websocket.onmessage=function(data){
		const msg=JSON.parse(data.data);
		switch(msg.chatType){
			case "msg" : addMessage(msg);break;
		}
	}
	
	function addMessage(msg){
		$("#msg-container").append("<p>"+msg.sender+" : "+msg.chatting+"</p>");
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
				websocket.send(JSON.stringify(new Chatting(0,"msg",'${loginUser.userNo}',receiver,null,chat,0)));
			}
		});
	});
</script>
</head>
<body>
	<div id="msg-container"></div>
	<input type="text" id="sendChat" name="sendChat">
	<input type="button" id="sendBtn" name="sendBtn" value="전송">
</body>
</html>