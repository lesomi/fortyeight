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
	/* 타이틀 영역 설정 */
	div#sellTitle {
		/* 위치 */
           margin-top: 50px;
           margin-bottom: 50px;
	}
	/* 팝니다 타이틀 가운데로 */
	h2, h6 {
		text-align: center;
	}
	
	/* ---- */
	
	/* 선택 버튼 크기 설정 */
	button#selectBtn {
		width: 200px;
	}
	
	/* 테이블 영역 설정 */
	table#writeTB {
		margin: 0 auto;
		margin-bottom: 100px;
		text-align: center;
	}
	
	/* 제목 안내글 설정 */
	p#titleMsg, p#dealAddrMsg {
		/* margin-top: 10px;
		margin-bottom: 10px; */
		text-align: center;
		font-size: 13px;
	}
	
	/* 제목 글자수 설정 */
	span#titleCounter {
		position: absolute;
		right: 12%;
		top: 78%;
	}
	
	/* '여기' 설정 */
	strong {
		border-bottom: 1px solid #f2994a;
		font-weight: bolder;
		color: #f2994a;
	}
	strong:hover {
		cursor: pointer;
	}
	
	/* 내용 설정 */
	textarea {
		margin-left: 10%;
		resize: none;
		border-radius: 5px;
		padding: 5px;
	}
	/* 내용 글자수 체크하는 놈 설정 */
	span#counter {
		position: absolute;
		right: 12%;
		margin-top: 16%;
	}
	
	/* 사진등록 div 설정 */
	div#fileDiv {
		width: 400px;
	} 
	/* 이미지 크기 */
	img#uploadImg {
		width: 200px;
		height: 200px;
	}
	
	/* 플러스, 마이너스 이미지 설정 */
	img#plus, img#plus2 {
		position: absolute; 
		right: -45%;
	}
	img#minus, img#minus2 {
		position: absolute; 
		right: -30%;
	}
	
	/* 플러스 이미지 눌렀을 때 */
	img#plus:hover, img#minus:hover,
	img#plus2:hover, img#minus2:hover {
		cursor: pointer;
	}
	
	
	/* --- */
	
	
	
	
	/* --- */
	
	/* 버튼의 위치 설정 */
	button#insert {
		margin-left: 34%;
		margin-right: 5%;
	}
	
	/* 버튼 설정 */
	button.enrollBtn {
		font-weight: bolder;
		width: 150px;
		height: 50px;
	}
	
	/* 버튼에 마우스를 올렸을 때  */
	button.enrollBtn:hover {
		color: rgb(251, 192, 41);
	}
</style>

<section>
	<div class="container" style="margin-top: 200px;">
		<!-- 판매글 작성 : 형식은 회원가입과 비슷하게... -->
		
		<div id="sellTitle">
			<h2>거래글 작성하자!</h2>
			<h6>(작성자 : <c:out value="${loginUser.nickName}"/>님)</h6>
		</div>
		
		<div id="writeSellDiv">
			<form action="${path}/market/writeBuySellEnd.do" method="post" enctype="multipart/form-data" onsubmit="return checkSelect();">
				<table id="writeTB" class="table table-borderless">
					<tr>
						<td>거래활동</td>
						<td>
							<div class="form-group">
								<select class="form-control" name="mkType" id="mkType">
									<option value="" disabled selected>거래활동을 선택하세요</option>
									<option class="selectOption" value="삽니다">삽니다</option>
									<option class="selectOption" value="팝니다">팝니다</option>
								</select>
							</div>
						</td>
					</tr>
				
					<tr>
						<td>카테고리</td>
						<td>
							<div class="form-group">
								<select class="form-control" name="category" id="category">
									<option value="" disabled selected>카테고리를 선택하세요</option>
									<option class="selectOption" value="digital">디지털/가전</option>
									<option class="selectOption" value="interior">가구/인테리어</option>
									<option class="selectOption" value="child">유아용/유아도서</option>
									<option class="selectOption" value="life">생활/가공식품</option>
									<option class="selectOption" value="woman">여성의류/잡화</option>
									<option class="selectOption" value="beauty">뷰티/미용</option>
									<option class="selectOption" value="man">남성의류/잡화</option>
									<option class="selectOption" value="sport">스포츠/레저/게임</option>
									<option class="selectOption" value="etc">기타</option>
								</select>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td>
							<input type="text" class="form-control" name="mkTitle" id="mkTitle" placeholder="30글자 이내 작성" maxlength="30" required/>
							<span></span>
						</td>
					</tr>
					<tr>
						<!-- <td colspan="2"><p id="titleMsg">제목 안내글 작성</p></td> -->
						<td colspan="2">
							<span style="color:#aaa;" id="titleCounter">(0 / 최대 30자)</span>
						</td>
					</tr>
					
					<tr>
						<td>거래주소</td>
						<td>
							<input type="text" class="form-control" id="dealAddr" name="dealAddr" value="${loginUser.dealAddr}" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p id="dealAddrMsg">거래주소를 변경하고 싶으신가요? <strong onclick="location.replace('${path}/user/updateUserDealAddr.do?userNo=${loginUser.userNo}');">여기</strong>를 눌러주세요.</p>
						</td>
					</tr>
					
					<tr>
						<td>거래방법</td>
						<td>
							<div class="form-group">
								<select class="form-control" name="dealType" id="dealType">
									<option value="" disabled selected>거래방법을 선택하세요</option>
									<option class="selectOption" value="택배">택배</option>
									<option class="selectOption" value="직거래">직거래</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td>
							<input type="number" name="mkPrice" id="mkPrice" class="form-control" placeholder="입력 예 : 10000" required/>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					
					
					<tr>
						<td style="text-align: center;">사진등록</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					
					
					<!-- 여기가 여러개 추가될 것! -->
					<tr>
						<td colspan="2">
							<img id="uploadImg" src="${path}/resources/img/plusImg원본.png"/> <!-- width: 200px, height: 200px -->
							<div class="custom-file" id="fileDiv">
			                    <input type="file" class="custom-file-input" name="upFile" id="upFile">
			                    <label class="custom-file-label" id="selectLabel" style="width: 400px; margin-left: 50px;" for="upFile">파일을 선택하세요</label>
			                    <%-- <img src="${path}/resources/img/plusIcon.png" id="plus"> --%>
			                    <img src="${path}/resources/img/minusIcon.png" id="minus">			                    
		                	</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 20px;"></td>
					</tr>
					<!-- 여기까지 -->
					
					
					
					<!-- 글작성 내용 -->
					<tr>
						<td colspan="2">
							<textarea id="mkContent" name="mkContent" rows="10" cols="130" placeholder="당신의 게시글을 어필하세요! 1000글자 내 작성이 필요합니다." maxlength="1000" required></textarea>
							<span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>
						</td>
					</tr>
				</table>
				<button type="submit" id="insert" class="btn btn-dark enrollBtn">등록하자!</button>
				<button type="button" class="btn btn-dark enrollBtn" onclick="javascript:history.back();">뒤로가기</button>
			</form>
		</div>
	</div>
	
	<div class="push"></div>
</section>

<script>
	function checkSelect(){
		if($("#mkType").val()==null){
			alert("글 유형을 선택해주세요.");
			$("#mkType").focus();
			return false;
		}
		
		if($("#category").val()==null){
			alert("카테고리를 선택해주세요.");
			$("#category").focus();
			return false;
		}
		
		if($("#dealType").val()==null){
			alert("거래 방법을 선택해주세요.");
			$("#dealType").focus();
			return false;
		}
	}

/* ---------------------------------------------- [글자 수 카운트] ----------------------------------------------------- */
	// 제목 글자수 카운트
	$(function () {
		$('#mkTitle').keyup(function () {
			var title = $(this).val();
			$('#titleCounter').html("("+title.length+" / 최대 30자)"); // 제목 글자수 카운팅
			console.log('현재 제목 글자 수  :' +title.length);
			
			if(title.length == 30) {
				$("#mkTitle").focus();
				$('#titleCounter').css("color","red");
				$('#titleCounter').css("fontWeight","bolder");
			}
		});
	});
	// textarea 글자수 카운트
	$(function () {
		$('#mkContent').keyup(function () {
			var content = $(this).val();
			$('#counter').html("("+content.length+" / 최대 1000자)"); // 내용 글자수 카운팅
			console.log("현재 글자 수 : "+content.length);
			
			if(content.length == 1000) {
				$("#mkContent").focus();
				$('#counter').css({
					color: 'red',
					fontWeight: 'bolder'
				});
			}
		});
	});
	
/* ---------------------------------------------- [첫번째 파일 업로드] ----------------------------------------------------- */
	$(function() {
		const upFile = document.querySelector('#upFile');
		upFile.addEventListener('change', function(e) {
			// 파일명 변경
			const fileName = this.files[0].name;
			$(this).next(".custom-file-label").html(fileName);
	
			// 업로드한 파일 속성 보기
			var getFile = e.target.files;
			console.log(getFile);
	
			// 이미지 태그 생성
			//var image = document.createElement('img');
			var img = document.getElementById('uploadImg');
	
			/* FileReader 객체 생성 */
			var reader = new FileReader();
	
			/* reader 시작시 함수 구현 */
			reader.onload = (function(aImg) {
				console.log(1);
	
				return function(e) {
					console.log(3);
					/* base64 인코딩 된 스트링 데이터 */
					// aImg.src = e.target.result
					aImg.setAttribute("src",e.target.result);
					
					
					
					// ----
					/* minus 클릭 시 이미지 삭제 */
					$('#minus').click(function () {
						$('#upFile').next(".custom-file-label").html('파일을 선택하세요.');
						e.target.result
						aImg.setAttribute('src','${path}/resources/img/plusImg원본.png'); // 이미지 삭제
					});
				}
			})(img);
	
			if (getFile) {
				/* 
				    get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
				    onload 에 설정했던 return 으로 넘어간다.
				        이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
				 */
				reader.readAsDataURL(getFile[0]);
				console.log(2);
			}
		});
	});
/* ---------------------------------------------- [하다말았어ㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓㅓplus 눌렀을 때 라인 추가, 두번째 파일 업로드] ----------------------------------------------------- */
	$(function () {	
		const upFile = document.querySelector('#upFile');
		$('#upFile').change(function () {
			$('#plus').click( function () {
				if(upFile.value!=null) {
					console.log('사진 이름 확인 완료!'+upFile.value);
					/* 두번째 시도.. javascript */
					$('#upload_line1').css('display','inline');
					
					
					/* 첫번째 시도... JQuery */
					/* const table = document.getElementById('writeTB');
					const tr = document.createElement('tr');
					
					table.append($('<tr>').attr('border','1px')
						 	.append($('<td>').attr('colspan','2')
						 		.append($('<img>').attr({ 
						 			id: 'uploadImg2', src: '${path}/resources/img/plusImg원본.png'
					 			})
						 		.after($('<div>').addClass('custom-file').attr('width','400px')
						 			.append($('<input>').addClass('custom-file-input').attr({
						 				type: 'file',
						 				name: 'upFile2',
						 				id: 'upFile2'
						 			})
						 			.after($('<label>').addClass('custom-file-label').attr('for','upFile2').css({
						 				width: '400px',
						 				marginLeft: '50px'
						 			})
						 			.after($('<img>').attr({
						 				id: 'plus2',
						 				src: '${path}/resources/img/plusIcon.png'
						 			}))
						 			.after($('<img>').attr({
						 				id: 'minus2',
						 				src: '${path}/resources/img/minusIcon.png'
						 			}))
						 			)))))); */
					
				}
				else {
					console.log('사진 이름 확인 불가능!');
					alert('사진을 업로드 진행하세요.');
					plus.off('click');
				}
			});
		});
	});
</script>


	<!-- footer 설정 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>