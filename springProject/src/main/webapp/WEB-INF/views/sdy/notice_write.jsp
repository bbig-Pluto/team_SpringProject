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
	margin-left: 560px;
	margin-bottom: 60px;
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

.btn .regi {
	width: 50px;
	height: 25px;
	margin-right: 10px;
	background-color: gray;
	color: white;
	margin-left: 470px;
}

.btn .cancel {
	width: 50px;
	height: 25px;
	background-color: lightgray;
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
/*  border: 1px solid red; */
}
</style>
<script>
window.onload=()=>{
	sendList();
 	regi(); 
}

 function sendList(){
	let list_btn = document.querySelector(".list");
		let title=frm.title.value;
	
	list_btn.addEventListener("click",()=>{
		frm.method="post";
		frm.action="/syl/notice";
		frm.submit();
		
	})

 }
 
 function regi(){
	 let regi_btn = document.querySelector(".regi");
	 regi_btn.addEventListener("click",()=>{
	//이벤트 리스너 밖에 있으면 if문안에서 값이 유지되지않으므로 안에 적어주기
		 let title = frm.title.value;
		 let content = frm.content.value;
				if(title==""){
					alert("제목을 입력해주세요")
				}else{
					if(content==""){
						alert("내용을 입력해주세요")
					}else{
					frm.method="post" 
						 frm.action="/syl/Ninsert"
						 frm.submit();
					}				
				}
	 
 }) 
 
  } 
</script>
</head>
<body>
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="/syl/js/calendarM.jsp"><img class="headerLogo" src="/syl/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="/syl/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="/syl/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="/syl/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="/syl/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
             <a href="/syl//notice" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                   <a href="/syl/member/rd/mypage " class="headermypage">마이페이지</a>
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
	<form name="frm">
		<h2>공지사항</h2>
		<div class="title_p">
			<div class="title">
				<strong>제목</strong>
			</div>
			<input type="text" name="title">
		</div>
		<div class="cont">
			<textarea name="content" rows="10" cols="30"></textarea>
		</div>
		<div class="radi">
			<input type="radio" name="n_set" value="공지">공지글
			 <input type="radio" name="n_set" value="일반" checked>일반글
		</div>
		<div class="btn">
			<input type="button" value="목록" class="list" onclick="sendList()">
			<input type="button" value="등록" class="regi"> 
			<input type="reset" value="취소" class="cancel"> 
			<input type="hidden" name="command" value="addNotice">
		</div>
	</form>
									</div>
			</article>
		</section>
	</main>
	
	<!-- 	<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="./logo2.png"> <img
					class="left_logo2" src="./3syl2.png">
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

	</footer> -->
</body>
</html>