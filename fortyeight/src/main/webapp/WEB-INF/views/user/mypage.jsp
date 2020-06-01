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

    /* 우측 컨텐츠 영역 */
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

    /* ------------------------------------------------ */
    /* 후기 작성하기 버튼 */
    button#reviewBtn {
        width: 300px;
        height: 50px;
        border-radius: 30px;
        margin-left: 36%;
    }
    /* 후기 작성하기 버튼에 마우스를 올렸을 때 */
    button#reviewBtn:hover {
        color: #fcc029;
    }
</style>

<section>
	<div id="wrapper">
           
           <!-- 좌측 사이드 메뉴 -->
            <jsp:include page="/WEB-INF/views/user/sideMenu.jsp">
				<jsp:param value="Forty-Eight" name="title"/>
			</jsp:include>
            
            <!-- 우측 컨텐츠 영역 -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">

                    <br><br><br><br><br>

                    <aside>
                        <h3 style="text-align: center; margin-bottom: 50px; ">현재 ${loginUser.nickName}님의 거래정보는?</h3>
                        <table id="rightContent">
                            <tr>
                                <td class="blank" id="buy_History">
                                    <p class="marginP">구매완료내역</p>
                                    <span class="largeCount">${buySu}</span>건
                                </td>
                                <td class="blank">
                                    <p class="marginP">판매완료내역</p>
                                    <span class="largeCount">${sellSu}</span>건
                                </td>
                                <td class="blank">
                                    <p class="marginP">찜목록</p>
                                    <span class="largeCount">${dipsSu}</span>건
                                </td>
                            </tr>
                        </table>
                    </aside>
                    <br><br>
                    <hr>


                    <br><br><br>
                    <aside>
                        <h3 style="text-align: center; margin-bottom: 50px; ">${loginUser.nickName}님의 후기가 필요합니다!</h3>
                        <button class="btn btn-dark" id="reviewBtn">후기 써 보자!</button>
                    </aside>
                    <br><br><br><br>

                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    </button>
                </div>
            </div>
    </div> <!-- div.class = wrapper -->
</section>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>