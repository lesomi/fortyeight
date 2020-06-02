<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	table{
		margin: 0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	
	/* td 영역 설정 */
	table tr td {
		/* 글씨 가운데 */
		text-align: center;
		font-weight: bolder;
		padding: 10px;
	}
	
	.control2{
		/* margin-left: 50px; */
		width: 400px;
	}
	
	p.blankTopP {
		/* 일단은 안 보이게 처리 */
		visibility: hidden;
	
		margin-top: 10px;
		margin-left: 30px;
	}
</style>

<script>
	$(function(){
		$(".eBtn").prop("disabled",true);
		$("#idCheck").prop("disabled",true);
		$("#hideTr").css("display","none");
		$("#email").keyup(function(){
			const email=$("#email").val();
			console.log(email);
			$.ajax({
				url: "${pageContext.request.contextPath}/user/checkEmail.do",
				data: {email : email},
				success: function(data) {
					if(!data.flag){
						console.log(data.flag);
						var id=data.user.userId;
						console.log(id);
						id = id.replace(/(?<=.{2})./, "*");
						$("#idCk").html(id);
						console.log(data.user.userId);
						//이메일이 존재
						if(email.trim().length>0){
							$(".eBtn").prop("disabled", false);
							$("#emailMsg").css("visibility", "visible");
							$("#emailMsg").css("color", "green");
							$("#emailMsg").html("이메일 인증을 진행하세요.");
							
							$(".eBtn").click(function(){
								$("#emailMsg").css("visibility", "visible");
								$("#emailMsg").css("color", "green");
								$("#emailMsg").html("인증번호가 발송되었습니다.");
								$("#hideTr").css("display","");
								
								$.ajax({
									url: "${pageContext.request.contextPath}/user/insertMailSending.do",
									data: {email : email},
									success: function(data) {
										console.log(data);
										$('#emailNumber').keyup(function() {
											const code = $('#emailNumber').val();
											if(data==code) {
												//인증번호 일치
												$("#idCheck").prop("disabled", false);
												$("#emailMsg").css("visibility", "visible");
												$("#emailMsg").css("color", "green");
												$("#emailMsg").html("인증번호가 일치합니다.");
											}
											else {
												//인증번호 불일치
												$("#emailMsg").css("visibility", "visible");
												$("#emailMsg").css("color", "red");
												$("#emailMsg").html("인증번호가 일치하지 않습니다.");
											}
										});
									}
								});
							});
						}
					}else{
						//이메일이 없음
						$("#emailMsg").css("visibility", "visible");
						$("#emailMsg").css("color", "red");
						$("#emailMsg").html("이메일이 존재하지 않습니다.");
					}
				}
			});
		});
	});
</script>

<table>
	<tr>
		<td width="135px">이메일</td>
		<td><input type="text" class="form-control control2" name="email" id="email" required></td>
		<td width="135px">
			<button type="button" class="btn btn-dark eBtn">인증번호 발송</button>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<p class="blankTopP" id="emailMsg">이메일 확인 메세지</p>
		</td>
		<td></td>
	</tr>
	<tr id="hideTr">
		<td></td>
		<td>
			<input type="text" name="emailNumber" id="emailNumber" class="form-control control2">
		</td>
		<td>
			
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<button type="button" id="idCheck" class="btn btn-dark hdBtn" data-toggle="modal" data-target="#idCheckModal">확인</button>
		</td>
	</tr>
</table>

<div class="modal fade" id="idCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">아이디 확인</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="${pageContext.request.contextPath}/user/login.do" method="post">
				<div class="modal-body" style="text-align: center">
					<span>회원님의 아이디는 </span> <strong><span id="idCk"></span></strong> <span>입니다.</span>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-dark hdBtn" data-toggle="modal" data-target="#loginModal">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>