<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
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
	margin-bottom:50px;
	margin-left: 600px;
}

.box {
	margin-left: 280px;
}

.title_p {
	border-top:1px solid #8a8989b4;
	border-bottom:1px solid #8a8989b4;
	width: 700px;
	height: 30px;
	padding-top: 12px;
	padding-left: 10px;
}

.title {
	display: inline-block;
}

.title_text {
	display: inline-block;
	margin-left: 50px;
}

.nick_p {
	width: 700px;
	height: 30px;
	padding-top: 12px;
	padding-left: 10px;
}

.nick {
	display: inline-block;
}

.id_text {
	display: inline-block;
	margin-left: 40px;
}

.content {
	width: 700px;
	height: 300px;
		border-top:1px solid #8a8989b4;
	border-bottom:1px solid #8a8989b4;
	padding-left: 10px;
	padding-top: 30px;
}

.list {
	background-color:#acacac;
	width: 60px;
	height: 30px;
	margin-left: 300px;
	margin-top: 20px;
}
.view_more img{
	width: 30px;
	height: 30px;
	margin-left:670px;
	cursor : pointer
}
/*모달창*/
 .parent{
            /*전체 100%로 잡고 위치는 맨왼쪽끝.앱솔루트로 고정*/
            /* border: 1px solid black; */
            display:flex;
            width: 100px;
            height: 150px;
            position: absolute;
            top:200px;
            left:1020px;
            align-items: center;
            justify-content: center;
            background-color:#b9ceac;
            
            /*안보이게 하기*/
            display: none;


        }
  .close{
  	margin-bottom:10px;
  }
  .close button{
  	margin-left:80px;
	
  }
   
  .parent a{
  	text-decoration:none;
  	color:black;
	
  }
  .parent .mod{
  	margin-left:20px;
	
  }

  .parent .del_text{
  	margin-left:20px;
  	cursor: pointer;
    text-decoration:none;
  	color:black;
	
  }

    .del_p{
            /* 전체100%로 잡고, 위치는 맨위왼쪽끝. 앱솔루트로 고정.*/
            width: 100%;
            height: 100%;
/*             display: flex; */
            position: absolute;
            left:0;
            top:0;
            align-items: center;
            justify-content: center;

            /* 바탕 블러하기. */
            background-color: rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(1.5px);

            /* 안보이게 하기 */
            display: none;
  }
  .del{

            width: 400px;
            height: 150px;
			position:absolute;
			 top:200px;
			left:400px;
            border-radius: 30px;
            background-color: rgba(208, 204, 204, 0.389);
            backdrop-filter: blur(1.5px);
        }
        .warn{
            border-bottom: 1px solid rgba(168, 166, 166, 0.606);
            padding-top: 50px;
            padding-bottom: 50px;
            text-align: center;
        }
        .go, .cancel{
            display: inline-block;
            vertical-align: top;
        }
        .go a{
            cursor: pointer;
            text-decoration:none;
  	        color:black;
            margin-left: 310px;
            margin-right: 10px;
            display: inline-block;
            padding-top: 5px;
            
        }
        .cancel a{
            cursor: pointer;
            text-decoration:none;
  	        color:black;
              display: inline-block;
              padding-top: 5px;
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
</style>
<script>
window.onload=()=>{
	show();
	close();
	showdel();
	modaldel();

}

//점세개 클릭시 창 열리게 하기
function show(){
   
    let view =document.querySelector(".view_more");
    let pa =document.querySelector(".parent");
    view.addEventListener("click",()=>{
        if(pa.style.display="none"){
            pa.style.display="block";
        }else{
        	pa.style.display="none"
        }
    })

}
//x버튼 클릭시 창 닫히게 하기
function close(){
    let x= document.querySelector(".close button")
    let pa=document.querySelector(".parent")
    x.addEventListener("click",()=>{
         pa.style.display="none";
    })
    
 }
 
function showdel(){
    let del=document.querySelector(".del_text");
    let pa1=document.querySelector(".parent")
    let pa=document.querySelector(".del_p");
    del.addEventListener("click",()=>{
    	if(pa1.style.display="block"){
    		pa1.style.display="none";
        if(pa.style.display="none"){
            pa.style.display="block";
        }else{
        	pa.style.display="block";
        }
    }
    })

}
function modaldel(){
   let cancel=document.querySelector(".del .cancel")
   let pa=document.querySelector(".del_p")
   cancel.addEventListener("click",()=>{
        pa.style.display="none";
   })
   
}




</script>
</head>
<body class="bd">
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
	<form method="post" action="/syl/notice">
		<h2>공지사항</h2>
		<div class="box">
<%

	HttpSession userInfo = request.getSession();
	String sessionId = "" + userInfo.getAttribute("logOn.id");
  
	%>
			
	 <div class="del_p">
				    <div class="del">
				        <div class="warn"><strong>삭제하시겠습니까?</strong></div>
				        <div class="go">
				            <a href="/syl/Ndel?board_no=${list.board_no }" >확인</a>
				        </div>
				        <div class="cancel">
				            <a href="/syl/Ndetail?board_no=${list.board_no }">취소</a>
				        </div>
				    </div>
			    </div>
	 <%if("admin01".equals(sessionId)){ %> 
			<div class="view_more">
				<img src="https://cdn-icons-png.flaticon.com/512/7794/7794501.png">
			</div>
			<div class="parent">
			       <div class="close">
            			<button type="button" style="height:15px; width: 15px; font-size: 10px; padding: 0; background-color:rgba(217, 225, 143, 0.684);">X</button>
   					 </div>
			   
		        <a href="/syl/Nmod?board_no=${list.board_no}" class="mod">수정하기</a><br>
		        <br>
		         <div class="del_text">삭제하기</div><br>
		        <br>
	    	</div>
		 	 <%
				 }
			   %> 
			<div class="title_p">
				<div class="title">
					<strong>제목</strong>
				</div>
				<div class="title_text">${list.title }</div>
			</div>
			<div class="nick_p">
				<div class="nick">
					<strong>작성자</strong>
				</div>
				<div class="id_text">${list.id }</div>
			</div>
			<div class="content">${list.content}</div>
		</div>

		<input type="submit" value="목록" class="list">
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