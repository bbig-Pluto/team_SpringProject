<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>

<% HttpSession logOnSession = request.getSession(); %>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title> 운동일지 </title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">

<link href="${path}/resources/lhj/exercise.css" rel="stylesheet">
<style>
</style>
<script>
window.onload = function () {


	session();	
	all_check();
// 	button_add();
// 	button_del();
// 	button_update();
	one_check();
	tab_accordion_tab();
	record_check();
	
	
	// 마이페이지 세션
	let popupWidth = 470;
	let popupHeight = 140;
	// 브라우저 기준 중앙 정렬			
	let popupX = (document.body.offsetWidth / 2) - (popupWidth / 2);
	let popupY = (window.screen.height / 2) - (popupHeight / 2);
				
	document.querySelector("#myPageLink").addEventListener("click", function(e) {
		<% if ((""+logOnSession.getAttribute("isLogon")).equals("member")) { %>
			window.open('${path}/member/rd/inputpwdformypage', '비밀번호 재확인', 'width=' + popupHeight + ', height=' + popupHeight + ', left='+ popupX + ', top=' + popupY + ', scrollbars=yes');
		<% } else { %>
			alert("로그인이 필요한 서비스입니다.");				
		<% } %>
	})
	
	
}
function session() {
<%HttpSession userInfo = request.getSession(); // 세션 가져와서
String isLogon = "guest";

if (userInfo.isNew()) { // 세션도 없고 로그인도 없이 직접 주소창에 들어온 Case, 세션을 여기서 생성하고, 달력페이지로 튕겨냄
	userInfo.setAttribute("isLogon", "guest");
	response.sendRedirect("/syl/calendarM"); // 세션 없고, 로그인 없이 들어오면 캘린더로 보냄
} else if (userInfo.getAttribute("logOn.id") == null) { // 세션은 만들었는데, 로그인은 안 한 케이스
	isLogon = "guest";
} else { // 세션도 만들었고, 로그인도 하고 들어온 Case
	isLogon = "member";
}%>

	// 운동추가버튼 session제한
	document.querySelector(".button_add").addEventListener("click",function(e) {
	e.preventDefault();
	<%if (!(isLogon.equals("member"))) {%>
		e.preventDefault();
		alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
	<%} else {%>
// 	ec_box.submit();
// exercise_add 입력받은 내용 추가

			let exercise_text = document.querySelector(".exercise_text").value;
			let exercise_tbody = document
				.querySelector(".exercise_tbody"); // innerHTML 사용 (이 안에 넣겠다)
			let exercise_select_time = document
				.querySelector(".exercise_select_time").value;
			let exercise_tr = document
				.querySelectorAll(".exercise_tr");

			//  입력한 내용이 null이 아니며 공백이 아니면서
			//	입력한 시간이 null이 아니며 공백이 아니면 아래 내용 실행
			if(exercise_text != null && exercise_text.trim() && exercise_select_time !=null && exercise_select_time.trim()) {
				console.log("입력 했을 경우")
			// 운동기록량 제한걸었음 // 제한 품
				if (exercise_select_time != "" && exercise_tr.length <= 10) {
					let html = exercise_tbody.innerHTML;
					html += '<tr class=exercise_tr>';
					html += '   <td><input type="checkbox" name="seq_Exercise"></td>';
					html += '   <td class= "contents_td"> <b class="exercise_Date"></b><br><b>'
						+ exercise_text + '</b> </td>';
					html += '<td class= "contents_td2">' + exercise_select_time + '</td>';
					html += '</tr>';
					exercise_tbody.innerHTML = html;

					// 추가버튼 누르면 submit으로 타입변환
					document.querySelector(".button_add").setAttribute("type", "submit");
					ec_box.method = "post";
					ec_box.action = "${path}/exercise/ec_add.do";
					ec_box.submit(); // 	세션이 있는데 logOn.id도 있으면
					
				} else if (exercise_tr.length > 10) {
					alert(" 최근 기록만 입력 가능합니다\n운동 삭제 후 추가 해주세요")
				}
		}else{
			console.log("입력 없을 경우")
			alert(" 추가할 내용과 시간을 입력하세요 ")
		}
// exercise_add 입력받은 내용 추가 끝
	<%}%>
	})
	
	// 운동삭제버튼 session제한
	document.querySelector(".button_del").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면

		
		
		// exercise_del 체크된 내용 삭제

				let count = 0;
				let one_check = document.querySelectorAll("input[name='seq_Exercise']:checked");
				for (let i = 0; i < one_check.length; i++) {	// 체크되면 count 증가
					// .checked
					count++;
					console.log("for count : " + count);
				}
				if (count === 0) {
					alert("삭제할 값을 선택해주세요");
					console.log("count true : ", count);
				} else if (count >= 1) {
					console.log("count else : ", count);
					// 			let one_check = document.querySelectorAll("input[name='seq_Exercise']:checked");

					// 아래 remove가 아니고 값을 갖고온 후 액션 보내면 될 듯 후에  주석처리

					// 			for (let i = 0; i < one_check.length; i++) {
					// 				one_check[i].parentNode.parentNode.remove("tr");
					// 			}
					document.querySelector(".button_del").setAttribute("type", "submit");
					ec_box.method = "post";
					ec_box.action = "${path}/exercise/ec_del.do";
					ec_box.submit(); 
				}

		// exercise_del 체크된 내용 삭제 끝
		
		
		
		<%}%>
	})
	
	
	
	// 운동수정버튼 session제한
	document.querySelector(".button_update").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면
		

			// 수정 버튼을 클릭했을때
				console.log("button_update.addEventListener 시작");

				// 방법 checked 된것의 length를 가져와봄
				// conut 체크된 값 넣을 변수
				let count = 0;
				let one_check2 = document.querySelectorAll("input[name='seq_Exercise']:checked");
				for (let i = 0; i < one_check2.length; i++) {	// 체크되면 count 증가
					// one_check2.checked
					count++;
					console.log("for count : " + count);
				}
				if (count === 0) {
					alert("수정할 값을 선택해주세요");
					console.log("count true : ", count);
				} else if (count >= 1) {
					console.log("count else : ", count);

					// 체크된 값
					let one_check_data = document.querySelectorAll("input[name='seq_Exercise']:checked");
					console.log("one_check_data 확인 : ", one_check_data);
					for (let i = 0; i < one_check_data.length; i++) {

						one_check_data[i].value	// 이 값을 td에 넣음
						console.log("one_check_data.value 확인: ", one_check_data[i].value); // 값 갖고온거 확인


						// 기존에 적은 내용임 > value를 innerhtml value에 입히기 위해 가져옴
						let contents_text = document.querySelector(".contents_text[data-id='" + one_check_data[i].value + "']");
						console.log("contents_text 확인 : ", contents_text);
						console.log("contents_text 확인 : ", document.querySelector(".contents_text[data-id='" + one_check_data[i].value + "']"));

						// td = 운동내용 안에 input 그리기
						let contents_td = document.querySelector(".contents_td[data-id='" + one_check_data[i].value + "']"); // innerHTML 사용 (이 안에 넣겠다)
						console.log("contents_td 확인 : ", document.querySelector(".contents_td[data-id='" + one_check_data[i].value + "']")); // 체크된 값 갖고옴
						
						let html = contents_td.innerHTML;
						console.log("확인 : ", contents_td.innerHTML);
						html += '<b>'
						html +=	'<input type="text" class ="exercise_Contents" name="exercise_Contents" value="'
						html += contents_text.innerText
						html += '">'
						html += '</b>'
						contents_td.innerHTML = html;
						console.log("그린거확인 = td : ", contents_td.innerHTML = html);
						// td2 = 시간 안에 select박스 그리기 > 이 value를 내가 그린 innerhtml의 value에 넣어야 함
						let time_Date = document.querySelector(".time_Date[data-id='" + one_check_data[i].value + "']");
						let contents_td2 = document.querySelector(".contents_td2[data-id='" + one_check_data[i].value + "']");
						let html_2 = contents_td2.innerHTML;
						html_2 += '<b class="time_Date"[data-id='
						html_2 += " ' + one_check_data[i].value + ']>"
						html_2 += '<select class="exercise_time" name="exercise_Time">'
						html_2 += '<option value="' + time_Date.innerText + '">' + time_Date.innerText
						html_2 += '</option>'
						html_2 += '<option value="10분">10분</option>'
						html_2 += '<option value="20분">20분</option>'
						html_2 += '<option value="30분">30분</option>'
						html_2 += '<option value="40분">40분</option>'
						html_2 += '<option value="50분">50분</option>'
						html_2 += '<option value="1시간">1시간</option>'
						html_2 += '</select></b>'
						contents_td2.innerHTML = html_2;
						console.log("그린거확인 = td2 : ", contents_td2.innerHTML = html_2);

						// remove로 기존 내용들을 지움
						document.querySelector(".contents_text[data-id='" + one_check_data[i].value + "']").remove(); // 기존 내용 remove
						document.querySelector(".time_Date[data-id='" + one_check_data[i].value + "']").remove(); // 기존 시간 remove
					}



					// remove로 수정버튼을 지움
					document.querySelector(".button_update").remove();
					let btn_span = document.querySelector(".btn_span");
					let btn_html = btn_span.innerHTML;
					btn_html += '<input type="submit" class="button_update2">'
					btn_span.innerHTML = btn_html;

					let button_update2 = document.querySelector(".button_update2");
					console.log("제출버튼 그려짐", button_update2); // innerhtml 그려지고 난 후 확인

					ec_box.method = "post";
					ec_box.action = "${path}/exercise/ec_update.do";
				}
				console.log("button_update.addEventListener 종단");



		
		<%}%>
	})

	document.querySelector(".inbody_delete").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있고 logOn.id도 있으면
			
			let count = 0;
			let one_checkd = document.querySelectorAll("input[name='seq_Exercise']:checked");
				for (let i = 0; i < one_checkd.length; i++) {	// 체크되면 count 증가
					// .checked
					count++;
					console.log("for count : " + count);
				}
				if (count === 0) {
					alert("삭제할 값을 선택해주세요");
					console.log("count true : ", count);
				} else if (count >= 1) {
					console.log("count else : ", count);

				record_delete.submit();
				}
		<%}%>

	})

}

						// all_check 전체 체크, 해제
						function all_check() {
							let all_check = document.querySelector("th input[type='checkbox']"); // 전체체크버튼


							// 
							// 전체 선택이 change 일때
							all_check.addEventListener("change", function (e) {
								// let one_check = document.querySelectorAll("input[name=seq_Exercise]"); // 하나 클릭
								let one_check = document.querySelectorAll(".seq_class"); // 하나 클릭
								// one_check 사이즈 만큼 증가하고
								for (let i = 0; i < one_check.length; i++) {
									// one_check[i]가 이벤트 되어 체크된다 
									one_check[i].checked = e.target.checked;

									// if 체크되었다면 one_check의 값을 가져오고
									if (all_check.checked === true) {
										one_check[i].value
										console.log(one_check[i].value);
									}
								}
							})
						}

						// 하나 체크
						function one_check() {
							let one_check = document.querySelectorAll("input[name='seq_Exercise']"); // 하나 클릭

							for (let i = 0; i < one_check.length; i++) {
								one_check[i].addEventListener("click", function (e) {
									one_check[i].checked = e.target.checked;
									// 체크된 값 갖고옴
									if (e.target.checked === true) {
										one_check[i].value;
										console.log(e.target.value);
									}
								})
							}
						}

						// all_check 전체 체크, 해제 끝
						

						// 운동종류 아코디언
						function tab_accordion_tab() {
							let tab_accordion_tab = document.querySelectorAll(".tab_accordion_tab");
							let tab_accordion_content = document.querySelectorAll(".tab_accordion_content");
							for (let i = 0; i < tab_accordion_tab.length; i++) {
								tab_accordion_tab[i].addEventListener("click", function (event) {
									for (let j = 0; j < tab_accordion_content.length; j++) {
										tab_accordion_content[j].style.display = "none";
										tab_accordion_content[i].style.display = "block";
									}
								})
								tab_accordion_tab[i].addEventListener("click", function (event) {
								})
							}
						}

						// 운동 기록 체크한거 가져오기
						function record_check() {
						let record_check = document.querySelectorAll("input[name='record_checkbox']");

						for (let i = 0; i < record_check.length; i++) {
								record_check[i].addEventListener("click", function (e) {
									record_check[i].checked = e.target.checked;
									// 체크된 값 갖고옴
									if (e.target.checked === true) {
										record_check[i].value;
										console.log(e.target.value);
									}
								})
							}
						}


</script>

</head>

<body>
	<header>
		<div class="wrapper">
            <h1>
               <a href="${ path }/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ path }/bar/intro" class="headersub">다이어리 소개 |</a> 
               <a href="${ path }/bar/story11" class="headersub">다이어리 구성 |</a> 
               <a href="${ path }/bar/func" class="headersub">다이어리 기능 |</a> 
               <a href="${ path }/bar/shot11"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ path }/notice" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a href="#" id="myPageLink" class="headermypage">마이페이지</a>
 					<c:choose>
	                  <c:when test="${empty sessionId }">
		                  <a href="/syl/member/login" class="headerlogin">로그인</a>
	                  </c:when>
		                  <c:otherwise>
			                  <a href="/syl/member/logout.do" class="headerloginout">로그아웃</a>
		                  </c:otherwise>
                  </c:choose>
               </div>
            </nav>
         </div>
	</header>

	<main>
		<section>
			<article>
				<div class="area_wrapper">
					<div class="calendarWhole">
						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->


						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 탭 tab ec -->
						<div class="tab_ec_box">
							<div class="tab_ec_box1">
								<button id="tab_ec_E" class="tab_ec_tab">운동일지 만들기</button>
								
								<a href="/syl/inbody/ec_list.do" id="myPageLink" class="headermypage">
									<button id="tab_ec_F" class="tab_ec_tab">바디 기록실</button>
								</a>
<!-- 								<button id="tab_ec_G" class="tab_ec_tab">G</button> -->
<!-- 								<button id="tab_ec_H" class="tab_ec_tab">H</button> -->
							</div>

							<!-- exercise_tap_E -->
							<div class="tab_ec_box2">
								<div id="tab_ec_E1" class="tab_ec_content">
									<!-- <div class="tab_ec_Contents"> -->
									<!-- exercise_checkbox 시작 -->

									<div class="exercise_checkbox">
										<caption>
											<h1 class="exercise_caption">나만의 운동 만들기</h1>
										</caption>



										<form name="ec_box">
											<table class="exercise_all_table">
												<thead>
													<tr>
														<th><input type="checkbox"></th>
														<th class="exercise_all_checkbox1">운동 전체 선택</th>
													</tr>
												</thead>
												<tbody class="exercise_tbody">
													<c:forEach var="exercise_list" items="${exercise_list}">
														<tr class="exercise_tr">
															<td><input type="checkbox" name="seq_Exercise" value="${exercise_list.seq_Exercise}" class="seq_class"></td>
															<td class="contents_td" data-id="${exercise_list.seq_Exercise}"><b class="exercise_Date" data-id="${exercise_list.seq_Exercise}">${exercise_list.exercise_Today}<br></b>
																<b class="contents_text" data-id="${exercise_list.seq_Exercise}">${exercise_list.exercise_Contents}</b>
															</td>
															<td class="contents_td2" data-id="${exercise_list.seq_Exercise}">
																<b class="time_Date" data-id="${exercise_list.seq_Exercise}">${exercise_list.exercise_Time}</b>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="exercise_text_button_box">
												<input type="text" class="exercise_text"
													placeholder="추가할 운동을 입력하세요" name="exercise_Contents">
												<select class="exercise_select_time" name="exercise_Time">
													<option value="">시간</option>
													<option value="10분">10분</option>
													<option value="20분">20분</option>
													<option value="30분">30분</option>
													<option value="40분">40분</option>
													<option value="50분">50분</option>
													<option value="1시간">1시간</option>
												</select> <input type="button" value="운동추가" class="button_add">
												<span class="btn_span"> <input type="button"
													value="운동삭제" class="button_del"> <input
													type="button" value="운동수정" class="button_update">
												</span>
											</div>
										</form>

										<!-- exercise_checkbox 끝 -->
										<div class="exercise_reservation">
											<p>${ ment }</p>
										</div>
									</div>

									<div class="exercise_reservation2">
										<!-- 탭 tab accordion -->
										<div class="tab_accordion_box">
											<h3 class="tab_accordion_h3">운동 종류 보기</h3>
											<div class="tab_accordion_box1">
												<button id="tab_accordion_A" class="tab_accordion_tab">상체</button>
												<button id="tab_accordion_B" class="tab_accordion_tab">하체</button>
												<button id="tab_accordion_C" class="tab_accordion_tab">가슴</button>
												<button id="tab_accordion_D" class="tab_accordion_tab">등</button>
												<button id="tab_accordion_E" class="tab_accordion_tab">어깨</button>
												<button id="tab_accordion_F" class="tab_accordion_tab">팔</button>

											</div>
											<!-- 내용물 -->
											<div class="tab_accordion_box2">
												<div id="tab_accordion_A1" class="tab_accordion_content">
													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">푸쉬업</div>
															<div class="add_content">효과 : 상체 강화 코어 단련</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">딥스</div>
															<div class="add_content">효과 : 어깨 팔 가슴 단련</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">벤치프레스</div>
															<div class="add_content">효과 : 근매스의 증가, 운동능력 향상</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">밀리터리 프레스</div>
															<div class="add_content">효과 : 상체 근육을 부위별로 골고루 발달</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">덤벨 프론트 레이즈</div>
															<div class="add_content">효과 :삼각근을 발달, 근육을 단련 시키는데
																도움</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">브릿지</div>
															<div class="add_content">효과 :체지방을 태우는데 효과적, 허리 코어를
																단련, 자세를 교정하는데 도움</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">덤벨 킥백</div>
															<div class="add_content">효과 : 팔뚝살을 빼는데 도움, 팔 근육 단련</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">덤벨 컬</div>
															<div class="add_content">효과 : 팔뚝살을 빼는데 도움, 팔의 라인을
																잡아줌</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">풀업 철봉(턱걸이)</div>
															<div class="add_content">효과 : 상체를 집중적으로 가꿀 수 있는 운동,
																등 근육에 효과적</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">숄더 프레스</div>
															<div class="add_content">효과 : 어깨 근육(삼각근)의 전면과 측면
																부위의 근매스를 올리기 효과적</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">딥스 운동</div>
															<div class="add_content">효과 : 목, 팔꿈치, 어깨 등의 관절이 운동에
																관여, 관절을 튼튼하게 만드는데 도움</div>
															<hr>
														</div>
													</div>
												</div>

												<div id="tab_accordion_B1" class="tab_accordion_content">

													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">스쿼트</div>
															<div class="add_content">효과 : 관절의 안정성과 자세를 개선, 유연성을
																향상</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">스쿼트 덤벨</div>
															<div class="add_content">효과 : 대퇴사두근과 둔근의 효과</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">와이드 스쿼트</div>
															<div class="add_content">효과 : 유산소 운동 효과, 체중 감량에 도움</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">카프레이즈</div>
															<div class="add_content">효과 : 종아리 근육을 단련, 발목의 근육을
																강화, 부상의 위험을 예방</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">점프 스쿼트</div>
															<div class="add_content">효과 : 허벅지 안쪽을 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">런지</div>
															<div class="add_content">효과 : 균형감각 향상, 엉덩이와 허벅지의 군살
																제거</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">하이 니 런지</div>
															<div class="add_content">효과 : 무릎 강화, 하체 안정화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">레그 익스텐션</div>
															<div class="add_content">효과 :혈액순환이 촉진되어 스트레칭 효과,
																무릎관절에 도움</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">레그 프레스</div>
															<div class="add_content">효과 :허벅지 근력 향상 효과, 엉덩이 근육을
																발달</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">레그컬</div>
															<div class="add_content">효과 : 허벅지 뒤쪽 근육을 단련, 하체 근육을
																균형적으로 발달</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">힙 어덕션</div>
															<div class="add_content">효과 : 허벅지 안쪽 자극</div>
															<hr>
														</div>
													</div>
												</div>

												<div id="tab_accordion_C1" class="tab_accordion_content">
													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">벤치프레스</div>
															<div class="add_content">효과 : 근매스의 증가, 운동능력 향상</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">체스트 프레스</div>
															<div class="add_content">효과 : 가슴 및 팔 근육 단련</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">푸쉬업</div>
															<div class="add_content">효과 : 전반적인 가슴 자극 근육 단련</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">니 푸쉬업</div>
															<div class="add_content">효과 : 초급 버전 푸쉬업</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">다이아몬드 푸쉬업</div>
															<div class="add_content">효과 : 가슴 안쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">덤벨 플라이</div>
															<div class="add_content">효과 : 가슴 바깥쪽 라인</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">숄더 탭 푸쉬업</div>
															<div class="add_content">효과 : 어깨 주변 근육 및 안정화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">체스트 프레스(플레이트 로디드)</div>
															<div class="add_content">효과 : 넓은 가슴 만들기</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">체스트 프레스(밴드)</div>
															<div class="add_content">효과 : 전반적인 가슴 발달</div>
															<hr>
														</div>
													</div>
												</div>

												<div id="tab_accordion_D1" class="tab_accordion_content">
													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">랫 풀다운</div>
															<div class="add_content">효과 : 넓고 긴 광배근 만들기</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">원 암 덤벨 로우</div>
															<div class="add_content">효과 : 광배 수축</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">시티드 로우(케이블)</div>
															<div class="add_content">효과 : 두꺼운 광배근 만들기</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">바벨 로우</div>
															<div class="add_content">효과 : 두께감 있는 등</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">트위스트 슈퍼맨</div>
															<div class="add_content">효과 : 코어 및 기립근 집중</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">데드리프트</div>
															<div class="add_content">효과 : 3대 운동, 전신 복합 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">풀 업</div>
															<div class="add_content">효과 : 넓은 어깨와 등</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">시티드 로우</div>
															<div class="add_content">효과 : 광배근 집중</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">암 폴다운</div>
															<div class="add_content">효과 : 강력한 등 근육 수축</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">슈퍼맨 로우</div>
															<div class="add_content">효과 : 코어, 등 및 힙업</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">어시스트 풀업(머신)</div>
															<div class="add_content">효과 : 풀 업 보조 및 넓은 등</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">티 바 로우</div>
															<div class="add_content">효과 : 전체적인 등 성장</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">W 레이즈</div>
															<div class="add_content">효과 : 등 및 승모근 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">T 레이즈</div>
															<div class="add_content">효과 : 등 및 승모근 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">A 레이즈</div>
															<div class="add_content">효과 : 등 및 승모근 강화</div>
															<hr>
														</div>
													</div>
												</div>
												<div id="tab_accordion_E1" class="tab_accordion_content">
													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">숄더 프레스(덤벨)</div>
															<div class="add_content">효과 : 태평양 같은 넓은 어깨</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">숄더 프레스(머신)</div>
															<div class="add_content">효과 : 어깨 볼륨 키우기</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">오버헤드 프레스</div>
															<div class="add_content">효과 : 전반적인 어깨 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">힌두 푸쉬업</div>
															<div class="add_content">효과 : 어깨 및 삼두 집중 푸쉬업</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">프론트 레이즈(덤벨)</div>
															<div class="add_content">효과 : 전면부 어깨 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">벤트오버 레터럴 레이즈</div>
															<div class="add_content">효과 : 후면부 어깨</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">플랭크</div>
															<div class="add_content">효과 : 코어 및 어깨 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">파이크 푸쉬업</div>
															<div class="add_content">효과 : 어깨 집중 푸쉬업</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">페이스 풀</div>
															<div class="add_content">효과 : 후면부 어깨 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">아놀드 프레스</div>
															<div class="add_content">효과 : 측면 및 전면부 어깨</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">슈러그(덤벨)</div>
															<div class="add_content">효과 : 상부 승모근</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">에어 레터럴 레이즈</div>
															<div class="add_content">효과 : 쉬운 어깨 자극</div>
															<hr>
														</div>
													</div>
												</div>
												<div id="tab_accordion_F1" class="tab_accordion_content">
													<div class="tab_accordion_Contents">
														<div class="content_box">
															<div class="ec_content">이두 : 바이셉 컬</div>
															<div class="add_content">효과 : 매끄러운 팔 및 앞쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 해머 컬</div>
															<div class="add_content">효과 : 매끄러운 팔 및 앞쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 프리쳐 컬</div>
															<div class="add_content">효과 : 팔 앞쪽 자극</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 리버스 컬</div>
															<div class="add_content">효과 : 팔뚝 및 팔 앞쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 리버스 푸쉬업</div>
															<div class="add_content">효과 : 두꺼운 팔뚝 만들기</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 스탠딩 플라이</div>
															<div class="add_content">효과 : 가슴 자극 및 어깨 라인</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">이두 : 시티드 넥 탭</div>
															<div class="add_content">효과 : 팔뚝살 앞쪽</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 벤치 딥스</div>
															<div class="add_content">효과 : 팔뚝살 및 팔 뒷쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 트라이셉 푸쉬다운</div>
															<div class="add_content">효과 : 팔뚝살 및 팔 뒷쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 라잉 프라이셉 익스텐션</div>
															<div class="add_content">효과 : 볼륨감 있는 팔 뒷쪽 발달</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 체어 딥스</div>
															<div class="add_content">효과 : 팔뚝살 뒷쪽</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 스트레이트 암 킥백</div>
															<div class="add_content">효과 : 삼두 집중 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 트라이셉 푸쉬다운</div>
															<div class="add_content">효과 : 팔뚝살 및 팔 뒷쪽 강화</div>
															<hr>
														</div>
														<div class="content_box">
															<div class="ec_content">삼두 : 트라이셉 킥백</div>
															<div class="add_content">효과 : 팔뚝살 및 팔 뒷쪽 강화</div>
															<hr>
														</div>
													</div>
												</div>
											</div>
                                            <div class="lnbody_scroll_box">
                                                <h3 class="lnbody_scroll_caption">운동 기록</h3>
                                                <div class='scrolltable'>
                                                    <form action="${path}/record/delete.do" method="post" name="record_delete">
                                                        <table class="lnbody_scroll_table" border="1">
                                                            <thead>
                                                                <tr class="lnbody_scroll_tr">
                                                                    <th class="lnbody_scroll_th_checkbox"></th>
                                                                    <th class="lnbody_scroll_th_No">NO</th>
                                                                    <th class="lnbody_scroll_th_Today">날짜</th>
                                                                    <th class="lnbody_scroll_th_Contents">내용</th>
                                                                    <th class="lnbody_scroll_th_Time">시간</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="selectList" items="${selectList}" varStatus="var_count">
                                                                    <tr>
                                                                        <td class=""><input type="checkbox" name="seq_Exercise" value="${selectList.seq_Exercise}"></td>
                                                                        <td class="lnbody_scroll_td_checkbox">${var_count.count}</td>
                                                                        <td class="lnbody_scroll_td">${selectList.exercise_Today}</td>
                                                                        <td class="lnbody_scroll_td">${selectList.exercise_Contents}</td>
                                                                        <td class="lnbody_scroll_td">${selectList.exercise_Time}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <input type="submit" value="삭제" class="inbody_delete">
                                                    </form>
                                                </div>
                                            </div>
										</div>
									</div>
									<!-- <div class="exercise_reservation2-1">후보1 : 날짜와 시간<br>후보2 : 그림이나 사진<br> 후보3 : 운동에 대한 tip </div> -->
									<!-- exercise_tap_1 끝 -->
								</div>
							</div>
						</div>

						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간 끝!!!!!!!!!!!!!!!! -->
					</div>

					<!-- 위쪽 반원 -->
					<div class="calendarLT"></div>
					<div class="calendarRT"></div>

					<!-- 아래쪽 좌측 반원 -->
					<div class="calendarLB1"></div>
					<div class="calendarLB2"></div>
					<!-- <div class="calendarLB3"></div> -->
					<!-- 아래쪽 우측 반원 -->
					<div class="calendarRB1"></div>
					<div class="calendarRB2"></div>
					<!-- <div class="calendarRB3"></div> -->

					<!-- 4개의 대각선 -->
					<div class="diagonalRT"></div>
					<div class="diagonalLT"></div>
					<div class="diagonalRB"></div>
					<div class="diagonalLB"></div>

					<!-- 중앙선 -->
					<div class="lineM"></div>
					<div class="lineL"></div>
					<div class="lineR"></div>

					<!-- 왼쪽 직선 3개 -->
					<div class="leftLine1"></div>
					<div class="leftLine2"></div>
					<div class="leftLine3"></div>
					<!-- 오른쪽 직선 3개 -->
					<div class="rightLine1">
						<!--  여기 Index에 이동 a링크 구성하기 -->
						<a href='${ Path }/syl/todo'>
						<div class="postTodo It1">todo<br>memo</div>
						</a>
						
						<a href='${ Path }/syl/diaryList'>
						<div class="post1 It2">Diary</div>
						</a>
						
						<a href='${ Path }/syl/diet_1page.do'>
						<div class="post1 It3">Diet</div>
						</a>
						

						<a href='${ Path }/syl/mainwish'>
						<div class="post1 It5">Wish</div>
						</a>
					</div>
					<div class="rightLine2">
<!-- 						<div class="post2 It1"></div> -->
						<a href='${ Path }/syl/ec_list.do'>
						<div class="post2 It4">Exercise</div>
						</a>

						<div class="post2 It6"></div>
						<div class="post2 It7"></div>
						<div class="post2 It8"></div>
					</div>
					<div class="rightLine3"></div>

					<!-- 책표지 부분 -->
					<div class="LMR"></div>
					<div class="RT"></div>
					<div class="LL"></div>
					<div class="RR"></div>
					<div class="LT"></div>

				</div>
			</article>
		</section>
	</main>

	<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="/syl/resources/photo/logo2.png">
				<img class="left_logo2" src="/syl/resources/photo/3syl2.png">
			</div>

			<div class="rc2">
				We ONLY contact to email during office(9-6 KTS) hours for
				assistance, as emails regarding SYL service team.<br> Do NOT
				send multiple emails as it delays our ability to respond in a timely
				manner.

			</div>
			<div class="right_contact">
				<div class="rc">Contact Us</div>
				<br> SYL <br> Our Company Information<br> E-mail:
				syL2022@email.com<br>
			</div>

			<div class="middle_copyRight">
				<div class="mc1">이용약관</div>
				<div class="mc2">개인정보 처리방침</div>
				<div class="mc3">2022 SYL Inc. All rights reserved. This site
					for our customers.</div>

			</div>
		</div>
	</footer>
</html>