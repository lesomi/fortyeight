<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<!-- header 설정 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="Forty-Eight" name="title"/>
	</jsp:include>
	
	<!-- JavaScript 키 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9850d7308637af77fec67df708e3954a&libraries=services"></script>
	<!-- REST API 키 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb95a399f7176e84725066cf63338419&libraries=services"></script>
	
	<!-- 지도 라이브러리 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<style>
	div#blank1 { margin-bottom: 150px; }
	h3#updateTitle { text-align: center; }
	div#blank2 { margin-bottom: 50px; }
	div#centerDiv { width: 1000px; border: 1px solid; margin: 0 auto; padding-left: 20%; }
	input.inputWidth { width: 500px; }
	button#pwBtn { position: absolute; top: 66%; left: 76%; }
	button#emailBtn { position: absolute; top: 75.5%; left: 76%; }
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
        	<h3 id="updateTitle">회원정보 수정</h3>
        	<div id="blank2"></div>
            <div id="content">
            	<form action="${path}/user/updateUser.do?userNo=${loginUser.userNo}" method="post" enctype="multipart/form-data">
					<div class="form-group" id="centerDiv">
						<!-- 프로필 -->
						
						<!-- 아이디 -->
						<label for="userId">아이디 : </label> 
						<input type="text" class="form-control inputWidth" id="userId" name="userId" value="${loginUser.userId}" readonly>
						<!-- 닉네임 -->
						<label for="nickName">닉네임 : </label>
						<input type="text" class="form-control inputWidth" name="nickName" id="nickName" value="${loginUser.nickName}" required/>
						<!-- 비밀번호 -->
						<label for="password">비밀번호 : </label>
						<input type="text" class="form-control inputWidth" name="password" id="password" value="비공개" readonly/>
						<button type="button" id="pwBtn" class="btn btn-dark">수정</button>
						<!-- 이메일 -->
						<label for="email">이메일 : </label>
						<input type="email" class="form-control inputWidth" name="email" id="email" value="${loginUser.email}" required/>
						<button type="button" id="emailBtn" class="btn btn-dark">인증번호 전송</button>
						<!-- 휴대폰번호 -->
						<label for="phone">전화번호 : </label>
						<input type="text" class="form-control inputWidth" name="phone" id="phone" value="${loginUser.phone}" required/>
						<!-- 거래주소 -->
						<label for="dealAddr">거래주소 : </label>
						<input type="text" class="form-control control2" name="dealAddr" id="dealAddr" value="${loginUser.dealAddr}" required/>
						<!-- 지도를 표시할 div -->
						<div id="map" style="width:500px; height:400px;"></div>
					</div>
				</form>
            
            </div>
        </div>
	</div> <!-- div.class = wrapper -->
</section>


<script>
/* -------------------------------------------------------[kakao map api] ------------------------------------------------------------ */
/* 참고사이트 : https://apis.map.kakao.com/web/sample/addr2coord/ */
/* [kakao 지도 스크립트] */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	    
	};
	
	// 지도생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	/* 지도 위에 마커 */
	// 마커 표시 위치
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
	// 마커 생성
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	
	// 주소-좌표 변환 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	/* 입력한 주소를 대입 */
	$(function(){
		console.log($("#dealAddr").val());
		
		$("#dealAddr").keyup(function() {
			// 주소로 좌표를 검색합니다(이때, 주소는 사용자가 입력한 [거래주소]로 값을 대입한다.)
			geocoder.addressSearch( $('#dealAddr').val() , function(result, status) {
		
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 console.log($("#dealAddr").val());
		
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
		
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재 당신의 <br> <span style="color: rgb(252, 192, 41)">거래주소</span>입니다.</div>'
			        });
			        infowindow.open(map, marker);
		
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		});
	});
</script>

	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>