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
		$("#pwCk").prop("disabled",true);
		$("#email").keyup(function(){
			const userId=$("#userId").val();
			const email=$("#email").val();
			if(userId.trim().length>0 && email.trim().length>0){
				$.ajax({
					url:"${pageContext.request.contextPath}/user/findUserPwck.do",
					data:{userId:userId,email:email},
					success:function(data){
						$("#pwCk").prop("disabled",false);
						console.log(data);
						$("#pwCk").click(function(){
							if(data){
								//아이디 이메일 일치
								$.ajax({
									url:"${pageContext.request.contextPath}/user/pwMailSending.do",
									data:{userId:userId,email:email},
									success:function(data){
										console.log("ddd"+data);
									}
								});
								$("#pwCk").attr("data-target","#pwCheckModal");
							}else{
								//아이디 이메일 불일치
								$("#pwCk").attr("data-target","#pwWarnModal");
							}
						});
					}
				});
			}
		});
	});
</script>

<table>
	<tr>
		<td width="135px">아이디</td>
		<td><input type="text" class="form-control control2" name="userId" id="userId" required></td>
		<td width="130px"></td>
	</tr>
	<tr>
		<td width="135px">이메일</td>
		<td><input type="text" class="form-control control2" name="email" id="email" required></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3">
			<button class="btn btn-dark hdBtn" id="pwCk" data-toggle="modal" data-target="">확인</button>
		</td>
	</tr>
</table>

<!-- 아이디 / 이메일 일치 -->
<div class="modal fade" id="pwCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="${pageContext.request.contextPath}/user/login.do" method="post">
				<div class="modal-body" style="text-align: center">
					<p>임시 비밀번호가 발송되었습니다.</p>
					<p>입력하신 이메일을 확인해주세요.</p>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-dark hdBtn" data-toggle="modal" data-target="#loginModal">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 아이디 / 이메일 불일치 -->
<div class="modal fade" id="pwWarnModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">경고</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="${pageContext.request.contextPath}/user/login.do" method="post">
				<div class="modal-body" style="text-align: center">
					<span>아이디 또는 이메일이 일치하지 않습니다.</span>
				</div>
				<div class="modal-footer d-flex justify-content-center">
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-dark hdBtn">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>