<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.servlet.http.HttpSession"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2 {
	margin-top:100px;
	margin-left: 570px;
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
	margin-left: 290px;
	margin-top: 20px;
	padding-top: 20px;
	padding-left: 10px;
}

.sec {
	margin-top: 10px;
}

.sec .open {
	margin-left: 290px;
}

.pw {
	margin-left: 290px;
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
	margin-left: 545px;
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
	
	list_btn.addEventListener("click",()=>{
		frm.action="/syl/detail?board_no=${list.board_no}";
		frm.submit();
		
	})

 }
 
 function regi(){
	 let regi_btn = document.querySelector(".regi");
	 let secret = frm.ask_secret.value;
	 let pwd=frm.ask_pwd.value;
	 regi_btn.addEventListener("click",()=>{
	 if(secret==="secret"){
		 if(pwd==null || pwd.trim().length==0){
			 alert("비밀글 작성 시 비밀번호는 필수입니다.")
		 }else{
			 frm.method="post" 
			 frm.action="/syl/ask_mod_write?board_no=${list.board_no }"
			 frm.submit();
		 }
	 }else{
		 frm.method="post" 
			 frm.action="/syl/ask_mod_write?board_no=${list.board_no }"
			 frm.submit();
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
               <a href="/syl/js/calendarM.jsp"><img class="headerLogo" src="/syl/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="/syl/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="/syl/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="/syl/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="/syl/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
               <a href="/syl/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a href="/syl/hunminjsp/mypage.jsp" class="headermypage">마이페이지</a>
                  <a href="/syl/hunminjsp/signin.jsp" class="headerlogin">로그인</a>
                  <a href="/syl/member/logout.do" class="headerloginout">로그아웃</a>
               </div>
            </nav>
         </div>
      </header>
	  <main>
		<section>
			<article>
				<div class="area_wrapper">
	<form name="frm" method="post" action="/syl/ask">
		<h2>문의하기</h2>
	<%-- 	<%
			HttpSession testSession = request.getSession();
			   String ask_classify =(String)testSession.getAttribute("ask_classify"); 
			   String board_no =(String)testSession.getAttribute("board_no"); 
			  System.out.println("디테일에서 수정으로 넘어온 no:"+board_no);
				String title =(String)testSession.getAttribute("title"); /* 
			   request.getAttribute("id");  */
			   String content =(String)testSession.getAttribute("content"); 
			   String ask_secret =(String)testSession.getAttribute("ask_secret"); 
			System.out.println("수정에 넘어온 값 :"+ask_secret );
			   String ask_pwd =(String)testSession.getAttribute("ask_pwd"); 
			   
			   %> --%>
		<div class="all_title">
			<div class="t">
				<strong>제목</strong>
			</div>
			
			<select name="ask_classify" class="select">
				<c:choose>
					<c:when test="${ list.ask_classify eq '문의'}">
						<option value="문의" selected>문의</option>
						<option value="재문의">재문의</option>
						<option value="제안">제안</option>
					</c:when>
					<c:when test="${ list.ask_classify eq '재문의'}">
						<option value="문의" >문의</option>
						<option value="재문의" selected>재문의</option>
						<option value="제안">제안</option>
					</c:when>
					<c:otherwise>
						<option value="문의" >문의</option>
						<option value="재문의">재문의</option>
						<option value="제안" selected>제안</option>
					</c:otherwise>
				</c:choose>
			</select> 
			<input type="text" name="title" value="${list.title }">
		</div>
		<div>
			<textarea name="content" rows="10" cols="30">${list.content }</textarea>
		</div>
		<div class="sec">
			<c:choose>
				<c:when test="${ list.ask_secret eq 'open' }">
					<input type="radio" name="ask_secret" value="open" class="open" checked>공개글 
					<input type="radio" name="ask_secret" value="secret">비밀글
				</c:when>
				<c:otherwise>
					<input type="radio" name="ask_secret" value="open" class="open">공개글 
					<input type="radio" name="ask_secret" value="secret"  checked>비밀글
				</c:otherwise>
			</c:choose>
		</div>
		<div class="pw">
			<div class="pw_name">
				<strong>비밀번호</strong>
			</div>
			<c:choose>
				<c:when test="${list.ask_secret eq 'secret' }">
					<input type="password" name="ask_pwd" value="${list.ask_pwd}">
				</c:when>
				<c:otherwise>
					<input type="password" name="ask_pwd">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="btn">
			<!-- <form name="frm"> -->
				<input type="button" value="목록" class="list" onclick="sendList()">
		<!-- 	</form> -->
			<input type="button" value="등록" class="regi" onclick="regi()">
		</div>
	</form>
						</div>
			</article>
		</section>
	</main>
	
		<!-- <footer>
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