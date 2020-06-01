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
*{border:1px solid green;}
	#chatList{
		margin:0 auto;
	}
</style>

<section>
	<div id="wrapper">
		<!-- 좌측 사이드 메뉴 -->
		<jsp:include page="/WEB-INF/views/user/sideMenu.jsp"/>
            
		<!-- 우측 컨텐츠 영역 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content" style="margin-top:150px;">
				<div style="width:600px;" id="chatList">
					<c:forEach items="${chat }" var="c">
						<div class="d-flex">
							<div>
								<div>
									${c.sender }
								</div>
								<div>
									${c.chatting }
								</div>
							</div>
							<div>
								${c.chatDate }
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
    </div> 
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>