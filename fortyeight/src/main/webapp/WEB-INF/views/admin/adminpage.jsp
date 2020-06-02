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
	table#rightContent {
        margin: 0 auto;
    }
    /* 각 td css 설정 */
    td.blank {
        /* border: 1px solid; */
        text-align: center;
        width: 300px;
        height: 6rem;
        color: rgb(68, 68, 68);
    }
    /* 제목 설정 */
    p.marginP {
        margin-bottom: -10px;
    }
    /* 숫자 설정 */
    span.largeCount {
        font-size: xxx-large;
    }
</style>

<section>
	<div id="wrapper">
           
	<!-- 좌측 사이드 메뉴 -->
	<jsp:include page="/WEB-INF/views/admin/adminSideMenu.jsp"/>
		
		<!-- 우측 컨텐츠 영역 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
			
				<br><br><br><br><br>

                    <aside>
                        <h3 style="text-align: center; margin-bottom: 50px; ">관리자님 오늘도 힘내세요!</h3>
                        <table id="rightContent">
                            <tr>
                                <td class="blank" id="buy_History">
                                    <p class="marginP">신고내역</p>
                                    <span class="largeCount">0</span>건
                                </td>
                            </tr>
                        </table>
                    </aside>
			   
			</div>
		</div>
    </div>
</section>

<!-- footer 설정 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>