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
	div#blank1 { margin-bottom: 150px; }
	h3 { text-align: center; margin-bottom: 50px; }
	#contentTB { text-align: center; }
	#moveBtn:hover { color: rgb(251, 191, 42); }
</style>

<section>
	<div id="wrapper">
		<!-- 좌측 사이드 메뉴 -->
		<jsp:include page="/WEB-INF/views/user/sideMenu.jsp">
			<jsp:param value="Forty-Eight" name="title" />
		</jsp:include>
		
		<!-- 우측 컨텐츠 영역 -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="blank1"></div>
            
            <div id="content">
            	<h3>거래내역</h3>

				<!-- 필터적용 / 전체,삽니다,팝니다 -->
				<div class="dropdown dropright">
					<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">정렬</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=전체&dealStatus=전체">전체</a>
						<div class="dropdown-header">[구매]</div>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=삽니다&dealStatus=판매중">구매중</a>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=삽니다&dealStatus=예약중">구매예약중</a>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=삽니다&dealStatus=판매완료">구매완료</a>
						<div class="dropdown-header">[판매]</div>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=팝니다&dealStatus=판매중">판매중</a>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=팝니다&dealStatus=예약중">판매예약중</a>
						<a class="dropdown-item" href="${path}/user/selectDealHistory.do?userNo=${loginUser.userNo}&mkType=팝니다&dealStatus=판매완료">판매완료</a>
					</div>
				</div>
				<br>


				<table id="contentTB" class="table table-hover">
            		<tr>
            			<th>no</th>
            			<th>분류</th>
            			<th>거래상태</th>
            			<th>글제목</th>
            			<th>카테고리</th>
            			<th>가격</th>
            			<th>거래방법</th>
            			<th>반응보기</th>
            			<th>마켓수정</th>
            		</tr>
            		
            		<c:forEach items="${history}" var="i" varStatus="status">
	            		<tr>
            				<td><c:out value="${status.count}"/></td>
            				<td>
           						<c:out value="${i.mkType}"/>
           					</td>
            				<td>
            					<c:if test='${i.mkType eq "삽니다" and i.dealStatus eq "판매중"}'>
            						<span class="badge badge-success">구매중</span>
           						</c:if>
           						<c:if test='${i.mkType eq "삽니다" and i.dealStatus eq "예약중"}'>
            						<span class="badge badge-warning" style="color: white;">구매예약중</span>
           						</c:if>
           						<c:if test='${i.mkType eq "삽니다" and i.dealStatus eq "판매완료"}'>
            						<span class="badge badge-danger">구매완료</span>
           						</c:if>
           						
           						<c:if test='${i.mkType eq "팝니다" and i.dealStatus eq "판매중"}'>
            						<span class="badge badge-success">판매중</span>
           						</c:if>
           						<c:if test='${i.mkType eq "팝니다" and i.dealStatus eq "예약중"}'>
            						<span class="badge badge-warning" style="color: white;">판매예약중</span>
           						</c:if>
           						<c:if test='${i.mkType eq "팝니다" and i.dealStatus eq "판매완료"}'>
            						<span class="badge badge-danger">판매완료</span>
           						</c:if>
           					</td>
           					<td><c:out value="${i.mkTitle}"/></td>
            				<td><c:out value="${i.category}"/></td>
            				<td><c:out value="${i.mkPrice}"/></td>
            				<td><c:out value="${i.dealType}"/></td>
            				<td>
            					<button type="button" class="btn btn-dark" id="moveBtn"
           								onclick="location.replace('${path}/market/marketView.do?mkNo=${i.mkNo}');">보러가자!</button>
							</td>
           					<td>
           						<button type="button" class="btn btn-dark" id="moveBtn" 
           						onclick="location.replace('${path}/market/updateMarket.do?userNo=${loginUser.userNo}&mkNo=${i.mkNo}');">수정하자!</button>
           					</td>
           					
	            		</tr>
            		</c:forEach>
            	</table>
			</div>
		</div>
		
	</div><!-- div.class = wrapper -->
	<div id="page-container">
		${pageBar}
	</div>
	<div class="push"></div>
</section>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>