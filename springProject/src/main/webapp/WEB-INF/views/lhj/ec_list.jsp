<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="${path}/resources/lhj/exercise.css" rel="stylesheet">
<style>
</style>
<script>
	window.onload = function() {

		all_check();
		button_add();
		button_del();
		button_update();
		one_check();
	}

	// all_check 전체 체크, 해제
	function all_check() {
		let all_check = document.querySelector("th input[type='checkbox']"); // 전체체크버튼

		// 전체 선택이 change 일때
		all_check.addEventListener("change", function(e) {
			let one_check = document
					.querySelectorAll("input[name=seq_Exercise]"); // 하나 클릭
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
		one_check.value;
		console.log(one_check.value);

		for (let i = 0; i < one_check.length; i++) {
			one_check[i].addEventListener("click", function(e) {
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

	// exercise_add 입력받은 내용 추가
	function button_add() {
		let textadd = document.querySelector(".button_add"); // 추가버튼
		textadd
				.addEventListener(
						"click",
						function() {

							let exercise_text = document
									.querySelector(".exercise_text").value;
							let exercise_tbody = document
									.querySelector(".exercise_tbody"); // innerHTML 사용 (이 안에 넣겠다)
							let exercise_time = document
									.querySelector(".exercise_time").value;

							let exercise_tr = document
									.querySelectorAll(".exercise_tr")
							// let exercise_td = document.querySelectorAll("tbody td")

							// 운동기록량 제한걸었음
							if (exercise_text != "" && exercise_tr.length <= 6) {
								let html = exercise_tbody.innerHTML;
								html += '<tr class=exercise_tr>';
								html += '   <td><input type="checkbox" name="seq_Exercise"></td>';
								html += '   <td class= "contents_td"> <b class="exercise_Date">'
										+ " ex)sysdate " + '</b> <br> <b>'
										+ exercise_text + '</b> </td>';
								html += '<td class= "contents_td2">' + exercise_time + '</td>';
								html += '</tr>';
								exercise_tbody.innerHTML = html;

								// 추가버튼 누르면 submit으로 타입변환
								textadd.setAttribute("type", "submit");
								ec_box.method = "post";
								ec_box.action = "${path}/exercise/ec_add.do";

							} else if (exercise_tr.length > 6) {
								alert("최근 일주일 간의 기록만 입력 가능합니다\n운동 삭제 후 추가 해주세요")
							}
						})
	}
	// exercise_add 입력받은 내용 추가 끝

	// exercise_del 체크된 내용 삭제
	function button_del() {
		let button_del = document.querySelector(".button_del"); // 삭제버튼
		button_del.addEventListener("click", function() {
			// 			let one_check = document.querySelectorAll("input[name='seq_Exercise']:checked");

			// 아래 remove가 아니고 값을 갖고온 후 액션 보내면 될 듯 후에  주석처리

			// 			for (let i = 0; i < one_check.length; i++) {
			// 				one_check[i].parentNode.parentNode.remove("tr");
			// 			}

			button_del.setAttribute("type", "submit");
			ec_box.method = "post";
			ec_box.action = "${path}/exercise/ec_del.do";
		})
	}
	// exercise_del 체크된 내용 삭제 끝

	function button_update() {
		// 수정 버튼을 클릭했을때
		let button_update = document.querySelector(".button_update");
		button_update.addEventListener("click",function() {
							let one_check = document.querySelectorAll("input[name='seq_Exercise']:checked");

							
							
// 							for (let i = 0; i < one_check.length; i++) {
// 								one_check[i].parentNode.parentNode.remove("tr"); // remove로 tr을 지우고 (DB는 살아있음)
								
// 							}
// 							<td class= "contents_td">
							// 1. td안에다가 input 박스를 그린다.

							
							// td = 운동내용 안에 input 그리기
							let contents_td = document.querySelector(".contents_td"); // innerHTML 사용 (이 안에 넣겠다)
							let html = contents_td.innerHTML;
							html += '<b><input type="text" name="exercise_Contents" value="exercise_text"></b>'
							contents_td.innerHTML = html;
							
							// td2 = 시간 안에 select박스 그리기
							let contents_td2 = document.querySelector(".contents_td2");
							let html_2 = contents_td2.innerHTML;
							html_2 += '<select class="exercise_time" name="exercise_Time">'
							html_2 += 	'<option value="">시간</option>'
							html_2 += 	'<option value="10분">10분</option>'
							html_2 += 	'<option value="20분">20분</option>'
							html_2 += 	'<option value="30분">30분</option>'
							html_2 += 	'<option value="40분">40분</option>'
							html_2 += 	'<option value="50분">50분</option>'
							html_2 += 	'<option value="1시간">1시간</option>'
							html_2 += '</select>'
							contents_td2.innerHTML = html_2;

							// btn_span = 수정제출 버튼 만들기
							let btn_span = document.querySelector(".btn_span");
							let btn_html = btn_span.innerHTML;
							btn_html += '<input type="submit" class="button_update2" name="seq_Exercise">'
							btn_span.innerHTML = btn_html;
							
							
// 							let button_update = document.querySelector(".button_update");
							let button_update2 = document.querySelector(".button_update2"); // 이게 될지 모르겠음
							console.log("그려짐?", button_update2); // innerhtml 그려지고 난 후 확인

							button_update2.value = button_update.value;
							console.log(button_update2.value);
							document.querySelector(".button_update").remove(); // remove로 tr을 지우고 (DB는 살아있음)
// 							one_check[0].parentNode.parentNode.remove("tr");
							// 수정에 있는 value값을 제출로 이동
							// remove하기 전에 제출로 이동시켜야 함
							// 그러려면 제출이 그려져야 함
							
							button_update.setAttribute("type", "submit");
							ec_box.method = "post";
							ec_box.action = "${path}/exercise/ec_update.do";
						})

	}
</script>

</head>
<body>
	<header>
		<div class="wrapper">
			<h1>
				<!-- <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
			</h1>
			<nav>
				<a href class="headersub">다이어리 소개 |</a> <a href class="headersub">다이어리
					구성 |</a> <a href class="headersub">다이어리 기능 |</a> <a href
					class="headersub">다이어리 사용법 |</a> <a href class="headersub">Q&A</a>
				<div class="lgnbtn">
					<!-- <a href class="headerlogin">로그인 /</a> -->
					<a href class="headerloginout">로그아웃</a>
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
						<!-- 탭 tab accordion -->
						<div class="tab_accordion_box">
							<div class="tab_accordion_box1">
								<button id="tab_accordion_E" class="tab_accordion_tab">운동일지
									만들기</button>
								<button id="tab_accordion_F" class="tab_accordion_tab">F</button>
								<button id="tab_accordion_G" class="tab_accordion_tab">G</button>
								<button id="tab_accordion_H" class="tab_accordion_tab">H</button>
							</div>

							<!-- exercise_tap_E -->
							<div class="tab_accordion_box2">
								<div id="tab_accordion_E1" class="tab_accordion_content">
									<!-- <div class="tab_accordion_Contents"> -->
									<!-- exercise_checkbox 시작 -->
									<div class="exercise_checkbox">
										<caption>
											<div class="exercise_caption">나만의 운동 만들기</div>
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
															<td><input type="checkbox" name="seq_Exercise"
																value="${exercise_list.seq_Exercise}"></td>
															<td class="contents_td"><b class="exercise_Date">${exercise_list.exercise_Today}<br></b><b>${exercise_list.exercise_Contents}</b></td>
															<td class="contents_td2">${exercise_list.exercise_Time}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<div class="exercise_text_button_box">
												<input type="text" class="exercise_text"
													placeholder="추가할 운동을 입력하세요" name="exercise_Contents">
												<select class="exercise_time" name="exercise_Time">
													<option value="">시간</option>
													<option value="10분">10분</option>
													<option value="20분">20분</option>
													<option value="30분">30분</option>
													<option value="40분">40분</option>
													<option value="50분">50분</option>
													<option value="1시간">1시간</option>
												</select> <input type="button" value="운동추가" class="button_add">
												<span class="btn_span">
													<input type="button" value="운동삭제" class="button_del">
													<input type="button" value="운동수정" class="button_update">
												</span>
											</div>
										</form>



										<!-- exercise_checkbox 끝 -->
										<div class="exercise_reservation">
											후보1 : 날짜와 시간<br>후보2 : 그림이나 사진<br> 후보3 : 운동에 대한 tip
										</div>
									</div>

									<div class="exercise_reservation2">
										<h2>10월</h2>
										<h2>접속완료</h2>
										<table border="1">
											<thead>
												<tr>
													<td>seq_Exercise</td>
													<td>exercise_Contents</td>
													<td>exercise_Time</td>
													<td>exercise_Today</td>
													<td>session_UserId</td>
												</tr>
											</thead>
											<c:forEach var="exercise_list" items="${exercise_list}">
												<tr>
													<td>${exercise_list.seq_Exercise}</td>
													<td>${exercise_list.exercise_Contents}</td>
													<td>${exercise_list.exercise_Time}</td>
													<td>${exercise_list.exercise_Today}</td>
													<td>${exercise_list.session_UserId}</td>
												</tr>
											</c:forEach>
										</table>
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
					<div class="rightLine1"></div>
					<div class="rightLine2"></div>
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
				<!-- 				<img class="left_logo1" src="./logo2.png"> -->
				<!-- 				<img class="left_logo2" src="./3syl2.png"> -->
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