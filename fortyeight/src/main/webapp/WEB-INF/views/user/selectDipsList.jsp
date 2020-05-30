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
	h3 { text-align: center; margin-bottom: 100px; }
	#content { margin-left: 30px; }
	#contentTB { text-align: center; }
	#moveBtn:hover { color: rgb(251, 191, 42); }
	#filterDiv { margin-bottom: 30px; margin-left: 20px; }
	.blankSpan { margin-right: 20px; }
	#filterDipsList { width: 100px; }
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
            	<h3>찜목록</h3>

				<!-- 필터적용 / 전체,삽니다,팝니다 -->
				<div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">정렬</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${path}/user/selectDipsList.do?userNo=${loginUser.userNo}&mkType=전체">전체</a>
						<a class="dropdown-item" href="${path}/user/selectDipsList.do?userNo=${loginUser.userNo}&mkType=삽니다">삽니다</a> 
						<a class="dropdown-item" href="${path}/user/selectDipsList.do?userNo=${loginUser.userNo}&mkType=팝니다">팝니다</a>
					</div>
				</div>
				<br>


				<table id="contentTB" class="table table-hover">
            		<tr>
            			<th>no</th>
            			<th>분류</th>
            			<th>글제목</th>
            			<th>작성자</th>
            			<th>작성일</th>
            			<th>내용</th>
            		</tr>
            		
            		<c:forEach items="${dipsList}" var="i" varStatus="status">
	            		<tr>
            				<td><c:out value="${status.count}"/></td>
            				<td>
            					<c:out value="${i.mkType}"/>
           					</td>
           					<td>
           						<c:out value="${i.mkTitle}"/>
           					</td>
           					<td>
           						<c:out value="${i.nickName}"/>
           					</td>
           					<td>
           						<fmt:formatDate value="${i.mkDate}" pattern="yyyy.MM.dd" />
           					</td>
           					<td>
           						<button type="button" class="btn btn-dark" id="moveBtn"
           								onclick="location.replace('${path}/market/marketView.do?mkNo=${i.mkNo}');">보러가자!</button>
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