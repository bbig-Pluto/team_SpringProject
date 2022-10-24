<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 소개</title>
 <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap');

        /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 폰트 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

        body {
            font-family: 'Noto Sans KR', sans-serif;
        }


        /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 헤더 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

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


        /* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 푸터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

		.footer_all {
			width: 1240px;
			height: 200px;
			position: absolute;
			/* top: 1080px; */
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
        .logo_back {
            background-color:rgb(14, 75, 34);
            height: 400px;
            margin-top: 100px;
        }
        .logo_image {
            width: 600px;
            margin: 100px 390px;
        }
        .info_area {
            background-color: rgb(221, 221, 221);
            height: 1300px;
            margin: 40px;
            border-radius: 15px;
            margin-top: 80px;
            margin-bottom: 150px;
            text-align: center;
            padding: 30px;
        }
        .info_title {
            font-size: 30px;
            font-weight: 900;
            margin: 30px;
            color:rgb(14, 75, 34);
            padding-top: 50px;
        }
        .info_content {
            font-size: 20px;
            margin: 20px;
        }
        .info_subcon {
            width: 900px;
            margin: auto;
            color:rgb(105, 138, 115);
            font-size: 18.5px;
        }
        .idx1 {
            background-color:#FFCCAA;
            width: 200px;
            margin: 20px auto;
            height: 80px;
            border-radius: 100px;
            line-height: 80px;
            font-size: 23px;
            font-weight: 900;
        }
        .idx2 {
            background-color:#FFFFCA;
            width: 200px;
            margin: 30px auto;
            height: 80px;
            border-radius: 100px;
            line-height: 80px;
            font-size: 23px;
            font-weight: 900;
        }
        .idx3 {
            background-color:#c2e3e5;
            width: 200px;
            margin: 20px auto;
            height: 80px;
            border-radius: 100px;
            line-height: 80px;
            font-size: 23px;
            font-weight: 900;
        }
    </style>
</head>
<body>
 <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 헤더 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
    <header>
			<div class="wrapper">
				<h1>
					<a href="${ contextPath }/js/calendarM.jsp"><img class="headerLogo" src="/team_Project/photo/logo.png"></a>
				</h1>
				<nav>
					<a href="${ contextPath }/intro.jsp" class="headersub">다이어리 소개 |</a> 
					<a href="${ contextPath }/story11.jsp" class="headersub">다이어리 구성 |</a> 
					<a href="${ contextPath }/func.jsp" class="headersub">다이어리 기능 |</a> 
					<a href="${ contextPath }/shot11.jsp"	class="headersub">다이어리 사용법 |</a> 
					<a href="${ contextPath }/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
					<div class="lgnbtn">
						<a href="${ contextPath }/hunminjsp/mypage.jsp" class="headermypage">마이페이지</a>
						<a href="${ contextPath }/hunminjsp/signin.jsp" class="headerlogin">로그인</a>
						<a href="${ contextPath }/member/logout.do" class="headerloginout">로그아웃</a>
					</div>
				</nav>
			</div>
		</header>


    <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 메인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

    <main>

        <div class="logo_back">
            <img class="logo_image" src="https://ifh.cc/g/szyoGW.png">
        </div>

        <div class="info_area">
            <div class="info_title">다이어리란?</div><br>
            <div class="info_content">한 장 한 장 넘기면서 날짜별로 간단한 메모를 할 수 있도록 만들어진 기록장입니다</div>
            <div class="info_content">일기는 대개 손으로 썼지만 이제는 디지털로 손쉽게 기록할 수 있습니다</div><br><br>
            <div class="info_subcon">A diary is a written or audiovisual record with discrete entries arranged by date reporting on what has happened over the course of a day or other period. Diaries have traditionally been handwritten but are now also often digital.</div><br><br><br><br>

            <div class="info_title">3SYL의 다이어리</div><br><br><br><br>
            <div class="info_content">이런 기록들을 할 수 있습니다</div><br><br><br>
            <div class="idx1">DIARY</div>
            <div class="idx2">DIET</div>
            <div class="idx3">WISH</div>
        </div>


    </main>


    <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 푸터 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

    <footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src=" https://ifh.cc/g/H618K6.png"> <img
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