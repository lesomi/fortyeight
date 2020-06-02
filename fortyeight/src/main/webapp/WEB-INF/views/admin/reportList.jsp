<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
   
<!-- header 설정 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Forty-Eight" name="title"/>
</jsp:include>

<section>
	<div id="wrapper">
           
	<!-- 좌측 사이드 메뉴 -->
	<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"/>
		
		<!-- 우측 컨텐츠 영역 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content" style="margin-top:150px;">
				<h3 style="text-align: center; margin-bottom: 50px; ">신고목록</h3>
				<table class="table" style="margin:0 auto;width:1000px">
					<tr>
						<td>No</td>
						<td>신고된 유저</td>
						<td>신고 횟수</td>
						<td>신고 사유</td>
						<td>비고</td>
						<td>처리</td>
					</tr>
					<c:forEach items="${report }" var="r">
						<tr>
							<td>${r.reportNo }</td>
							<td>${r.userNo }</td>
							<td>${r.reportCount }</td>
							<td>${r.reportText }</td>
							<td>${r.reportContent }</td>
							<td>
								<input type="hidden" id="userNo" name="userNo" value="${r.userNo }">
								<input type="hidden" id="reportNo" name="reportNo" value="${r.reportNo }">
								<button type="button" class="btn btn-warning m-2" onclick="location.replace('${path}/market/marketView.do?mkNo=${r.mkNo }')">게시글보기</button>
								<c:if test="${r.reportCount lt 3 }">
									<button type="button" class="btn btn-warning m-2" id="reportProcess">경고</button>
								</c:if>
								<c:if test="${r.reportCount ge 3 }">
									<button type="button" class="btn btn-warning m-2" id="reportProcess">정지</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty report }">
						<tr>
							<td colspan="6" style="text-align:center">신고 내역이 없습니다.</td>
						</tr>
					</c:if>
				</table>
				<div>
					${pageBar }
				</div>
			</div>
		</div>
    </div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	$(function(){
		var userNo=$("#userNo").val();
		var reportNo=$("#reportNo").val();
		$("#reportProcess").click(function(){
			console.log("dd?"+userNo);
			$.ajax({
				url:"${pageContext.request.contextPath}/user/updateReportCount.do",
				data:{userNo:userNo,reportNo:reportNo},
				success:function(date){
					if(date){
						alert("신고 처리 완료");
						location.reload();
					}else{
						alert("신고 처리 실패");
						location.reload();
					}
				}
			});
		});
	});
</script>