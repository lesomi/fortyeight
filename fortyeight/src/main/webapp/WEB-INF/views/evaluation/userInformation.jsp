<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>


<style>
	.container {
		margin-top: 150px; 
		width: 1000px;
	}

	#highDiv {
		text-align: center;
	}
	
	#userImg {
		width: 80px;
		height: 80px;
		border-radius: 50px; 
		border: 2px solid white;
		margin-top: 25px;
		margin-bottom: 10px;
	}
	
	#nickP {
		cursor: default;
		font-size: 25px;
	}
	
	#listDiv {
		clear: both;
	}
	
	#dealAddrSpan {
		font-size: 15px;
	}
	
	hr {
		margin-bottom: 25px;
	}
	
	#cardTitle {
		font-size: 15px;
		font-weight: bolder;
	}
	
	#content1, #content2 {
		fonr-size: 10px;
	}
	
	#mkImg {
		margin-bottom: 10px;
	}
	
	#listDiv {
		margin: 0 5px;
	}
	
	#cardDiv {
		float: left;
		margin-right: 20px;
		margin-bottom: 20px;
		width: 300px;
		cursor: pointer;
	}
	
	.cardDivClass {
		box-shadow: 5px 5px 5px rgb(221,221,221);
	}
	
	#page-container {
		clear: both;
	}
</style>

<section>
	<div class="container">
		<!-- 사용자 정보 div -->
		<div id="highDiv">
			<c:if test='${empty user.renameProfile}'>
				없어없어
			</c:if>
			<c:if test='${not empty user.renameProfile}'>
				<img id="userImg" src="${path}/resources/upload/user/${user.renameProfile}">
			</c:if>
			<p id="nickP">
				<strong>${user.nickName}</strong>
				<br>
				<span id="dealAddrSpan">${user.dealAddr}</span>
			</p>
		</div>
		<hr>
		<div id="listDiv" >
			<c:if test='${empty list}'>
				<p>판매중인 마켓글이 없습니다.</p>
			</c:if>
			<c:if test='${not empty list}'>
				<c:forEach items="${list}" var="i">
					<div id="cardDiv" class="card"
					onclick="location.replace('${path}/market/marketView.do?mkNo=${i.mkNo}');">
						<div class="card-body">
							<c:if test='${empty i.renameMkImg}'>
								<img class="card-img-top" id="mkImg" src="${path}/resources/img/noImage.png" style="whdth:100%; height:250px;">
							</c:if>
							<c:if test='${not empty i.renameMkImg}'>
								<img class="card-img-top" id="mkImg" src="${path}/resources/upload/market/${i.renameMkImg}" style="width:100%; height:250px;">
							</c:if>
							<p class="card-title" id="cardTitle">${i.mkTitle}</p>
							<p class="card-text content" id="content1">${i.dealAddr}</p>
							<p class="card-text content" id="content2">
								<fmt:formatNumber value="${i.mkPrice}"/>원
								<c:if test='${i.mkType eq "삽니다"}'>
									<c:if test='${i.dealStatus eq "판매중"}'>
										<span class="badge badge-success">${i.dealStatus}</span>
									</c:if>
									<c:if test='${i.dealStatus eq "예약중"}'>
										<span class="badge badge-warning" style="color: white;">${i.dealStatus}</span>
									</c:if>
									<c:if test='${i.dealStatus eq "판매완료"}'>
										<span class="badge badge-danger">${i.dealStatus}</span>
									</c:if>
								</c:if>
								<c:if test='${i.mkType eq "팝니다"}'>
									<c:if test='${i.dealStatus eq "판매중"}'>
										<span class="badge badge-success">${i.dealStatus}</span>
									</c:if>
									<c:if test='${i.dealStatus eq "예약중"}'>
										<span class="badge badge-warning" style="color: white;">${i.dealStatus}</span>
									</c:if>
									<c:if test='${i.dealStatus eq "판매완료"}'>
										<span class="badge badge-danger">${i.dealStatus}</span>
									</c:if>
								</c:if>
							</p>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	
	<div id="page-container">
		<%-- ${pageBar} --%>
		페이징바 처리
	</div>
	<div class="push"></div>
</section>

<script>
	$(function () {
		$('.card').mouseenter(function () {
			$(this).addClass("cardDivClass");
		});
		$('.card').mouseleave(function () {
			$(this).removeClass("cardDivClass");
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>