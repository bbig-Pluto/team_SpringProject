<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*Q&A*/
h2 {
	margin-top:100px;
	margin-left: 600px;
	margin-bottom: 60px;
}
/*메뉴:공지사항,자주묻는 질문,문의하기 의 부모div*/


table {
	width: 80%;
	height: 120px;
}
/*탭 전체 박스*/
.box {
	width: 1000px;
	/* border: 1px solid black; */
	margin-left: 230px;
	margin-top: 10px;
}
/*q&a 추가 버튼*/
.add_btn {
	margin-left: 840px;
	width: 50px;
	height: 30px;
}

.question_p {
	width: 800px;
	height: 50px;
	background-color: #b9ceac;
	display: inline-block;
}

.q {
	display: inline-block;
	margin-left: 35px;
}

.question_p input {
	width: 700px;
	height: 25px;
	margin-top: 10px;
}

.answer_p {
	width: 800px;
	height:250px;
	background-color:rgba(211, 211, 211, 0.52);
}

.a {
	display: inline-block;
	margin-left: 35px;
	margin-top: 20px;
	vertical-align: top;
}

.answer_p textarea {
	width: 700px;
	height: 200px;
	display: inline-block;
	margin-top: 20px;
}

.list_btn {
	width: 50px;
	height: 30px;
	background-color: lightgray;
	margin-left: 240px;
	margin-top: 30px;
}

.resi_btn {
	width: 50px;
	height: 30px;
	margin-top: 30px;
	background-color: #acacac;
	margin-left: 680px;
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
/* 	 border: 1px solid red;  */
}
</style>
<script>
   window.onload=()=>{

       sendList();
   }

        

 function sendList(){
	let list_btn = document.querySelector(".list_btn");
	
	list_btn.addEventListener("click",()=>{
		frm.method="post";
		frm.action="/syl/qa";
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
               <a href="/team_Project/js/calendarM.jsp"><img class="headerLogo" src="/team_Project/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="/team_Project/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="/team_Project/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="/team_Project/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="/team_Project/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
               <a href="/team_Project/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a href="/team_Project/hunminjsp/mypage.jsp" class="headermypage">마이페이지</a>
                  <a href="/team_Project/hunminjsp/signin.jsp" class="headerlogin">로그인</a>
                  <a href="/team_Project/member/logout.do" class="headerloginout">로그아웃</a>
               </div>
            </nav>
         </div>
      </header>
	  <main>
		<section>
			<article>
				<div class="area_wrapper">
	<form name="frm" method="post" action="/syl/qa_mod_write">
		<h2>Q&A</h2>
		<div class="box">
			<div class="question_p">
				<div class="q">Q.</div>
				<input type="text" name="question" value="${param.question}">
			</div>
			<div class="answer_p">
				<div class="a">A.</div>
				<textarea name="answer"> ${param.answer}</textarea>
			</div>

		</div>
		<div>
			<input type="button"  value="목록" class="list_btn" onclick="sendList()">
			<input type="submit" name="resi" value="등록" class="resi_btn">
			<input type="hidden" name="q_no" value="${param.q_no }">
		</div>
	</form>
											</div>
			</article>
		</section>
	</main>
	
		<footer>
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

	</footer>
</body>
</html>