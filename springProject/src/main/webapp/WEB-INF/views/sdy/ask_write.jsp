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
	margin-bottom: 60px;
}

.all_title {
	margin-left: 300px;
}

.all_title select {
	display: inline-block;
	width: 100px;
	height: 30px;
}

.all_title input {
	width: 500px;
	height: 30px;
}

.t {
	display: inline-block;
}

textarea {
	width: 650px;
	height: 200px;
	margin-left: 300px;
	margin-top: 20px;
	padding-top: 20px;
	padding-left: 10px;
}

.sec {
	margin-top: 10px;
}

.sec .open {
	margin-left: 300px;
}

.pw {
	margin-left: 300px;
	margin-top: 10px;
}

.pw .pw_name {
	display: inline-block;
}

.pw input {
	display: inline-block;
	width: 597px;
	height: 30px;
}

.btn {
	margin-left: 310px;
	margin-top: 30px;
	display: inline-block;
}

.btn .regi {
	width: 50px;
	height: 25px;
	margin-right: 10px;
	background-color: gray;
	color: white;
	margin-left: 540px;
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
	/*  border: 1px solid red;  */
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
	regi();
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
		frm.action="/syl/ask";
		frm.submit();
		
	})

 }
 
 function regi(){
	 let regi_btn = document.querySelector(".regi");
	
	 regi_btn.addEventListener("click",()=>{
		 
		 let secret = frm.ask_secret.value;
		 let pwd=frm.ask_pwd.value;
		 let title = frm.title.value;
		 let content = frm.content.value;
		 if(title==""){
			 alert("제목을 입력해주세요")
		 }else{
			 if(content==""){
					alert("내용을 입력해주세요")
				}else{
					 if(secret==="secret"){
						 if(pwd==null || pwd.trim().length==0){
							 alert("비밀글 작성 시 비밀번호는 필수입니다.")
						 }else{
							 frm.method="post" 
							 frm.action="/syl/insert"
							 frm.submit();
						 }
					 }else{
						 frm.method="post" 
							 frm.action="/syl/insert"
							 frm.submit();
					 }
	 
				}
		 }
 })
 
 }
 

	 
	 
 
</script>

</head>
<body>
<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="/team_Project/js/calendarM.jsp"><img class="headerLogo" src="/team_Project/photo/3syl.png"></a>
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
	  <main>
		<section>
			<article>
				<div class="area_wrapper">
	<form name="frm" method="post" action="/team_Project/ask">
		<h2>문의하기</h2>
		<div class="all_title">
			<div class="t">
				<strong>제목</strong>
			</div>
			<select name="ask_classify" class="select">
				<option value="문의" selected>문의</option>
				<option value="재문의">재문의</option>
				<option value="제안">제안</option>
			</select> <input type="text" name="title">
		</div>
		<div>
			<textarea name="content" rows="10" cols="30" placeholder="*추가 문의를 하실 때는 재문의 말머리 선택 후 답글로 달아주시기 바랍니다."></textarea>
		</div>
		<div class="sec">
			<input type="radio" name="ask_secret" value="open" class="open" checked>공개글 
				<input type="radio" name="ask_secret" value="secret">비밀글
		</div>
		<div class="pw">
			<div class="pw_name">
				<strong>비밀번호</strong>
			</div>
			<input type="password" name="ask_pwd" placeholder="비밀번호를 입력해주세요">
		</div>
		<div class="btn">
			<input type="button" value="목록" class="list" onclick="sendList()">
			<input type="button" value="등록" class="regi">
			 <input type="hidden" name="board_no" value="${list.board_no }"> 
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