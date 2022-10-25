<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
<style>
h2 {
	margin-top:100px;
	margin-left: 580px;
}

.title_p {
	display: inline-block;
	margin-left: 300px;
}

.title_p .title {
	display: inline-block;
}

.title_p input[type=text] {
	width: 600px;
	height: 30px;
}

.cont textarea {
	margin-top: 20px;
	margin-left: 300px;
	width: 635px;
	height: 200px;
}

.radi {
	margin-left: 300px;
	margin-top: 10px;
}

.btn {
	margin-left: 300px;
	margin-top: 30px;
	display: inline-block;
}

.btn .resi {
	width: 50px;
	height: 25px;
	margin-right: 10px;
	background-color: gray;
	color: white;
	margin-left: 535px;
}

.list {
	width: 50px;
	height: 25px;
	background-color: lightgray;
}
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
/*헤더 끝*/
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
/*footer 끝*/
/* 전체 틀 잡기 */
main {
	/* border: 3px solid black; */
	
}

.area_wrapper {
	width: 1240px;
	height: 920px;
	position: absolute;
	/* border: 1px solid red;  */
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
	sendList();
	
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

 function sendList(){
	let list_btn = document.querySelector(".list");
	
	list_btn.addEventListener("click",()=>{
		frm.method="post";
		frm.action="/syl/Ndetail?board_no=${list.board_no}";
		frm.submit();
		
	})

 }
</script>
</head>
<body>
<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="/syl/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="/syl/bar/intro" class="headersub">다이어리 소개 |</a> 
               <a href="/syl/bar/story11" class="headersub">다이어리 구성 |</a> 
               <a href="/syl/bar/func"  class="headersub">다이어리 기능 |</a> 
               <a href="/syl/bar/shot11"  class="headersub">다이어리 사용법 |</a> 
               <a href="/syl//notice" class="headersub">고객의 소리</a>ass="headersub">고객의 소리</a>
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
      </header>>
	  <main>
		<section>
			<article>
				<div class="area_wrapper">
	<form name="frm" action="/syl/notice_mod_write?board_no=${list.board_no }" method="post">
		<h2>공지사항</h2>

		<div class="title_p">
			<div class="title">
				<strong>제목</strong>
			</div>
			<input type="text" name="title" value="${list.title}">
		</div>
		<div class="cont">
			<textarea name="content" rows="10" cols="30">${list.content}</textarea>
		</div>
		<div class="radi">
		<c:choose>
			<c:when test="${list.n_set eq '공지' }">
				<input type="radio" name="n_set" checked>공지글
				 <input type="radio" name="n_set">일반글
			</c:when>
			<c:otherwise>
				<input type="radio" name="n_set" value="공지" >공지글
				<input type="radio" name="n_set"  value="일반" checked>일반글
			</c:otherwise>
		</c:choose>
		</div>
		<div class="btn">
			<input type="button" value="목록" class="list" onclick="sendList()">
			<input type="submit" value="등록" class="resi"> 
		</div>
	</form>
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
				assistance, as emails regarding syl service team.<br> Do NOT
				send multiple emails as it delays our ability to respond in a timely
				manner.

			</div>
			<div class="right_contact">
				<div class="rc">Contact Us</div>
				<br> syl <br> Our Company Information<br> E-mail:
				syl2022@email.com<br>
			</div>

			<div class="middle_copyRight">
				<div class="mc1">이용약관</div>
				<div class="mc2">개인정보 처리방침</div>
				<div class="mc3">2022 syl Inc. All rights reserved. This site
					for our customers.</div>

			</div>
		</div>

	</footer> 
</body>
</html>