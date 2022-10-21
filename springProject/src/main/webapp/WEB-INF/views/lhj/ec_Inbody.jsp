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
<link href="${path}/resources/lhj/Inbody.css" rel="stylesheet">
<style>
/* 헤더 */
header {
	margin-bottom: 20px;
}

div.wrapper {
	width: 1240px;
}

h1 {
	width: 200px;
	margin: 0 auto;
	display: inline-block;
}

.headerLogo {
	width: 200px;
	float: left;
}

nav {
	width: 560px;
	display: inline-block;
	vertical-align: top;
	margin-top: 3%;
	margin-left: 14%;
	font-size: 16px;
}

.headersub {
	color: #223919;
	text-decoration: none;
	position: relative;
}

.headersub:before {
	content: '';
	border-radius: 100%;
	background: #214192;
	position: absolute;
	top: -10px;
	left: -20px;
	transition: all 0.2s;
}

.headersub:hover::before {
	width: 5px;
	height: 5px;
	left: 50%;
	opacity: 0.8;
}

.headersub:hover {
	color: #42568a;
}

.lgnbtn {
	font-size: 12px;
	width: 60px;
	position: absolute;
	top: 14px;
	left: 1184px;
}

.headerlogin {
	color: #223919;
	display: inline-block;
	text-decoration: none;
	position: relative;
}

.headerloginout {
	color: #223919;
	display: inline-block;
	text-decoration: none;
	position: relative;
}

.headerlogin:hover {
	color: #108269;
	font-weight: bold;
}

.headerloginout:hover {
	color: #108269;
	font-weight: bold;
}

/* ///////////////////////////////////////책안에 내용 집어넣기/////////////////////////////////////////// */
/* 전체 틀 잡기 */
/* main { */
/* border: 3px solid black; */
/* } */
.area_wrapper {
	width: 1240px;
	height: 920px;
	display: flex;
	position: absolute;
}

/* 페이지 들어갈 공간 */
.calendarWhole {
	width: 1005px;
	height: 770px;
	margin-left: 110px;
	margin-top: 65px;
	border: 2px solid rgb(115, 115, 115);
	border-top: 0px;
	border-bottom: 0px;
	position: absolute;
	z-index: 2;
	/* 배경색상1 */
	background-color: #fffdf4;
}

/* 위쪽 반원 */
.calendarLT {
	width: 505px;
	height: 150px;
	position: absolute;
	left: 110px;
	top: 0px;
	border: 3px solid black;
	border-radius: 50% 50% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	/* 배경색상2 */
	background-color: #c2e3e5;
}

.calendarRT {
	width: 504px;
	height: 150px;
	position: absolute;
	left: 615px;
	top: 0px;
	border: 3px solid black;
	border-radius: 50% 50% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	/* 배경색상3 */
	background-color: #c2e3e5;
}

/* 하좌측 반원 */
.calendarLB1 {
	width: 505px;
	height: 145px;
	position: absolute;
	left: 110px;
	top: 770px;
	border: 3px solid black;
	border-radius: 50% 50% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	z-index: 3;
	background-color: white;
}

.calendarLB2 {
	width: 380px;
	height: 120px;
	position: absolute;
	left: 185px;
	top: 847px;
	border: 3px solid black;
	border-radius: 30% 40% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	z-index: 3;
}

/* 하우측 반원 */
.calendarRB1 {
	width: 505px;
	height: 145px;
	position: absolute;
	left: 615px;
	top: 770px;
	border: 3px solid black;
	border-radius: 50% 50% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	background-color: white;
	z-index: 3;
}

.calendarRB2 {
	width: 386px;
	height: 114px;
	position: absolute;
	left: 665px;
	top: 840px;
	border: 3px solid black;
	border-radius: 40% 40% 0 0;
	border-bottom: 0px solid rgba(255, 255, 255, 0);
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-left: 0px solid rgba(255, 255, 255, 0);
	z-index: 3;
}

/* 각 사각 대각선 */
.diagonalRT, .diagonalLT {
	width: 70px;
	height: 2px;
	background-color: black;
	position: absolute;
}

.diagonalRB, .diagonalLB {
	width: 65px;
	height: 2px;
	background-color: black;
	position: absolute;
}

.diagonalRT {
	left: 1108px;
	top: 90px;
	transform: rotate(45deg);
}

.diagonalLT {
	left: 52px;
	top: 90px;
	transform: rotate(-45deg);
}

.diagonalRB {
	left: 1110px;
	top: 858px;
	transform: rotate(40deg);
}

.diagonalLB {
	left: 53px;
	top: 858px;
	transform: rotate(-40deg);
}

/* 중앙선(+좌우) */
.lineM {
	width: 100px;
	height: 2px;
	margin-left: 110px;
	margin-top: 100px;
	background-color: black;
	position: absolute;
	top: 792px;
	left: 455px;
	z-index: 3;
}

.lineL {
	width: 125px;
	height: 2px;
	background-color: black;
	position: absolute;
	top: 879px;
	left: 60px;
	z-index: 3;
}

.lineR {
	width: 120px;
	height: 2px;
	background-color: black;
	position: absolute;
	top: 880px;
	left: 1049px;
	z-index: 3;
}

/* 왼쪽 직선 3개 */
.leftLine1 {
	width: 1px;
	height: 765px;
	background-color: black;
	position: absolute;
	top: 89px;
	left: 90px;
}

.leftLine2 {
	width: 2px;
	height: 765px;
	background-color: black;
	position: absolute;
	top: 103px;
	left: 75px;
}

.leftLine3 {
	width: 3px;
	height: 765px;
	background-color: black;
	position: absolute;
	top: 115px;
	left: 60px;
}

/* 오른쪽 직선 3개 */
.rightLine1, .rightLine2, .rightLine3 {
	height: 767px;
	background-color: black;
	position: absolute;
}

.rightLine1 {
	width: 1px;
	top: 85px;
	left: 1135px;
}

.rightLine2 {
	width: 2px;
	top: 100px;
	left: 1150px;
}

.rightLine3 {
	width: 3px;
	top: 114px;
	left: 1166px;
}

/* 책표지 */
.LMR {
	width: 1198px;
	height: 5px;
	background-color: black;
	position: absolute;
	top: 900px;
	left: 15px;
	z-index: 3;
}

.LT {
	width: 70px;
	height: 5px;
	background-color: black;
	position: absolute;
	top: 96px;
	left: 15px;
	transform: rotate(-10deg);
}

.RT {
	width: 70px;
	height: 5px;
	background-color: black;
	position: absolute;
	top: 94px;
	left: 1143px;
	transform: rotate(10deg);
}

.LL {
	width: 5px;
	height: 800px;
	background-color: black;
	position: absolute;
	top: 102px;
	left: 15px;
}

.RR {
	width: 5px;
	height: 800px;
	background-color: black;
	position: absolute;
	top: 102px;
	left: 1208px;
}

/* ///////////////////////////////////////////////////////////// */
/* 스타일 구현 여기 아래쪽으로 하세요  제발*/
/* 배경색 수정은 전체 틀잡기 구역에 배경색상1,2,3을 수정 하면됩니다 다른 부분 터치 금지. */

/* footer 부분  */
/* footer {
	
} */
.footer_all {
	width: 1240px;
	height: 200px;
	position: absolute;
	top: 1080px;
	background-color: rgba(0, 0, 0, 0.13);
	border-radius: 20px;
}

.left_logo {
	padding-top: 60px;
	margin-left: 100px;
	width: 220px;
	height: 120px;
}

.left_logo1 {
	margin-left: 15px;
	width: 200px;
	height: 50px;
	transform: skew(-32deg)
}

.left_logo2 {
	width: 200px;
	height: 30px;
}

.middle_copyRight {
	margin-left: 150px;
	width: 450px;
	height: 80px;
	font-size: 12px;
	position: absolute;
	left: 300px;
	top: 140px;
}

.mc1 {
	margin-left: 80px;
	display: inline-block;
}

.mc2 {
	margin-left: 40px;
	display: inline-block;
}

.mc3 {
	margin-top: 10px;
}

.right_contact {
	width: 280px;
	position: absolute;
	top: 40px;
	left: 950px;
}

.rc {
	width: 140px;
	font-size: 26px;
	font-weight: bold;
}

.rc2 {
	width: 480px;
	font-style: italic;
	position: absolute;
	left: 400px;
	top: 20px;
}

/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
.tab_accordion_box {
	/* border: 1px solid black; */
	position: relative;
	/* top: 150px; */
	width: 1006px;
	height: 700px;
	/* left: 350px; */
}

.tab_accordion_box1 {
	height: 45px;
	background-color: rgb(26, 188, 156);
}

/* 버튼 전부에 대한 */
.tab_accordion_tab {
	cursor: pointer;
	color: black;
	border-radius: 15px 15px 0px 0px;
	width: 150px;
	position: relative;
	top: 5px;
	border: 0px solid #00000030;
	font-weight: 800;
}

/* 안에 내용 안 보이게 (주석 처리한 것만 보임)*/
/* #tab_accordion_E1, */
#tab_accordion_F1, #tab_accordion_G1, #tab_accordion_H1 {
	display: none;
}

.tab_accordion_Contents {
	width: 1000px;
	height: 700px;
	margin-top: 5px;
	border: 1px solid black;
}

/* 각각 버튼 , 내용 색상*/
#tab_accordion_E {
	z-index: 5;
	position: relative;
	height: 40px;
	background-color: rgb(255, 255, 255)
}

#tab_accordion_E1 {
	background-color: #c2e3e5;
}

#tab_accordion_F {
	z-index: 4;
	position: relative;
	top: 12px;
	right: 6px;
	height: 25px;
}

#tab_accordion_F, #tab_accordion_F1 {
	background-color: rgb(175, 223, 213)
}

#tab_accordion_F:hover {
	background-color: rgb(134, 211, 194)
}

#tab_accordion_G {
	z-index: 3;
	position: relative;
	top: 12px;
	right: 11px;
	height: 25px;
}

#tab_accordion_G, #tab_accordion_G1 {
	background-color: rgb(175, 223, 213)
}

#tab_accordion_G:hover {
	background-color: rgb(134, 211, 194)
}

#tab_accordion_H {
	z-index: 2;
	position: relative;
	top: 12px;
	right: 17px;
	height: 25px;
}

#tab_accordion_H, #tab_accordion_H1 {
	background-color: rgb(175, 223, 213)
}

#tab_accordion_H:hover {
	background-color: rgb(134, 211, 194)
}

/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
/* exercise_tap_E 시작 */
.exercise_all_table {
	width: 390px;
	margin: 10px 5px 10px 5px;
}

.exercise_checkbox {
	/* position: relative; */
	/* top: 10px; */
	margin-top: 10px;
	width: 400px;
	height: 640px;
	background-color: rgba(255, 255, 255, 0.734);
}

.exercise_tbody {
	height: 300px;
}

.exercise_caption {
	font-size: 25px;
	text-align: center;
	font-weight: bold;
	padding: 15px;
}

.exercise_all_checkbox1 {
	position: relative;
	padding: 15px 0px 15px 0px;
	text-align: left;
	font-size: 15px;
	font-weight: 900;
}

.exercise_tr {
	background-color: #92c4b9;
	font-size: 16px;
	border-style: solid;
	border-color: rgb(0, 0, 0) rgba(0, 128, 0, 0) rgb(0, 0, 0)
		rgba(0, 0, 0, 0);
}

.exercise_text_button_box {
	height: 35px;
}

.exercise_text {
	width: 225px;
	height: 35px;
	margin: 0px 0px 10px 6px;
	border: 1px solid rgb(165, 165, 165);
	border-radius: 3px;
}

.button_add {
	position: relative;
	left: 5px;
	width: 80px;
	height: 35px;
	background-color: rgb(22, 160, 133);
	border-radius: 3px;
	color: white;
	border: 0px;
}

.button_add:hover {
	background-color: rgb(20, 133, 110);
}

.button_update {
	position: relative;
	left: 226px;
	bottom: 415px;
	width: 80px;
	height: 35px;
	background-color: rgb(52, 152, 219);
	border-radius: 3px;
	color: white;
	border: 0px;
}

.button_update2 {
	position: relative;
	left: 226px;
	bottom: 415px;
	width: 80px;
	height: 35px;
	background-color: rgb(52, 152, 219);
	border-radius: 3px;
	color: white;
	border: 0px;
}

.button_update:hover {
	background-color: rgb(22, 129, 200);
}

.button_update2:hover {
	background-color: rgb(22, 129, 200);
}

.button_del {
	position: relative;
	left: 225px;
	bottom: 415px;
	width: 80px;
	height: 35px;
	background-color: #818181;
	border-radius: 3px;
	color: white;
	border: 0px;
	height: 35px;
}

.button_del:hover {
	background-color: #505050;
}

.button_add, .button_update, .button_del {
	cursor: pointer;
}

.exercise_reservation {
	position: relative;
	top: 30px;
	width: 360px;
	height: 110px;
	line-height: 30px;
	margin: 0px 15px 0px 15px;
	border: 1px solid black;
	background-color: white;
	border-radius: 5px;
	color: rgb(28, 132, 202);
	font-weight: 800;
	padding: 5px;
	/* text-align: center; */
}

.exercise_reservation2 {
	position: absolute;
	width: 900px;
	height: 615px;
	bottom: 50px;
	top: 65px;
	left: 20px;
	line-height: 50px;
	margin: 0px 15px 0px 15px;
	border: 1px solid black;
	background-color: rgba(255, 255, 255, 0.725);
	border-radius: 5px;
	text-align: center;
}

.exercise_reservation2-1 {
	position: absolute;
	width: 560px;
	height: 100px;
	bottom: 0px;
	top: 590px;
	left: 405px;
	line-height: 30px;
	margin: 0px 15px 0px 15px;
	border: 1px solid black;
	background-color: rgba(255, 255, 255, 0.651);
}

/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */
/* exercise_tap_E 끝 */

/* body_calendar 시작 */
.body_calendar_box {
	border: 1px solid black;
	width: 45%;
	height: 700px;
	background-color: rgb(246, 248, 255);
}

.body_calendar_caption {
	font-size: 25px;
	text-align: center;
	font-weight: bold;
	margin: 5px;
	border-style: solid;
	border-color: rgba(255, 255, 255, 0) rgba(0, 128, 0, 0) rgb(0, 0, 0)
		rgba(0, 0, 0, 0);
}

.body_calendar_table {
	margin: 15px;
	width: 420px;
	text-align: center;
}
</style>
<script>
	window.onload = function() {
		// insert_cancel();
		insert_bind();
		// b();

		function insert_bind() {
			let insert_button = document.querySelector(".insert_button");
			insert_button
					.addEventListener(
							"click",
							function(e) {

								// 추가버튼 remove
								document.querySelector(".insert_button")
										.remove();

								// 기존 내용 숨김
								let sapn_text = document
										.querySelectorAll(".sapn_text");
								for (let i = 0; i < sapn_text.length; i++) {
									sapn_text[i].style.display = "none";
									console.log("추가 클릭시 for문 1")
								}
								// 숨긴 내용 보임
								let text_hidden = document
										.querySelectorAll(".text_hidden");
								for (let j = 0; j < text_hidden.length; j++) {
									console.log("추가 클릭시 for문 2")
									text_hidden[j].style.display = "block";
									text_hidden[j].setAttribute("type", "text");
								}
								// 취소버튼 생성
								let sapn_button_box = document
										.querySelector(".sapn_button_box");
								let html = sapn_button_box.innerHTML;
								html += '<input type="button" value="취소" class="insert_cancel">'
								sapn_button_box.innerHTML = html;

								// 취소 버튼 do을 js 변수에 다시 초기화
								let insert_cancel = document
										.querySelector(".insert_cancel");
								call_fn();
							})
		}

		function call_fn() {
			let insert_cancel = document.querySelector(".insert_cancel");

			// 취소를 클릭했을때
			insert_cancel
					.addEventListener(
							"click",
							function(e) {
								// 취소버튼 remove
								document.querySelector(".insert_cancel")
										.remove();

								// 내용 다시 숨김
								let text_hidden = document
										.querySelectorAll(".text_hidden");
								for (let j = 0; j < text_hidden.length; j++) {
									console.log("취소 클릭시 for문 1")
									text_hidden[j].style.display = "none";
									text_hidden[j].setAttribute("type",
											"hidden");
								}

								// 기존 내용 다시 보임
								let sapn_text = document
										.querySelectorAll(".sapn_text");
								for (let i = 0; i < sapn_text.length; i++) {
									console.log("취소 클릭시 for문 2")
									sapn_text[i].style.display = "block";
								}

								// 추가버튼 생성
								let sapn_button_box = document
										.querySelector(".sapn_button_box");
								let html = sapn_button_box.innerHTML;
								html += '<input type="button" value="추가" class="insert_button">'
								sapn_button_box.innerHTML = html;

								let insert_button = document
										.querySelector(".insert_button");
								insert_bind();
							})
		}

		// 추가 버튼 do을 js 변수에 다시 초기화
	}

	// update 할거임

	// let update_hidden = document.querySelectorAll(".update_hidden");
	// let update_span = document.querySelectorAll(".update_span");

	// let update_button = document.querySelectorAll(".update_button");
	// update_button.addEventListener("click", function (e) {

	//     update_button.setAttribute("type", "hidden");

	// }
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

							<!-- 안에 흰색 box -->
							<div class="tab_accordion_box2">
								<form>
									<table border="1">
										<tbody>
											<tr>
												<th>닉네임</th>
												<td>일단보류</td>
												<th>성별</th>
												<td>일단보류</td>
												<th>나이</th>
												<td>일단보류</td>
										</tbody>
									</table>
								</form>

								<form action ="${path}/inbody/update.do" method="post">
									<table border="1">
											<caption>
												<div class="exercise_caption">현재 체중량</div>
											</caption>
										<tbody>
											<tr>
												<th>날짜</th>
												<td>date</td>
											</tr>
											<tr>
												<th>키</th>
												<td><input type="hidden"
													value="${select_Inbody_Last[0].inBody_Height}"
													class="text_hidden" name="inBody_Height"><span class="sapn_text">${select_Inbody_Last[0].inBody_Height}</span>
												</td>
											</tr>
											<tr>
												<th>체중</th>
												<td><input type="hidden" value="${select_Inbody_Last[0].inBody_Weight}"
													class="text_hidden" name="inBody_Weight"><span class="sapn_text">${select_Inbody_Last[0].inBody_Weight}</span>
												</td>
											</tr>
											<tr>
												<th>체지방량</th>
												<td><input type="hidden" value="${select_Inbody_Last[0].inBody_Body_Fat}"
													class="text_hidden" name="inBody_Body_Fat"><span class="sapn_text">${select_Inbody_Last[0].inBody_Body_Fat}</span>
												</td>
											</tr>
											<tr>
												<th>골격근량</th>
												<td><input type="hidden" value="${select_Inbody_Last[0].inBody_Skeletal}"
													class="text_hidden" name="inBody_Skeletal"><span class="sapn_text">${select_Inbody_Last[0].inBody_Skeletal}</span>
												</td>
											</tr>
										</tbody>
									</table>
									<span class="sapn_button_box"> <input type="submit"
										value="확인"> <input type="button" value="추가"
										class="insert_button"> <input type="hidden"
										value="${select_Inbody_Last[0].seq_Inbody}" name="seq_Inbody">
									</span>
								</form>

								<form action ="${path}/inbody/onelist.do" method="post">
									<table border="1">
										<tbody>
											<caption>
												<div class="exercise_caption">목표 체중량</div>
											</caption>
											<tr>
												<th>날짜</th>
												<td>date</td>
											</tr>
											<tr>
												<th>키</th>
												<td><input type="hidden" value="inBody_Height"
													class="update_hidden"> <span class="update_span">${select_One_Inbody_2.inBody_Height_2}</span>
												</td>
											</tr>
											<tr>
												<th>체중</th>
												<td><input type="hidden" value="inBody_Weight"
													class="update_hidden"> <span class="update_span">${select_One_Inbody_2.inBody_Weight_2}</span>
												</td>
											</tr>
											<tr>
												<th>체지방량</th>
												<td><input type="hidden" value="inBody_Body_Fat"
													class="update_hidden"> <span class="update_span">${select_One_Inbody_2.inBody_Body_Fat_2}</span>
												</td>
											</tr>
											<tr>
												<th>골격근량</th>
												<td><input type="hidden" value="inBody_Skeletal"
													class="update_hidden"> <span class="update_span">${select_One_Inbody_2.inBody_Skeletal_2}</span>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="submit" value="확인"> <input type="button"
										value="수정" class="update_button"> <input type="hidden"
										value="취소" class="update_button">
								</form>


								<form>
									<table border="1">
										<thead>
											<tr>
												<th>날짜</th>
												<th>키</th>
												<th>체중</th>
												<th>체지방량</th>
												<th>골격근량</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
											</tr>
										</tbody>
									</table>
									<input type="submit" value="삭제">
								</form>
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