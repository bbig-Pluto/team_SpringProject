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

<link href="${path}/resources/css/exercise.css" rel="stylesheet">
<style>
</style>
<script>
	window.onload = function() {
		// accordion_tab();
		exercise_button_add();
		exercise_button_del();
		exercise_allcheck();
	}
	// function accordion_tab() {
	//     let tab_accordion_tab = document.querySelectorAll(".tab_accordion_tab");
	//     let tab_accordion_content = document.querySelectorAll(".tab_accordion_content");
	// for (let i = 0; i < tab_accordion_tab.length; i++) {
	//     tab_accordion_tab[i].addEventListener("click", function (event) {
	//         for (let j = 0; j < tab_accordion_content.length; j++) {
	//             tab_accordion_content[j].style.display = "none";
	//             tab_accordion_content[i].style.display = "block";
	//         }
	//     })
	//     tab_accordion_tab[i].addEventListener("click", function (event) {
	//     })
	// }
	// }

	// exercise_allcheck 전체 체크, 해제
	function exercise_allcheck() {
		let exercise_allcheck = document.querySelector("th input[type='checkbox']"); // 전체체크 버튼
		exercise_allcheck.addEventListener("change", function(e) { // 전체체크 클릭했을때
			let one_check = document.querySelectorAll("input[name='exercise_check']");	
			for (let i = 0; i < one_check.length; i++) {
				one_check[i].checked = e.target.checked;

				if (exercise_allcheck.checked === true) {
					one_check[i].value
					console.log(one_check[i].value);
				}
			}
		})
	}
	// exercise_allcheck 전체 체크, 해제 끝

	// exercise_add 입력받은 내용 추가
	function exercise_button_add() {
		let textadd = document.querySelector(".exercise_button_add");
		textadd
				.addEventListener(
						"click",
						function() {
							let exercise_text = document
									.querySelector(".exercise_text").value;
							let exercise_tbody = document
									.querySelector(".exercise_tbody");
							let exercise_time = document
									.querySelector(".exercise_time").value;

							let exercise_tr = document
									.querySelectorAll(".exercise_tr")
							// let exercise_td = document.querySelectorAll("tbody td")

							// 운동기록량 제한걸었음
							if (exercise_text != "" && exercise_tr.length <= 6) {
								let html = exercise_tbody.innerHTML;
								html += '<tr class=exercise_tr>';
								html += '   <td><input type="checkbox" name="exercise_check"></td>';
								html += '   <td> <b class="exercise_Date">'
										+ " sysdate : " + '</b> <b>'
										+ exercise_text + '</b> </td>';
								html += '<td>' + exercise_time + '</td>';
								html += '</tr>';
								exercise_tbody.innerHTML = html;
							} else if (exercise_tr.length > 6) {
								confirm("최근 일주일 간의 기록만 입력 가능합니다\n운동 삭제 후 추가 해주세요");
							}
						})
	}
	// exercise_add 입력받은 내용 추가 끝

	// exercise_del 체크된 내용 삭제
	function exercise_button_del() {
		let exercise_button_del = document
				.querySelector(".exercise_button_del");
		exercise_button_del.addEventListener("click", function() {
			let exercise_check = document
					.querySelectorAll("input[name='exercise_check']:checked");
			for (let i = 0; i < exercise_check.length; i++) {
				exercise_check[i].parentNode.parentNode.remove("tr");
			}
		})
	}
	// exercise_del 체크된 내용 삭제 끝
</script>

</head>
<body>
	<header>
		<div class="wrapper">
			<h1>
				<!-- 				<img class="headerLogo" src="./3syl.png"><a href=""></a> -->
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



										<form action="/hj01/test/test.do" method="POST">
											<table class="exercise_all_table">
												<thead>
													<tr>
														<th><input type="checkbox">
														<th class="exercise_all_checkbox1">운동 전체 선택</th>
														</th>
													</tr>
												</thead>
												<tbody class="exercise_tbody">
													<c:forEach var="exercise_list" items="${exercise_list}">
														<tr class="exercise_tr">
															<td><input type="checkbox" name="exercise_check"
																value="${exercise_list.seq_Exercise}"></td>
															<td><b class="exercise_Date">${exercise_list.exercise_Today}
																	: </b><b>${exercise_list.exercise_Contents}</b></td>
															<td>${exercise_list.exercise_Time}</td>
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
												</select> <input type="submit" value="운동추가"
													class="exercise_button_add"></input> <input type="button"
													value="운동수정" class="exercise_button_update"></input> <input
													type="button" value="운동삭제" class="exercise_button_del"></input>
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