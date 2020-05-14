<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		$("#hideTr").css("display","none");
		$("#email").keyup(function(){
			let email=$("#email").val();
			if(email.trim().length>0){
				$(".eBtn").prop("disabled", false);
				$(".eBtn").click(function(){
					$("#emailMsg").css("visibility", "visible");
					$("#emailMsg").css("color", "green");
					$("#emailMsg").html("인증번호가 발송되었습니다.");
					$("#hideTr").css("display","");
				});
			}
		});
	});
</script>
</head>
<body>
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
				<input type="text" class="form-control control2">
			</td>
			<td>
				시간
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<button type="button" class="btn btn-dark hdBtn">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>