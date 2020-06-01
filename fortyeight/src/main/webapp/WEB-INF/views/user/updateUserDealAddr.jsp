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
	h3 { text-align: center; margin-bottom: 80px; }
	h3, #pwdP {cursor: default;}
	#content { text-align: center; }
	strong { color: rgb(251,191,42); }
	div#sessionPw { 
		width: 700px; height: 300px; 
		border: 1px solid rgb(231,231,231);
		border-radius: 25px;
		background-color: rgb(241, 241, 241); 
		margin: 0 auto; 
	}
	#newPwDiv {
		
		display: none;
	
		width: 700px; height: 700px; 
		border: 1px solid rgb(231,231,231);
		border-radius: 25px;
		background-color: rgb(241, 241, 241); 
		margin: 0 auto; 
	}
	#pwdP { margin-top: 10%; }
	#pwdLabel { text-align: left; }
	#pwNow, #pwck, #pwNew, #dealAddr { width: 420px; margin-left: 20%; }
	#pwNowMsg, #pwNewMsg, #pwchkMsg { visibility: hidden; }
	#map {margin: 20px auto; }
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
            	<h3>거래주소 변경</h3>
            	
            	<!-- 현재 비밀번호 입력창 -->
				<div id="sessionPw">
					<p id="pwdP">현재 <strong>${loginUser.nickName}</strong>님의 비밀번호를 입력하세요.</p>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" id="pwNow" name="pwNow" placeholder="현재 비밀번호 입력">
						<span id="pwNowMsg">pwd msg</span>
					</div>
					<button type="button" class="btn btn-dark" id="pwNowBtn" disabled="disabled">비밀번호 변경</button>
				</div>
				
				<!-- 새 거래주소 입력창 -->
				<div id="newPwDiv">
					<form action="${path}/user/updateUserDealAddrEnd.do?userNo=${loginUser.userNo}" method="post">
						<p id="pwdP">새로 변경할 <strong>${loginUser.nickName}</strong>님의 거래주소를 입력하세요.</p>
						<br>
						
						<!-- 거래주소 -->
						<input type="text" class="form-control inputWidth" name="dealAddr" id="dealAddr" value="${loginUser.dealAddr}" required/>
						<!-- 지도를 표시할 div -->
						<div id="map" style="width:500px; height:400px;"></div>
						
						<button type="submit" class="btn btn-dark" id="changePwBtn" name="changePwBtn" >거래주소 변경</button>
					</form>
				</div>
            </div>
		</div>
		
	</div><!-- div.class = wrapper -->
	<div id="page-container">
		${pageBar}
	</div>
	<div class="push"></div>
</section>

<script>
	$(function () {
		// 현재 비밀번호 입력 시
		$('#pwNow').keyup(function () {
			const pwNow = $('#pwNow').val();
			if(pwNow.length==0) {
				$('#pwNowBtn').attr('disabled', true);
			}
			else if(pwNow.length>0) {
				$.ajax({
					url: "${path}/user/selectPassword.do",
					data: {pwNow:pwNow},
					success:function(data){
						if(data) {
							$('#pwNowBtn').attr('disabled', false);
							$('#pwNowMsg').css('visibility', 'visible').css('color','green').css('fontWeight','bolder');
							$('#pwNowMsg').html('현재 비밀번호와 일치합니다.');
						}
						else {
							$('#pwNowBtn').attr('disabled', true);
							$('#pwNowMsg').css('visibility', 'visible').css('color','red').css('fontWeight','bolder');
							$('#pwNowMsg').html('현재 비밀번호와 일치하지 않습니다.');
						}
					}
				});
			}
		});
		
		// 비밀번호 변경 버튼을 눌렀을 때
		$('#pwNowBtn').click(function () {
			if($("#newPwDiv").css("display") == "none") {
				$("#newPwDiv").show(500);
				$('#sessionPw').css('display', 'none');
			}
		});
	});
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