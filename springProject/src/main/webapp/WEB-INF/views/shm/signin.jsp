<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"
	import="javax.servlet.http.HttpSession" pageEncoding="UTF-8"%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>

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
	width: 580px;
	display: inline-block;
	vertical-align: top;
	margin-top: 3%;
	margin-left: 12%;
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
main {
	/* border: 3px solid black; */
	
}

.area_wrapper {
	width: 1240px;
	height: 920px;
	display: flex;
	position: absolute;
	border: 1px solid red;
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
	background-color: yellow;
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
	background-color: yellow;
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
	background-color: yellow;
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
footer {
	
}

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

/* 최종로그인 완성본틀(fixed) */
.divEve {
	width: 680px;
	height: 800px;
	margin-left: 300px;
	/* border: 1px solid green; */
	position: absolute;
}

/* 메인 로그인부분 */
.lpgmain {
	border: 9px solid black;
	width: 500px;
	height: 700px;
	margin-left: 70px;
	margin-top: 80px;
	/* 책 표지에 색상을 넣고 싶을 때 ↓↓↓↓↓ 색상 변경하세요. */
	background-color: rgb(236, 245, 224);
}

/* 3개의 대각선 */
.lpgdiagLT, .lpgdiagRT, .lpgdiagRB {
	width: 75px;
	height: 5px;
	background-color: black;
	position: absolute;
}

.lpgdiagLT {
	height: 8px;
	left: 62px;
	top: 52px;
	transform: rotate(-45deg);
}

.lpgdiagRT {
	left: 570px;
	top: 55px;
	transform: rotate(-45deg);
}

.lpgdiagRB {
	left: 571px;
	top: 763px;
	transform: rotate(-45deg);
}

/* 3개의 위 직선 */
.lpgTLine1, .lpgTLine2, .lpgTLine3 {
	width: 513px;
	height: 3px;
	background-color: black;
	position: absolute;
	z-index: 2;
}

.lpgTLine1 {
	top: 60px;
	left: 90px;
}

.lpgTLine2 {
	top: 44px;
	left: 106px;
}

.lpgTLine3 {
	height: 9px;
	top: 26px;
	left: 123px;
}

/* 3개의 우측 직선 */
.lpgRLine1, .lpgRLine2 {
	width: 3px;
	height: 710px;
	background-color: black;
	position: absolute;
}

.lpgRLine1 {
	top: 65px;
	left: 600px;
}

.lpgRLine2 {
	top: 45px;
	left: 618px;
}

.lpgRLine3 {
	width: 9px;
	height: 720px;
	background-color: black;
	position: absolute;
	top: 26px;
	left: 631px;
}

/* 좌측 원, 선 */
.lpgLLine1 {
	width: 6px;
	height: 50px;
	background-color: black;
	position: absolute;
	top: 60px;
	left: 30px;
}

.circleHLT1 {
	width: 90px;
	height: 47px;
	position: absolute;
	top: 26px;
	left: 30px;
	border: 7px solid black;
	border-radius: 40px 0px 0px 25px;
	border-right: 0px solid rgba(255, 255, 255, 0);
}

.circleLine {
	width: 30px;
	height: 700px;
	position: absolute;
	top: 80px;
	right: 610px;
	border: 9px solid black;
	border-right: 2px solid black;
	border-left: 8px solid black;
	border-radius: 0px 0px 0px 50px;
	/* 책 표지에 색상을 넣고 싶을 때 ↓↓↓↓↓ 색상 변경하세요. */
	background-color: rgb(236, 245, 224);
}

/* 포스트잇 */
.lpgRLine1 .post1.It1 {
	width: 60px;
	height: 37px;
	position: absolute;
	z-index: 3;
	top: 40px;
	border-radius: 0px 80px 80px 0px;
	background-color: #FF9A9A;
}

.lpgRLine1 .post1.It2 {
	width: 60px;
	height: 37px;
	position: relative;
	z-index: 2;
	top: 80px;
	left: 10px;
	border-radius: 0px 80px 80px 0px;
	background-color: #FFCCAA;
}

.lpgRLine2 .post1.It3 {
	width: 60px;
	height: 37px;
	position: relative;
	z-index: 1;
	top: 140px;
	border-radius: 0px 80px 80px 0px;
	background-color: #FFFFCA;
}

.lpgRLine1 .post1.It4 {
	width: 60px;
	height: 37px;
	position: relative;
	z-index: 2;
	top: 130px;
	left: 10px;
	border-radius: 0px 80px 80px 0px;
	background-color: #DCEDCA;
}

/* 똑딱이 */
.lockPack1 {
	/* border: 1px solid red; */
	width: 200px;
	height: 150px;
	position: absolute;
	top: 350px;
	left: 430px;
}

.lockHC2 {
	width: 150px;
	height: 100px;
	position: absolute;
	top: 365px;
	left: 430px;
	border: 5px solid black;
	border-right: 0px solid rgba(255, 255, 255, 0);
	border-radius: 50px 0px 0px 50px;
	background-color: rgb(236, 245, 224);
}

.lockQA2 {
	width: 52px;
	height: 100px;
	border: 5px solid black;
	border-left: 0px solid rgba(255, 255, 255, 0);
	position: absolute;
	top: 342px;
	left: 584px;
	transform: skewY(-40deg);
	background-color: rgb(236, 245, 224);
	z-index: 2;
}

.lock2 {
	width: 5px;
	height: 110px;
	border: 5px solid black;
	background-color: rgb(206, 237, 195);
	position: absolute;
	top: 360px;
	left: 550px;
}

/* 자물쇠 구현 */
.lockShapeArea {
	width: 60px;
	height: 60px;
	position: absolute;
	/* border: 1px solid red; */
	top: 390px;
	left: 465px;
	z-index: 2;
}

.lockShape {
	cursor: pointer;
	width: 38px;
	height: 30px;
	background-color: #e9df21c6;
	border: 1px solid #e9df21c6;
	box-shadow: 1px 0px 5px 0px #e9df21c6;
	position: absolute;
	top: 28px;
	left: 8px;
	font-style: italic;
	font-size: 10px;
}

.lockShapeT {
	cursor: pointer;
	width: 36px;
	height: 6px;
	background-color: #e9df21c6;
	border: 1px solid #e9df21c6;
	box-shadow: 1px 0px 5px 0px #e9df21c6;
	transform: skewX(-27deg);
	position: absolute;
	top: 20px;
	left: 10px;
}

.lockShapeR {
	cursor: pointer;
	width: 2px;
	height: 28px;
	background-color: #e9df21c6;
	border: 1px solid #e9df21c6;
	box-shadow: 1px 0px 5px 0px #e9df21c6;
	transform: skewY(-63deg);
	position: absolute;
	top: 24px;
	left: 46px;
}

.lockShapeC1 {
	cursor: pointer;
	width: 6px;
	height: 4px;
	background-color: #0000008e;
	box-shadow: 0px 0px 3px 0px #000000c6;
	border-radius: 100%;
	transform: skewX(-15deg);
	position: absolute;
	top: 22px;
	left: 12px;
}

.lockS {
	cursor: pointer;
	width: 32px;
	height: 14px;
	background-color: #e9df21;
	border-radius: 50px 50px 0px 0px;
	position: absolute;
	top: 0px;
	left: 13px;
}

.lockSLL {
	cursor: pointer;
	width: 4px;
	height: 12px;
	background-color: #e9df21;
	border-radius: 00px 0px 5px 5px;
	position: absolute;
	top: 13px;
	left: 13px;
}

.lockSRL {
	cursor: pointer;
	width: 4px;
	height: 12px;
	background-color: #e4dc40;
	position: absolute;
	top: 13px;
	left: 41px;
}

.lockSs {
	width: 24px;
	height: 11px;
	background-color: rgb(236, 245, 224);
	border-radius: 50px 50px 0px 0px;
	position: absolute;
	top: 4px;
	left: 17px;
}

/* 로그인 실패시 자물쇠 흔들기 */

/* ----------------------------- 로그인 디자인 구현 ↓↓↓↓↓↓↓↓↓↓↓↓↓ --------------------------------- */
.tag {
	margin-top: 50px;
	margin-left: 30px;
	width: 440px;
}

.syl2 {
	width: 440px;
}

.text {
	margin-top: 60px;
	margin-left: 40px;
	width: 300px;
	height: 150px;
}

.text_c {
	border-radius: 20px;
	margin: 5px;
	height: 45px;
	width: 250px;
	border: none;
	margin-top: 40px;
	margin-left: 25px;
	background-color: rgb(211, 229, 211);
	text-align: center;
}

.text_d {
	border-radius: 20px;
	margin: 5px;
	height: 45px;
	width: 250px;
	border: none;
	margin-left: 25px;
	background-color: rgb(211, 229, 211);
	text-align: center;
}

.joinbtn {
	width: 230px;
	height: 25px;
	margin: 10px 100px;
	font-size: 13px;
	background-color: rgba(211, 229, 211, 0);
}

.sgnbtn1 {
	border: none;
	cursor: pointer;
	background-color: rgba(211, 229, 211, 0);
}

.sgnbtn2 {
	border: none;
	cursor: pointer;
	padding: 0px;
	background-color: rgba(211, 229, 211, 0);
}

a {
	text-decoration: none;
	color: gray;
}

.logo {
	margin-top: 180px;
	margin-left: 300px;
	margin-bottom: 0px;
	width: 150px;
	height: 40px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	window.onload = function() {

		$(function() {
            $("#lockShape").click(function(e) {
		    	let signin = { id : document.querySelector("input[name='signin_id']").value,
		            pwd : document.querySelector("input[name='signin_pwd']").value}
		        $.ajax({
		            type: "post",
		            url: "${contextPath}/member/login.do",
		            contentType: "application/json",
		            data: JSON.stringify(signin),
		            success: function(data, textStatus){
		                eval(data);
            		}
        		})
            })
		})
	
	<%
		HttpSession logOnSession = request.getSession();

		if(logOnSession.isNew()){ // 처음 접속이라서 세션이 없다면 만들어주고서 페이지 로드
			logOnSession.setAttribute("isLogon", "guest"); 
		}	
		if( ((""+logOnSession.getAttribute("isLogon")).equals("guest")) 
				|| (logOnSession.getAttribute("isLogon") == null) ) { // 다른 곳에서 세션은 만들고 들어온 비회원
		
	%>
				
	// 로그인 실패 -> 자물쇠 흔들리는 기능 구현
	
<%-- 		<% HttpSession loginSession = request.getSession(); --%>
// 		   loginSession.setAttribute("loginSuccess", -1);
		   
<%-- 		%> --%>
		
// 		document.querySelector("lockShapeArea").addEventListener("click", function() {
			
<%-- 		<% --%>
// 		int loginSuccess = (int) (loginSession.getAttribute("loginSuccess"));
// 		if (loginSuccess == -1) {
<%-- 		%> --%>
// 			let vibration = (target) => {
//             	target.classList.add("vibration");

//             	setTimeout(function () {
//              	   target.classList.remove("vibration");
//            	    }, 400);
//         	}
// 			document.querySelector(".lockShape").preventDefault();
<%-- 		<% --%>
// 		}
<%-- 		%> --%>
// 		})

	
	}
</script>
</head>



<body>
	<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="${ contextPath }/js/calendarM.jsp"><img class="headerLogo" src="/team_Project/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ contextPath }/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="${ contextPath }/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="${ contextPath }/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="${ contextPath }/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ contextPath }/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a id="myPageLink" href="#" class="headermypage">마이페이지</a>
                  <a href="${ contextPath }/hunminjsp/signin.jsp" class="headerlogin">로그인</a>
                  <a href="${ contextPath }/member/logout.do" class="headerloginout">로그아웃</a>
               </div>
            </nav>
         </div>
      </header>



	<main>
		<section>
			<article>
				<div class="blankArea"></div>
				<div class="divEve">
					<div class="lpgmain">
						<!-- <div class="wrapper"> -->

						<div class="tag">
							<img class="syl2" src="/team_Project/photo/def.png">
						</div>
						<form action="${contextPath}/member/login.do" method="post">
							<div class="text">
								<input class="text_c" type="text" name="signin_id"
									placeholder="ID or EMAIL"> <input class="text_d"
									type="password" name="signin_pwd" placeholder="Password">
							</div>
							<!-- 자물쇠 구현 -->
							<div class="lockShapeArea">
								<input type="button" id="lockShape" class="lockShape" value="Login">
								<div class="lockShapeT"></div>
								<div class="lockShapeR"></div>
								<div class="lockShapeC1"></div>
								<div class="lockS"></div>
								<div class="lockSLL"></div>
								<div class="lockSRL"></div>
								<div class="lockSs"></div>
							</div>

						</form>
						<div class="linkToOtherPages">
							<div class="joinbtn">
								<a href="${contextPath}/member/rd/idpwfinder" type="button"
									class="sgnbtn1">FORGOT ID/PASSWORD |</a> <a
									href="${contextPath}/member/rd/signup" type="button"
									class="sgnbtn2">JOIN</a>
							</div>
						</div>
						<img class="logo" src="/team_Project/photo/logo2.png">
						<div>
							<div class="lockPack2">
								<!-- 다이어리 여닫이-똑딱이 -->
								<div class="lockQA2"></div>
								<div class="lockHC2"></div>
								<div class="lock2"></div>
							</div>
						</div>
						<!-- 3개의 대각선 -->
						<div class="lpgdiagLT"></div>
						<div class="lpgdiagRT"></div>
						<div class="lpgdiagRB"></div>
						<!-- 3개의 위 직선 -->
						<div class="lpgTLine1"></div>
						<div class="lpgTLine2"></div>
						<div class="lpgTLine3"></div>
						<!-- 3개의 우측 직선 -->
						<div class="lpgRLine1">
							<!-- 포스트잇 -->

							<div class="post1 It1"></div>
							<div class="post1 It2"></div>
							<div class="post1 It4"></div>
						</div>
						<div class="lpgRLine2">
							<!-- 포스트잇 -->
							<div class="post1 It3"></div>
						</div>
						<div class="lpgRLine3"></div>
						<!-- 좌측 책표지 중심 구현 -->
						<div class="circleHLT1"></div>
						<div class="lpgLLine1"></div>
						<div class="circleLine"></div>
					</div>
				</div>

			</article>
		</section>
	</main>

	<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="/team_Project/photo/logo2.png"> <img
					class="left_logo2" src="/team_Project/photo/3syl2.png">
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
</body>

</html>
<%	// 로그온 세션 if 문
	} else { // 처음 접속이 아니라서 세션이 존재한다면
		if (logOnSession.getAttribute("isLogon") == null) {
			logOnSession.invalidate();
			response.sendRedirect("/team_Project/hunminjsp/signin.jsp");
		} else { // 세션도 존재하고 로그인한 상태라면
			response.sendRedirect("/team_Project/js/calendarM.jsp");
		}
	}
%>



