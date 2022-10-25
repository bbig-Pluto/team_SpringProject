<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 소개</title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
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
		
 		/* ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 메인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */

		 .logo_back {
            background-color:rgb(14, 75, 34);
            height: 300px;
            margin-top: 100px;
            padding-top: 150px;
        }
        .logo_image {
            width: 1000px;
            text-align: center;
			margin: auto;
        }
        .info_area {
            background-color: rgb(238, 241, 233);
            margin: 40px;
			margin-top: 20px;
            border-radius: 15px;
            margin-top: 80px;
            margin-bottom: 150px;
            text-align: center;
            padding: 30px;
			padding-bottom: 1000px;
        }
        .info_title {
			font-size: 50px;
            font-weight: 900;
            margin: 100px;
            color:rgb(14, 75, 34);
            padding-top: 50px;
			margin-top: 180;
        }
		.title_logo {
			position: relative;
			width: 230px;
			top: 15px;
		}
        .info_content {
            font-size: 28px;
            margin: 100px;
        }
        .info_subcon {
            width: 900px;
            margin: auto;
            color:rgb(105, 138, 115);
            font-size: 27px;
			font-weight: 900;
			margin-top: 50px;
        }
        .idx1 {
            background-color:#FFCCAA;
            width: 350px;
            margin: 80px auto;
            height: 130px;
            border-radius: 100px;
            line-height: 130px;
            font-size: 30px;
            font-weight: 900;
			cursor: pointer;
        }
		.diary {
			/* visibility: hidden; */
			height: 0vh;
			margin: 120px auto;
			font-size: 40px;
			font-weight: 900;
			transition: all 0.3s;
		}
		.diet {
			/* visibility: hidden; */
			height: 0vh;
			margin: 120px auto;
			font-size: 40px;
			font-weight: 900;
		}
		.exercise {
			/* visibility: hidden; */
			height: 0vh;
			margin: 120px auto;
			font-size: 40px;
			font-weight: 900;
		}
		.wishlist {
			/* visibility: hidden; */
			height: 0vh;
			margin: 120px auto;
			font-size: 40px;
			font-weight: 900;
		}
		.contents {
			font-weight: 500;
			margin: 100px;
			font-size: 30px;
			margin-bottom: 150px;
		}
		.links {
			width: 100px;
			line-height: 40px;
			background-color: rgb(0, 0, 0);
			text-decoration: none;
			color: rgb(255, 255, 255);
			font-size: 20px;
			padding: 23px 50px;
			border-radius: 80px;
		}
        .idx2 {
            background-color:#FFFFCA;
            width: 350px;
            margin: 80px auto;
            height: 130px;
            border-radius: 100px;
            line-height: 130px;
            font-size: 30px;
            font-weight: 900;
			cursor: pointer;
			margin-top: 750px;
        }
        .idx3 {
			background-color: #DCEDCA;
            width: 350px;
            margin: 80px auto;
            height: 130px;
            border-radius: 100px;
            line-height: 130px;
            font-size: 30px;
            font-weight: 900;
			cursor: pointer;
			margin-top: 750px;
        }
		.idx4 {
			background-color:#c2e3e5;
			width: 350px;
			margin: 80px auto;
			height: 130px;
			border-radius: 100px;
			line-height: 130px;
			font-size: 30px;
			font-weight: 900;
			cursor: pointer;
			margin-top: 750px;
		}
		.act {
			visibility: visible;
			height: 60vh;
		}
		.bottom_logo {
			width: 400px;
			position: relative;
			top: 800px;
		}
		.headermypage {
 		color: #223919;
		display: inline-block;
		text-decoration: none;
		position: relative;
	}
		        
	.headermypage:hover {
		color: #108269;
		font-weight: bold;
	}
    </style>
    <script>
    window.onload=()=>{

    	<%
 	String isLogon = "guest";
 	HttpSession logOnSession = request.getSession();
 	
 	if(logOnSession.isNew()) {
 		logOnSession.setAttribute("isLogon", "guest"); // 세션이 없으면 만들어서 isLogon 에 guest 세팅
 	} else { // 세션은 있는데 로그인을 안 하고 들어온 Case
 		if(logOnSession.getAttribute("logOn.id") == null) {
 			isLogon = "guest"; // 세션이 있다면 isLogon 에 세션에 있던 값을 세팅
 			System.out.println("memoList if-else route ( guest )" );
 		} else {
 			isLogon = "member"; 			
 			System.out.println("memoList if-else route ( member )");
 		}
 	}
 %>
 	 
 	 let popupWidth = 470;
 	 let popupHeight = 140;
 	 // 브라우저 기준 중앙 정렬			
 	 let popupX = (document.body.offsetWidth / 2) - (popupWidth / 2);
 	 let popupY = (window.screen.height / 2) - (popupHeight / 2);
 	 			
 	 document.querySelector("#myPageLink").addEventListener("click", function(e) {
 	 	<% if ((""+logOnSession.getAttribute("isLogon")).equals("member")) { %>
 	 		window.open('${contextPath}/member/rd/inputpwdformypage', '비밀번호 재확인', 'width=' + popupHeight + ', height=' + popupHeight + ', left='+ popupX + ', top=' + popupY + ', scrollbars=yes');
 	 	<% } else { %>
 	 		alert("로그인이 필요한 서비스입니다.");				
 	 	<% } %>
 	 })

    }

		const btn = document.querySelector(".idx1");
		const cts = document.querySelector(".diary");

		btn.addEventListener("click", ()=> {
			cts.classList.toggle('act');
		})
    </script>
</head>
<body>
 <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 헤더 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
    <header>
			<div class="wrapper">
				<h1>
					<a href="/syl/calendarM"><img class="headerLogo" src="/syl/resources/photo/logo.png"></a>
				</h1>
				<nav>
					<a href="/syl/bar/intro" class="headersub">다이어리 소개 |</a> 
	               <a href="/syl/bar/story11" class="headersub">다이어리 구성 |</a> 
	               <a href="/syl/bar/func"  class="headersub">다이어리 기능 |</a> 
	               <a href="/syl/bar/shot11"  class="headersub">다이어리 사용법 |</a> 
	               <a href="/syl//notice" class="headersub">고객의 소리</a>
					<div class="lgnbtn">
					   <a href="#" id="myPageLink" class="headermypage">마이페이지</a>
                  <c:choose>
	                  <c:when test="${empty sessionId }">
		                  <a href="/syl/member/login " class="headerlogin">로그인</a>
	                  </c:when>
	                  <c:otherwise>
		                  <a href="/syl/member/logout.do" class="headerloginout">로그아웃</a>
	                  </c:otherwise>
                  </c:choose>
					</div>
				</nav>
			</div>
		</header>


    <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 메인 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

    <main>

		<!-- 로고 배경 -->
        <div class="logo_back">

        	<div class="logo_image">
            	<img src="https://ifh.cc/g/szyoGW.png">
        	</div>

        </div>

		<!-- 소개 화면 -->
        <div class="info_area">

            <div class="info_title">다이어리란?</div><br>
            <div class="info_content">한 장 한 장 넘기면서 날짜별로 간단한 메모를 할 수 있도록 만들어진 기록장입니다<br><br><br>
				손으로 매일 힘겹게 남기던 일기<br><br><br><br><br>
				<b style="font-size: 35px;">이제는 디지털로 손쉽게 기록할 수 있습니다.</b></div><br><br>
            <div class="info_subcon">A diary is a written or audiovisual record with discrete entries arranged by date reporting on what has happened over the course of a day or other period. Diaries have traditionally been handwritten but are now also often digital.</div><br><br><br><br>

            <div class="info_title">
				<img class="title_logo" src="https://ifh.cc/g/yvQoPf.png">
				의 다이어리
			</div><br><br><br><br>
            <div class="info_content">이런 기록들을 할 수 있습니다</div><br><br><br>
			
            <div class="idx1">D I A R Y</div>

				<div class="diary">다이어리
					<div class="contents">하루하루의 일상을 사진과 함께 기록하세요<br><br>
						날씨와 기분에 따라 그 날의 특별한 감정을 남길 수 있습니다</div>
					<a class="links" href="/syl/diaryList">다이어리 페이지 보기 &nbsp; <b>→</b></a>
				</div>
					
					
			<div class="idx2">D I E T</div>
					
				<div class="diet">식단 관리
					<div class="contents">그 날 섭취한 식사를 기록하세요<br><br>
						식사별 칼로리와 몸의 변화를 한눈에 확인하세요</div>
					<a class="links" href="/syl/diet_1page.do">식단 관리 페이지 보기 &nbsp; <b>→</b></a>
				</div>


			<div class="idx3">E X E R C I S E</div>

				<div class="exercise">운동 기록
					<div class="contents">매일 열심히 운동하고, 기록하세요<br><br>
						내가 했던 운동을 기록하며 건강에 한걸음 더 가까워지세요</div>
					<a class="links" href="/syl/ec_list.do">운동 기록 페이지 보기 &nbsp; <b>→</b></a>
				</div>


			<div class="idx4">W I S H L I S T</div>

				<div class="wishlist">위시리스트
					<div class="contents">가지고 싶은 물건을 담아놓으세요<br><br>
						구매하고 싶은 물건을 나만의 장바구니에 보기쉽게 분류하고 정리하세요</div>
					<a style="margin-bottom: 800px;" 
					class="links" href="/syl/mainwish">위시리스트 페이지 보기 &nbsp; <b>→</b></a>
				</div>


			<img class="bottom_logo" src="https://ifh.cc/g/mcjZ7T.png">

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