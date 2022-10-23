<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <title>아이디 찾기 / 비밀번호 재설정</title>
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		window.onload = function() {
			
			$(function() {
				$("#idFindBtn").click(function(e) {
					console.log("idFindBtn click 실행")
					let idFind = { emailAdd : document.querySelector("input[name='idFindEmailAdd']").value,
						telNum : document.querySelector("input[name='idFindTelNum']").value}
					$.ajax({
						type: "post",
						url: "${contextPath}/member/idFind.do",
						contentType: "application/json",
						data: JSON.stringify(idFind),
						success: function(data, textStatus){
							eval(data);
						}
					})
				})
			})


			$(function() {
				$("#pwdRewrting").click(function(e) {
					console.log("pwdRewrting click 실행")
					let pwdRewrting = { id : document.querySelector("input[name='pwdRewriteId']").value,
						telNum : document.querySelector("input[name='pwdRewriteTelNum']").value}
					$.ajax({
						type: "post",
						url: "${contextPath}/member/pwdRewriteCheck.do",
						contentType: "application/json",
						data: JSON.stringify(pwdRewrting),
						success: function(data, textStatus){
							eval(data);
						}
					})
				})
			})

			<% HttpSession logOnSession = request.getSession(); %>
			
			let popupWidth = 470;
			let popupHeight = 140;
			// 브라우저 기준 중앙 정렬			
			let popupX = (document.body.offsetWidth / 2) - (popupWidth / 2);
			let popupY= (window.screen.height / 2) - (popupHeight / 2);
			
			document.querySelector("#myPageLink").addEventListener("click", function(e) {
				<% if ((""+logOnSession.getAttribute("isLogon")).equals("member")) { %>
					window.open('${contextPath}/member/rd/inputpwdformypage', '비밀번호 재확인', 'width=' + popupHeight + ', height=' + popupHeight + ', left='+ popupX + ', top=' + popupY + ', scrollbars=yes');
				<% } else { %>
					alert("로그인이 필요한 서비스입니다.");				
				<% } %>
			})
		}
	</script>
	
	<style>
	
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
	
	
	 		/* 최종로그인 완성본틀(fixed) */
	 		.divEve {
	            width: 680px;
	            height: 800px;
	            margin-left: 300px;
	            /* margin-top: 50px; */
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
	        .lpgdiagLT,
	        .lpgdiagRT,
	        .lpgdiagRB {
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
	        .lpgTLine1,
	        .lpgTLine2,
	        .lpgTLine3 {
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
	        .lpgRLine1,
	        .lpgRLine2 {
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
	
	        .lockHC {
	            width: 150px;
	            height: 100px;
	            position: absolute;
	            top: 300px;
	            left: 430px;
	            border: 5px solid black;
	            border-right: 0px solid rgba(255, 255, 255, 0);
	            border-radius: 50px 0px 0px 50px;
	            background-color: rgb(236, 245, 224);
	        }
	
	        .lockQA {
	            width: 52px;
	            height: 100px;
	            border: 5px solid black;
	            border-left: 0px solid rgba(255, 255, 255, 0);
	            position: absolute;
	            top: 277px;
	            left: 584px;
	            transform: skewY(-40deg);
	            background-color: rgb(236, 245, 224);
	
	        }
	
	        .lock {
	            width: 5px;
	            height: 110px;
	            border: 5px solid black;
	            background-color: rgb(206, 237, 195);
	            position: absolute;
	            top: 295px;
	            left: 550px;
	        }
	        .lockHC2 {
	            width: 150px;
	            height: 100px;
	            position: absolute;
	            top: 540px;
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
	            top: 517px;
	            left: 584px;
	            transform: skewY(-40deg);
	            background-color: rgb(236, 245, 224);
	
	        }
	
	        .lock2 {
	            width: 5px;
	            height: 110px;
	            border: 5px solid black;
	            background-color: rgb(206, 237, 195);
	            position: absolute;
	            top: 535px;
	            left: 550px;
	        }
	
	
	
	        /* 자물쇠 구현 */
	
	        .lockShapeArea {
	            width: 60px;
	            height: 60px;
	            position: relative;
	            top: -60px;
	            left: 380px;
	            z-index: 1;
	        }
	        .lockShapeArea2 {
	            width: 60px;
	            height: 60px;
	            position: relative;
	            top: -60px;
	            left: 380px;
	            z-index: 1;
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
	
	            font-size: 15px;
	            font-weight: 900;
	            color:rgb(105, 98, 0);
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
	
	
	
	
	
	        /* ----------------------------- 로그인 디자인 구현 ↓↓↓↓↓↓↓↓↓↓↓↓↓ --------------------------------- */
	
	
	        .tag {
	            margin: 20px 50px;
	            width: 440px;
	        }
	
	        .syl {
	            width: 400px;
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
	
	        .join {
	            width: 200px;
	            height: 25px;
	            margin: 10px 60px;
	            font-size: 13px;
	        }
	
	        a {
	            text-decoration: none;
	            color: gray;
	        }
	
	        .logo {
	            margin-top: 40px;
	            margin-left: 320px;
	            margin-bottom: 0px;
	            width: 150px;
	            height: 40px;
	        }
	        .footer_all{
	            width: 1240px;
	            height:200px;
	            /* border: 1px solid red; */
	            position: absolute;
	            top: 1080px;
	            background-color: rgba(0, 0, 0, 0.13);
	            border-radius: 20px;
	
	        }
	        .left_logo{
	            padding-top: 60px;
	            margin-left: 100px;
	            width: 220px;
	            height: 120px;
	
	        }
	        .left_logo1{
	            margin-left: 15px;    
	            width: 180px;
	            height: 50px;
	            transform: skew(-32deg)
	        }
	        .left_logo2{
	            width: 200px;
	            height: 30px;
	        }
	        .middle_copyRight{
	            margin-left: 150px;
	            width: 450px;
	            height: 80px;
	            font-size: 12px;
	            position: absolute;
	            left: 300px;  top: 140px;
	
	        }
	        .mc1{
	            margin-left: 80px;         
	            display: inline-block;
	        }
	        .mc2{
	            margin-left: 40px;         
	            display: inline-block;
	
	        }
	        .mc3{
	            margin-top: 10px;         
	
	
	        }
	        .right{
	            width: 280px;
	            position: absolute;
	            top: 40px; left: 950px;
	
	
	        }
	        .rc{
	            width: 140px;
	
	            font-size: 26px;
	            font-weight: bold;
	
	        }
	
	        .rc2{
	            width: 480px;
	            position: absolute;
	            left: 400px; top: 20px;
	            font-style: italic;
	        }
	        
	        
	        /* 훈민 */
	        
	        .FindBox {
	            background-color:rgb(195, 209, 183);
	            border-radius: 8px;
	            height: 200px;
	            width: 400px;
	            margin: auto;
	            margin-bottom: -60px;
	        }
	        .findinputbox {
	            display: inline-block;
	            margin-top: 30px;
	        }
	        .findTitle {
	            font-weight: 900;
	            text-align: center;
	            color: rgb(255, 255, 255);
	            position: relative;
	            background-color:rgb(84, 117, 84);
	            height: 30px;
	            border-top-left-radius: 8px;
	            border-top-right-radius: 8px;
	            line-height: 30px;
	            
	        }
	        .inputtext {
	            width: 230px;
	            height: 20px;
	            /* margin-bottom: 25px; */
	            position: relative;
	            top: -0px;
	            margin-left: 20px;
	            border: none;
	            border-radius: 3px;
	            padding: 10px;
	            outline: none;
	            transition: 0.3s;
	            border-bottom: white 2px solid;
	        }
	        .inputContent {
	            position: relative;
	            top: -65px;
	            left: 30px;
	            display: none;
	            font-size: 13px;
	            font-weight: 900;
	            color:rgb(54, 99, 54);
	        }
	        .inputtext:focus {
	            border-bottom: 3px solid rgba(54, 99, 54, 0.801);
	            margin-top: 10px;
	        }
	        .inputtext:focus::placeholder {
	            color: transparent;
	        }
	        .inputtext:focus ~ .inputContent {
	            display: block;
	        }
	        .inputtext2 {
	            width: 230px;
	            height: 20px;
	            position: relative;
	            top: 10px;
	            margin-left: 20px;
	            border: none;
	            border-radius: 3px;
	            padding: 10px;
	            outline: none;
	            transition: 0.3s;
	            border-bottom: white 2px solid;
	        }
	        .inputContent2 {
	            position: relative;
	            top: -55px;
	            left: 30px;
	            display: none;
	            font-size: 13px;
	            font-weight: 900;
	            color:rgb(54, 99, 54);
	        }
	        .inputtext2:focus {
	            border-bottom: 3px solid rgba(54, 99, 54, 0.801);
	            margin-top: 20px;
	        }
	        .inputtext2:focus ~ .inputContent2 {
	            display: block;
	        }
	        .linkToLoginPage {
	            text-align: center;
	            position: relative;
	            top: -12px;
	            margin-left: 150px;
	            width: 200px;
	            height: 45px;
	            background-color:rgb(3, 68, 3);
	            border: none;
	            border-radius: 3px;
	            color: white;
	        }
	
	</style>
</head>
<body>
    <header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="${ contextPath }/js/calendarM.jsp"><img class="headerLogo" src="/syl/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ contextPath }/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="${ contextPath }/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="${ contextPath }/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="${ contextPath }/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ contextPath }/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a id="myPageLink" href="#" class="headermypage">마이페이지</a>
                  <a href="${ contextPath }/member/login" class="headerlogin">로그인</a>
                  <a href="${ contextPath }/member/logout.do" class="headerloginout">로그아웃</a>
               </div>
            </nav>
         </div>
      </header>
    <main>
        <section>
            <article>

				<!-- 최종로그인 완성본틀(fixed) -->
				<div class="divEve">
					<!-- 다이어리 로그인 메인틀 -->
					<div class="lpgmain">
						<div class="tag">
							<img class="syl" src="/syl/photo/def.png">
						</div>
                        

    <div class="wrapper2">
        <form action="${contextPath}/member/idFind.do" method="post">
            <div class="FindBox">

                <div class="findTitle">아이디 찾기</div>
                    <div class="findinputbox">
                        <input class="inputtext" type="text" name="idFindEmailAdd" placeholder="e-mail 주소">
                        <div class="inputContent">e-mail 주소</div>

                        <input class="inputtext2" type="text" name="idFindTelNum" placeholder="전화번호">
                        <div class="inputContent2">전화번호</div>
                    </div>
                    
            </div>
                <div class="lockShapeArea">
                    
                    <div class="lockShapeT"></div>
                    <div class="lockShapeR"></div>
                    <div class="lockShapeC1"></div>
                    <div class="lockS"></div>
                    <div class="lockSLL"></div>
                    <div class="lockSRL"></div>
                    <div class="lockSs"></div>
                    <input id="idFindBtn" class="lockShape" type="button" value="GO">
                </div>
        </form>
        <br><br>

        <form action="${contextPath}/member/pwdRewriteCheck.do" method="post">
            <div class="FindBox">

                <div class="findTitle">비밀번호 재설정</div>
                    <div class="findinputbox">
                        <input class="inputtext" type="text" name="pwdRewriteId" placeholder="계정 아이디">
                        <div class="inputContent">계정 아이디</div>
                        
                        <input class="inputtext2" type="text" name="pwdRewriteTelNum" placeholder="전화번호">
                        <div class="inputContent2">전화번호</div>
                    </div>
                    
            </div>
                <div class="lockShapeArea2">
                    
                    <div class="lockShapeT"></div>
                    <div class="lockShapeR"></div>
                    <div class="lockShapeC1"></div>
                    <div class="lockS"></div>
                    <div class="lockSLL"></div>
                    <div class="lockSRL"></div>
                    <div class="lockSs"></div>
                    <input id="pwdRewrting" class="lockShape" type="button" value="GO">
                </div>
        </form>
        
        <br><br>
        
        <a href="${contextPath}/member/login"><button class="linkToLoginPage" type="submit">로그인 페이지로</button></a><br>
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
	<div class="post1 It1"></div>
	<div class="post1 It2"></div>
	<div class="post1 It4"></div>
</div>
<div class="lpgRLine2">
	<!-- 포스트잇 -->
	<!-- <div class="post1 It1"></div> -->
	<div class="post1 It3"></div>
	<div class="post2 It5"></div>
	<div class="post2 It6"></div>
	<div class="post2 It7"></div>
	<div class="post2 It8"></div>
	<div class="post2 It9"></div>
</div>
<div class="lpgRLine3"></div>
<!-- 좌측 책표지 중심 구현 -->
<div class="circleHLT1"></div>
<div class="lpgLLine1"></div>
<div class="circleLine"></div>

<!-- 다이어리 여닫이-똑딱이 -->
<div class="lockQA"></div>
<div class="lockHC"></div>
<div class="lock"></div>

<div class="lockQA2"></div>
<div class="lockHC2"></div>
<div class="lock2"></div>

<!-- 자물쇠 구현 -->


</div>
</article>
</section>
</main>
<footer class="footer_all">
    <div>
        <div class="left_logo">
            <img class="left_logo1" src="/syl/photo/logo2.png"> <img
                class="left_logo2" src="/syl/photo/3syl2.png">
        </div>
        <div class="rc2">
            We ONLY contact to email during office(9-6 KTS) hours for
            assistance, as emails regarding SYL service team.<br> Do NOT
            send multiple emails as it delays our ability to respond in a timely
            manner.

        </div>
        <div class="middle_copyRight">
            <div class="mc1">이용약관</div>
            <div class="mc2">개인정보 처리방침</div>
            <div class="mc3">2022 SYL Inc. All rights reserved. This site
                for our customers.</div>

        </div>
    </div>
    <div class="right">
        <div class="rc1">
            <div class="rc">Contact Us</div>
            <br> SYL <br> Our Company Information<br> E-mail:
            syL2022@email.com<br>
        </div>
    </div>
    </div>
</footer>
</body>

</html>