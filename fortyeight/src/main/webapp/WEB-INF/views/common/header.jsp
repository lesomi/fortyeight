<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>FORTY-EIGHT</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- 폰트 적용 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

	<style>
        /* 전체에 폰트 적용 */
        /* 전체 margin, padding 조절 */
        *{
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
        }
        
/* -------------------------------------------------------------------------- */
         header {    /* [header 영역] */
            width: 100%;
            height: auto;
            box-shadow: 5px 0px 12px 10px rgb(216, 216, 216);
            /* 배경색상 */
            background-color: white;
        }
        
        div#headerDiv { /* header 안 영역 설정 */
            /* 위로, 옆으로 붙이기.. */
            margin-top: -20px;
            margin-left: -20px;
            height: 135px;
        }

        img#logoImg {   /* 로고 이미지 설정 */
            width: 14rem;
            height: 100px;

            /* 옆으로 좀 띄우기 */
            margin-left: 50%;
        }
        
        /* 로고 이미지에 마우스를 올리면 */
        img#logoImg:hover {
        	cursor: pointer;
        }

        div.divSize {  /* 영역 크기 설정 */
            width: 100px;
            margin-top: 2.8%; /* 텍스트를 아래로! */
        }

        div#firstDiv { /* 이미지 div 우측 영역 설정 */
            margin-right: 25%;
        }

        div#scDiv { /* 고객센터 div 우측 영역 설정 */
            margin-right: 13%;
        }

        a.aFont { /* a 태그 설정 */
            color: rgb(66, 66, 66);
            font-weight: bolder;
            font-size: medium;
        }
        a.aFont:hover { /* a 태그에 마우스를 올렸을 때 */
            cursor: pointer;
            text-decoration: none;
            color: rgb(162, 162, 162);
        }

        span#wall { /* | */
            font-weight: bolder;
        }

        span#wall:hover { /* |에 마우스를 올렸을 때 */
            cursor: default;
        }
        
		.hdBtn{
			width: 180px;
            height: 40px;
            border-radius: 10px;
            font-weight: bolder;
		}
		
		.hdBtn:hover {
            color: #fcc029;
            font-weight: bolder;
        }
	</style>

</head>


<!-- The scrollable area -->
<body data-spy="scroll" data-target=".Boot" data-offset="50">

	<!-- header 적용 -->
	<header class="Boot fixed-top">
        <div id="headerDiv" class="d-flex p-3"> 
            <div class="p-1" id="firstDiv">
            	<img id="logoImg" src="${path}/resources/img/forty-eight.png" onclick="location.replace('${path}')">
           	</div>
            <div class="p-1 divSize">
                <a href="${path}/market/buyMarket.do?category=all" class="aFont">사고</a>
            </div>
            <div class="p-1 divSize">
                <a href="${path}/market/selMarket.do?category=all" class="aFont">팔고</a>
            </div>
            <div class="p-1 divSize" id="scDiv">
                <a href="${path}/board/boardList.do" class="aFont">모여봐요</a>
            </div>
            
            <!-- 만약, session에 로그인한 값이 없으면? -->
            <c:if test="${loginUser==null}">
	            <div class="p-1 divSize">
	                <a class="aFont" id="loginATag" data-toggle="modal" data-target="#loginModal">로그인</a>
	            </div>
	            <div class="p-1 divSize">
	                <a href="${path}/user/agreeUser.do" class="aFont">회원가입</a>
	            </div>
	        </c:if>
	        
	        <!-- 만약, session에 로그인한 값이 있으면? -->
	        <c:if test="${loginUser!=null }">
	        	<div class="p-1 divSize">
	                <a href="${path}/user/mypage.do?userNo=${loginUser.userNo}" class="aFont">마이페이지</a>
	            </div>
	            <div class="p-1 divSize">
	                <a href="${path}/user/logout.do" class="aFont">로그아웃</a>
	            </div>
	        </c:if>
        </div>
    </header>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/user/login.do" method="post">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<img src="${path }/resources/img/forty-eight.png">
						
						<input type="text" class="form-control" name="userId" placeholder="아이디" required> <br />
						<input type="password" class="form-control" name="password" placeholder="비밀번호" required>
						<div class="d-flex" style="padding-top:20px;">
							<div style="width:230px;">
								<label style="padding-left:20px;"><input type="checkbox" name="remeber" id="remember">&nbsp;&nbsp;자동로그인</label>
							</div>
							<div style="width:230px;text-align:right;">
								<a href="${path}/user/find.do" style="padding-right:20px;color:black;">아이디/비밀번호 찾기</a>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center pb-4">
						<button type="submit" class="btn btn-dark hdBtn">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>