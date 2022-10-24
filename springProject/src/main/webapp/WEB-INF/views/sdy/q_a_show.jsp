<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2{
	margin-top:100px;
	margin-left: 600px;
}

.menu {
	display: flex;
	margin-top: 40px;
	margin-bottom: 30px;
}

.menu .m1 {
	margin-left: 450px;
}

.menu .m1 a {
	color: black;
	text-decoration: none;
}

.menu .m2 {
	margin-left: 40px;
}

.menu .m3 {
	margin-left: 40px;
}

.menu .m3 a {
	color: black;
	text-decoration: none;
}

.menu .m4 {
	margin-left: 40px;
}

.menu .m5 {
	margin-left: 40px;
}

.menu .m5 a {
	color: black;
	text-decoration: none;
}

.box {
	width: 1000px;
	height: 500px;
	/* border: 1px solid black; */
	margin-left: 1500px;
	margin-top: 10px;
	overflow: auto;
}
/*q&a 추가 버튼*/
.add_btn {
	margin-left: 840px;
	width: 50px;
	height: 30px;
}

.add_box {
	width: 800px;
	/* border: 1px solid black; */
	margin-left: 220px;
}



.question_p {
	width: 800px;
	height: 50px;
	/* background-color: #b9ceaca9; */
	background-color: #b9ceac; 
	display: inline-block;
	cursor:pointer;
/* 	border-top:1px solid #8a8989b4; */
	
}

.q {
	padding-top: 15px;
	display: inline-block;
	margin-left: 30px;
}

.question_p input {
	width: 700px;
	height: 25px;
	display: inline-block;
	margin-top: 8px;
}

.answer_p {
	width: 800px;
	height: 50px;
	display: inline-block;
	display: none;
	/* border-top:1px solid #8a8989b4; */
	
}

.a {
	display: inline-block;
	margin-left: 30px;
	margin-top: 5px;
	padding-top: 13px;
}

.write_btn{
width:60px;
height:25px;
margin-left:950px;
margin-top:30px;
/* background-color:#acacac; */
background-color:#acacac;
color:white;
}

form{
	display:inline-block;
}
.del{
	display:inline-block;
	margin-top:30px;
	width:60px;
	height:25px;
	background-color:#lightgray;
	margin-left: 220px;
	
}
.mod{
	display:inline-block;
	margin-top:30px;
	margin-bottom:5px;
	width:60px;
	height:25px;
	margin-left:700px;
	background-color:#lightgray;
}
.chk{
	display:inline-block;
}
.chk input[tpye="checkbox"]{
	display:inline-block;
}
.chkAll{
	margin-left:220px;
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
      
           show_a(); 
           qaMod();
        }
        

	
       function show_a(){
      		let add_box = document.querySelector(".add_box");
            let q = document.querySelectorAll(".add_box .question_p");
			
   		
            for(let i=0; i<q.length; i++){
            q[i].addEventListener("click",()=>{
            	//부모로 올라갔다가 내려오는 방법
                let a = event.target.parentNode.querySelector(".answer_p");
                if(a.style.display=="none"){
                    a.style.display="block"
                }else{
                    a.style.display="none"
                }
            })
            }
       
        } 
       
    	
    
    	function qaMod(){
    		let mod = document.querySelectorAll(".mod");
    		
    		
    	for(let i=0;i<mod.length; i++){
    		mod[i].addEventListener("click",(e)=>{
    			
    			
    			let data_a= e.target.dataset.a;
    			let data_q= e.target.dataset.q;
    			let data_no= e.target.dataset.no;
    			
    			console.log("data_a"+data_a);
    			console.log("data_q"+data_q);
    			console.log("data_no"+data_no);
    			
    			frmMod.querySelector(".hidden_a").value= data_a
    			frmMod.querySelector(".hidden_q").value = data_q
    			frmMod.querySelector(".hidden_no").value= data_no
    			
    			frmMod.method="post";
    			frmMod.action="/syl/qa_mod";
    			frmMod.submit();
    		 })
    		
    	}
    
    	}
    	
    	 //전체선택 박스 해제
    	 function checkSelectAll()  {
    		  // 전체 체크박스
    		  const checkboxes 
    		    = document.querySelectorAll('input[name="check"]');
    		  // 선택된 체크박스
    		  const checked 
    		    = document.querySelectorAll('input[name="check"]:checked');
    		  // select all 체크박스
    		  const selectAll 
    		    = document.querySelector('input[name="checkAll"]');
    		  
    		  if(checkboxes.length === checked.length)  {
    		    selectAll.checked = true;
    		  }else {
    		    selectAll.checked = false;
    		  }

    	}
    	
    	function selectAll(selectAll) {
    		  const checkboxes 
    		       = document.getElementsByName('check');
    		  let allCheck =document.querySelector(".check")
    		  checkboxes.forEach((checkbox) => {
    		    checkbox.checked = selectAll.checked;

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
	<h2>Q&A</h2>
	<div class="menu">
		<div class="m1">
			<a href="/syl/notice">공지 사항</a>
		</div>
		<div class="m2">|</div>
		<div class="m3">
			<a href="/syl/qa">자주 묻는 질문</a>
		</div>
		<div class="m4">|</div>
		<div class="m5">
			<a href="/syl/ask">문의하기</a>
		</div>
	</div>
	<%
	HttpSession userInfo = request.getSession();
	String sessionId = "" + userInfo.getAttribute("logOn.id");
	
%>
	 <% if("admin01".equals(sessionId)){%> 
	
   <form action="/syl/qa_delCheck" method="post"> 
	<div class="chkAll"><input type="checkbox" name="checkAll" onclick="selectAll(this)">전체선택</div>
  <%} %>
  <c:forEach var="list" items="${ list}">
	<div class="add_box">
	<% if("admin01".equals(sessionId)){%> 
  		 <div class="chk" ><input type="checkbox"  name="check" value="${list.q_no }" onclick="checkSelectAll()"></div>
		  	<input type="button" class="mod" value="수정" data-a="${list.answer}" data-q="${list.question }" data-no="${list.q_no }"> 
  		 <%} %>
		<div class='question_p'>
			<div class='q'>
				Q.${list.question }
			</div>
		</div>
		<div class='answer_p'> 
			<div class='a'>
				A.${list.answer}
		</div>
		</div>
  		 <input type="hidden" name="q_no" value="${list.q_no }">
	</div>
	</c:forEach>
	<%if(sessionId.equals("admin01")) {%> 
	<input type="submit" value="삭제" class="del" class="del_btn">
	 <%} %> 
  </form> 
	<form name="frmMod" >
		  	<input type="hidden" name="answer"  class="hidden_a"> 
		  	<input type="hidden" name="question"  class="hidden_q" > 
		  	<input type="hidden" name="q_no"  class="hidden_no"> 
		</form>
 <%if(sessionId.equals("admin01")) {%> 
  <form action="/syl/Qwrite" method="post">
<input type="submit" value="글쓰기" class="write_btn">
  </form>
  <%} %> 
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