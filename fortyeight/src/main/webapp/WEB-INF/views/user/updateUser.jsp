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
	div#centerDiv { width: 1000px; margin: 0 auto; padding-left: 20%; }
	input.inputWidth { width: 500px; }
	button#pwBtn { position: absolute; top: 189%; left: 76%; }
	/* button#emailBtn { position: absolute; top: 88%; left: 76%; } */
	div#passwordDiv { 
		display: none;
	
		position: relative; 
		left: -100px; 
		padding-left: 100px;
		padding-top: 50px;
		padding-bottom: 50px;
		margin: 30px auto;
		
		border-radius: 30px;
		background-color: #e9ecef; }
	#userId, #nickName, #password, #email, #phone, #dealAddr, #map, #numberSender, #fileDiv { margin-bottom: 30px; }
	.blankP { padding-bottom: 10px; }
	#modification { margin-top: 50px; margin-bottom: 100px; position: relative; left: 45%; }
	#modification:hover { color: rgb(251,192,41); }
	#pwChange { cursor: pointer; color: blue; font-weight: bolder;}
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
						<p>프로필 : </p>
						<c:if test="${loginUser.renameProfile eq null}">
							<div class="custom-file" id="fileDiv">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
			                    <label class="custom-file-label" style="width: 400px; margin-left: 50px;" for="upFile">파일을 선택하세요</label>
			                </div>
						</c:if>
						<c:if test="${loginUser.renameProfile ne null}">
							<div class="custom-file">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
			                    <label class="custom-file-label" style="width: 400px; margin-left: 50px;" for="upFile">${loginUser.renameProfile}</label>
			                </div>
						</c:if>
						<br><br>
						<!-- 아이디 -->
						<label for="userId">아이디 : </label> 
						<input type="text" class="form-control inputWidth" id="userId" name="userId" value="${loginUser.userId}" readonly>
						<!-- 닉네임 -->
						<label for="nickName">닉네임 : </label>
						<input type="text" class="form-control inputWidth" name="nickMyName" id="nickMyName" value="${loginUser.nickName}" required/>
						<p id="nickMsg"></p>
						<!-- 비밀번호 -->
						<label for="password">비밀번호 :  <span id="pwChange">비밀번호 변경</span> </label>
						<input type="text" class="form-control inputWidth" name="password" id="password" value="비공개" readonly/>
						
						<!-- <button type="button" id="pwBtn" class="btn btn-dark" data-toggle="collapse" data-target="#passwordDiv">수정</button> -->
						<!-- 비밀번호 수정 칸 -->
						<div id="passwordDiv">
							<label for="pwNow">· 현재 비밀번호 : </label>
							<input type="password" class="form-control inputWidth" name="pwNow" id="pwNow" required />
							<p id="pwNowMsg"></p>
							<label for="pwNow">· 변경할 비밀번호 : </label>
							<input type="password" class="form-control inputWidth" name="pwNew" id="pwNew" required />
							<p id="pwNewMsg"></p>
							<label for="pwNow">· 변경할 비밀번호 확인 : </label>
							<input type="password" class="form-control inputWidth" name="pwck" id="pwck" required />
							<p id="pwchkMsg"></p>
						</div>
						
						<!-- 이메일 -->
						<label for="email">이메일 : </label>
						<input type="email" class="form-control inputWidth" name="email" id="email" value="${loginUser.email}" required/>
						<button type="button" id="emailBtn" class="btn btn-dark">인증번호 전송</button>
						<p class="blankP" id="emailMsg"></p>
						<!-- 이메일 인증 입력창 -->
						<label for="numberSender">이메일 인증번호 : </label>
						<input type="text" class="form-control inputWidth" name="numberSender" id="numberSender" placeholder="인증번호 입력" required/>
						<p class="blankP" id="numMsg"></p>
						<!-- 휴대폰번호 -->
						<label for="phone">전화번호 : </label>
						<input type="text" class="form-control inputWidth" name="phone" id="phone" value="${loginUser.phone}" required/>
						<p class="blankP" id="phoneMsg"></p>
						<!-- 거래주소 -->
						<label for="dealAddr">거래주소 : </label>
						<input type="text" class="form-control inputWidth" name="dealAddr" id="dealAddr" value="${loginUser.dealAddr}" required/>
						<!-- 지도를 표시할 div -->
						<div id="map" style="width:500px; height:400px;"></div>
					</div>
					
					<button type="submit" id="modification" class="btn btn-dark">회원정보수정</button>
				</form>
            
            </div>
        </div>
	</div> <!-- div.class = wrapper -->
</section>


<script>
/* -------------------------------------------------- [프로필 사진 설정] ------------------------------------------------------------ */
	$(function() {
		var upFile = document.querySelector('#upFile');
		upFile.addEventListener('change', function(e) {
			// 파일명 변경
			const fileName = this.files[0].name;
			$(this).next(".custom-file-label").html(fileName);
		});
	});
/* -------------------------------------------------- [비밀번호 유효성 검사] ------------------------------------------------------------ */
	// [비밀번호 변경] 눌렀을 때.
	$(function () {
		$('#pwChange').click(function () {
			console.log('짜잔');
			if($("#passwordDiv").css("display") == "none") {
				$("#passwordDiv").show(500);
			}
			else{
				$("#passwordDiv").hide(500);
			}
		});
	});
	
	// 현재 비밀번호 비교
	$(function () {
		$('#pwNow').keyup(function () {
			$.ajax({
				url: "${path}/user/selectPassword.do",
				data: { pwNow : $('#pwNow').val() },
				success: function(data) {
					console.log('----- data의 값은? ' + data + " -----");
					if(data) {
						console.log('입력한 값과 현재 비밀번호의 값이 같아요');
						$('#pwNowMsg').html('비밀번호 확인 완료');
						$('#pwNowMsg').css('color', 'green');
					}
					else {
						console.log('입력한 값과 현재 비밀번호의 값이 같지 않아요');
						$('#pwNowMsg').html('비밀번호가 일치하지 않습니다');
						$('#pwNowMsg').css('color', 'red');
						$('#pwNowMsg').css('fontWeight', 'bolder');
					}
					
				}
			});
		});
	});
	
	// 새 비밀번호 입력
	$('#pwNew').keyup(function () {
		const pw = $(this).val();
		if( pw.trim().length>7 || pw.indexOf(" ")>=0 ) {
			console.log("입력한 비밀번호 : "+pw);
			console.log('공백이 없고 비밀번호 길이가 8글자 이상입니다.');
			// 비밀번호 정규식 표현 : 최소 8 자, 대문자 하나 이상, 소문자 하나, 숫자 하나 및 특수 문자 하나 이상
			var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;
			if(pwReg.test(pw)) {
				// 비밀번호가 정규식 표현과 일치할 때
				$("#pwNewMsg").css("visibility", "visible");
				$("#pwNewMsg").css("color", "green");
				$("#pwNewMsg").html('비밀번호 유효성 검사 완료');
			}
			else {
				// 비밀번호가 정규식 표현이 일치하지 않을 때
				$("#pwNewMsg").css("visibility", "visible");
				$("#pwNewMsg").css("color", "red");
				$("#pwNewMsg").html('공백제외/영문자(대소문자)/숫자/특수문자 1개 이상');
				return;
			}
		}
		else {
			// 공백이 있고, 길이가 8글자 미만이면...
			$("#pwNewMsg").css("visibility", "visible");
			$("#pwNewMsg").css("color", "red");
			$("#pwNewMsg").html('공백제외, 8글자 이상 작성필요');
			return;
		}
	});
	
	// 새 비밀번호와 일치하는지 비교
	$(function () {
		$('#pwck').keyup(function () {
			const pwchk =$(this).val();
			console.log("사용자가 입력한 비밀번호 확인 값 : "+pwchk);
			if(pwchk.trim().length>7 || pwchk.indexOf(" ")>0) {
				console.log('첫번째 if문에 들어옵니다');
				// 비밀번호 확인 글자가 8글자 이상이거나 공백이 없으면 [비밀번호]와 비교한다
				if(pwchk==$('#password').val()) {
					// 일치하면...
					console.log('두 비밀번호가 일치합니다.');
					$("#pwchkMsg").css("visibility", "visible");
					$("#pwchkMsg").css("color", "green");
					$("#pwchkMsg").html('비밀번호가 일치합니다.');
				}
				else {
					// 일치하지 않으면...	
					console.log('두 비밀번호가 일치하지 않습니다.');
					$("#pwchkMsg").css("visibility", "visible");
					$("#pwchkMsg").css("color", "red");
					$("#pwchkMsg").html('비밀번호가 일치하지 않습니다.');
					return;
				}
			}
			else {
				// 공백이 있고, 8글자 미만이면...
				console.log('첫번째 else문에 들어옵니다');
				$("#pwchkMsg").css("visibility", "visible");
				$("#pwchkMsg").css("color", "red");
				$("#pwchkMsg").html('공백제외, 8글자 이상 작성필요');
				return;
			}
		});
	});
	
/* -------------------------------------------------- [닉네임 유효성 검사] ------------------------------------------------------------ */	
	$(function () {
		console.log($('#nickMyName').val());
		
		$('#nickMyName').keyup(function () {
			const nick =$(this).val();
			console.log("사용자가 입력한 닉네임 : "+nick);
			
			if((nick.trim().length>=2 && nick.trim().length<=10) || nick.indexOf(" ")>0) { // 공백이 없고, 닉네임이 2글자 이상이면...
				console.log('2글자 이상, 공백없음');
				var nickReg = /^[a-zA-Zㄱ-힣]*$/; // 닉네임 정규식 표현 : 한글, 영문만 입력 가능
				
				if(nickReg.test(nick)) { // 닉네임 유효성 검사에 일치하면..
					console.log('닉네임 유효성 검사 일치');
				
					$.ajax({
						url: "${path}/user/checkNick.do",
						data: {nickName : nick},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data) { 
								// 닉네임이 존재, 사용할 수 없음 
								console.log('닉네임이 존재합니다. 사용할 수 없습니다.');
								$("#nickMsg").css("visibility", "visible");
								$("#nickMsg").css("color", "red");
								$("#nickMsg").html('이 닉네임은 사용할 수 없습니다.');
							} else {
								// 닉네임이 존재하지 않음, 사용할 수 있음
								console.log('닉네임이 존재하지 않습니다. 사용할 수 있습니다.');
								$("#nickMsg").css("visibility", "visible");
								$("#nickMsg").css("color", "green");
								$("#nickMsg").html('이 닉네임은 사용할 수 있습니다.');
							}
						}
					});
				}
				else {
					console.log('닉네임 유효성 검사 불일치...');
					$("#nickMsg").css("visibility", "visible");
					$("#nickMsg").css("color", "red");
					$("#nickMsg").html('한글과 영문자 조합으로 입력하세요.');
					return;
				}
			}
			else { // 공백이 있고, 닉네임이 2글자 미만이면...
				console.log('닉네임 유효성 검사 실패!');
				$("#nickMsg").css("visibility", "visible");
				$("#nickMsg").css("color", "red");
				$("#nickMsg").html('2~10글자 사이로 작성하세요.');
				return;
			}
		});
	});
		

/* -------------------------------------------------- [이메일 유효성 검사] ------------------------------------------------------------ */	
//이메일 출처 :  https://olsh1108o.tistory.com/entry/JS-%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85-%EC%9C%A0%ED%9A%A8%EC%84%B1-%EA%B2%80%EC%82%AC
	$(function () {
		$('#emailBtn').attr('disabled', true);
		$('#email').keyup(function() {
			const email = $(this).val();
			console.log('사용자가 입력한 email값 : '+email);
			console.log(email.indexOf(" ")>0);
			
			if(email.indexOf(" ">0)) {
				console.log('이메일에 공백없음!');
				var emailReg = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{3,}$/;
				console.log("사용자가 입력한 이메일 값 : "+emailReg.test(email));
				
				if(emailReg.test(email)) {
					console.log('이메일 유효성 검사 성공');
					$.ajax({
						url: "${path}/user/checkEmail.do",
						data: {email : email},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data.flag) { 
								console.log('------------------------------');
								console.log('이메일이 존재합니다. 사용할 수 없습니다.');
								$("#emailMsg").css("visibility", "visible");
								$("#emailMsg").css("color", "red");
								$("#emailMsg").html('이 이메일은 사용할 수 없습니다.');
							} else {
								console.log('------------------------------');
								console.log('이메일이 존재하지 않습니다. 사용할 수 있습니다.');
								$("#emailMsg").css("visibility", "visible");
								$("#emailMsg").css("color", "green");
								$("#emailMsg").html('이 이메일은 사용할 수 있습니다.');
								
								// emailBtn 발동!!
								$('#emailBtn').attr('disabled', false);
								$('#emailBtn').click(function() {
									$('#emailMsg').css("color", "gray");
									$("#emailMsg").html('전송완료!');
								});
							}
						}
					});
				}
				else {
					console.log('이메일 유효성 검사 불일치...');
					$("#emailMsg").css("visibility", "visible");
					$("#emailMsg").css("color", "red");
					$("#emailMsg").html('이메일 형식이 일치하지 않습니다.');
					return;
				}
			}
			else {
				console.log('이메일에 공백있음...');
				$("#emailMsg").css("visibility", "visible");
				$("#emailMsg").css("color", "red");
				$("#emailMsg").html('공백없이 숫자로 11글자 입력이 필요합니다.');
				return;
			}
		});
	});

/* -------------------------------------------------- [이메일 인증번호 ajax] ------------------------------------------------------------ */
	$(function () {
		$('#emailBtn').click(function() {
			$.ajax({
				url: "${path}/user/insertMailSending.do",
				data: {email : $('#email').val()},
				success: function(data) {
					console.log("찍어주나요~? "+ (!data==$('#numberSender').val()));
					$('#numberSender').keyup(function() {
						const code = $('#numberSender').val();
						console.log("이건 찍나요~?"+code);
						if(data==code) {
							console.log('if문-인증번호를 보냈습니다.'+data);
							$("#numMsg").css("visibility", "visible");
							$("#numMsg").css("color", "green");
							$("#numMsg").html("인증번호가 일치합니다.");
						}
						else {
							console.log('else문-인증번호를 보냈습니다.'+data);
							$("#numMsg").css("visibility", "visible");
							$("#numMsg").css("color", "red");
							$("#numMsg").html("인증번호가 일치하지 않습니다.");
						}
					});
				}
			});
		});
	});
	
/* -------------------------------------------------- [전화번호 유효성 검사] ------------------------------------------------------------ */	
	$(function () {
		$('#phone').keyup(function() {
			const phone = $(this).val();
			console.log("사용자가 입력한 전화번호 : "+phone);
			console.log(phone.trim().length==11 || phone.indexOf(" ")>0);
			if(phone.trim().length==11 || phone.indexOf(" ")>0) {
				var phoneReg = /^[0-9]*$/; // 숫자만 입력가능
				console.log("전화번호 테스트 값 : "+phoneReg.test(phone));
				if(phoneReg.test(phone)) {
					console.log('전화번호 유효성 검사 성공');
					$.ajax({
						url: "${path}/user/checkPhone.do",
						data: {phone : phone},
						success: function(data) {
							console.log(data);
							// Ajax 안에서 분기처리 
							if(!data) { 
								// 전화번호가 존재, 사용할 수 없음 
								console.log('전화번호가 존재합니다. 사용할 수 없습니다.');
								$("#phoneMsg").css("visibility", "visible");
								$("#phoneMsg").css("color", "red");
								$("#phoneMsg").html('이 전화번호는 사용할 수 없습니다.');
							} else {
								// 전화번호가 존재하지 않음, 사용할 수 있음
								console.log('전화번호가 존재하지 않습니다. 사용할 수 있습니다.');
								$("#phoneMsg").css("visibility", "visible");
								$("#phoneMsg").css("color", "green");
								$("#phoneMsg").html('이 전화번호는 사용할 수 있습니다.');
							}
						}
					});
				}
				else {
					console.log("전화번호 유효성검사 불일치...");
					$("#phoneMsg").css("visibility", "visible");
					$("#phoneMsg").css("color", "red");
					$("#phoneMsg").html('숫자만 입력하세요.');
					return;
				}
			}
			else {
				console.log('전화번호 유효성 검사 실패!');
				$("#phoneMsg").css("visibility", "visible");
				$("#phoneMsg").css("color", "red");
				$("#phoneMsg").html('공백없이 숫자로 11글자 입력이 필요합니다.');
				return;
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