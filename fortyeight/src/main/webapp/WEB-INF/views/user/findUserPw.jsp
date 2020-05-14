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

</head>
<body>
	<table>
		<tr>
			<td width="135px">아이디</td>
			<td><input type="text" class="form-control control2" name="username" id="username" required></td>
			<td width="130px"></td>
		</tr>
		<tr>
			<td width="135px">이메일</td>
			<td><input type="text" class="form-control control2" name="email" id="email" required></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3">
				<button class="btn btn-dark hdBtn">확인</button>
			</td>
		</tr>
	</table>
</body>
</html>