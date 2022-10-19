<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*"
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
	margin-bottom:50px;
	margin-left: 580px;
	/* margin-left: 45%; */
}

.box {
	margin-left: 290px;
}

.title_p {
	border-top: 1px solid #8a8989b4;
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
	border-bottom: 1px solid #8a8989b4;
	width: 700px;
	height: 30px;
	padding-top: 12px;
	padding-left: 10px;
}

.nick {
	display: inline-block;
}

.nick_text {
	display: inline-block;
	margin-left: 40px;
}

.content {
	width: 700px;
	height: 300px;
	border-bottom: 1px solid #8a8989b4;
	padding-left: 10px;
	padding-top: 30px;
}

.list {
	width: 50px;
	height: 25px;
	margin-left: 300px;
	margin-top: 20px;
}
.view_more img{
	width: 30px;
	height: 30px;
	margin-left:670px;
	cursor : pointer
}
 .parent{
            /*전체 100%로 잡고 위치는 맨왼쪽끝.앱솔루트로 고정*/
            /* padding-top:20px; */
            /* border: 1px solid black; */
            display:flex;
            width: 100px;
            height: 150px;
            position: absolute;
            top:200px;
            left:1020px;
            align-items: center;
            justify-content: center;
            background-color:lightgray;
            
            /*안보이게 하기*/
            display: none;


        }
   
  .parent a{
  
  	text-decoration:none;
  	color:black;
	
  }
  .close{
  	margin-bottom:10px;
  }
  .close button{
  	margin-left:80px;
	
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
  .parent .re{
  	margin-left:20px;
	
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
   .list{
   	width:80px;
	height:30px;
	background-color:litghtgray;
	
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
	 /* border: 1px solid red; */
}
.reBox{
	width:710px;
	background-color:#b9ceaca2;
	margin-left: 290px;
	
}
.re_inbox{
	margin-left:10px;
	border-bottom:1px solid lightgray;
}
.re_id{
	display:inline-block;
	margin-top:5px;
}
.re_date{
	display:inline-block;
	font-size:10px;
}
.re_content{
	font-weight: lighter;
	margin-bottom:8px;

}
.re_title{
/* 	margin-top:20px; */
	margin-left:290px;
}
.re_content_input{
	width:703px;
	height:70px;
	margin-left: 290px;
	position:relative;
}
.reply_btn{
	margin-left:960px;
	margin-top:10px;
	
}
.re_writer{
 	position:relative;
	top:50px; 
	left:300px; 
	z-index: 1;
	
}
.mod_re{
	margin-left:590px;
	font-size:13px;
	color: black;
}
.del_re{
	font-size:13px;
	color: black;
}
.re_re{
	font-size:13px;
	color: black;
}

</style>
<script>
window.onload=()=>{
 
 show();
 close();  
 showdel();
 modaldel();

}

//게시글 점세개 클릭시 모달창 열리게 하기
function show(){
    let view =document.querySelector(".view_more");
    let pa =document.querySelector(".parent");
    view.addEventListener("click",(e)=>{
    	console.log(e.currentTarget)
        if(pa.style.display="none"){
            pa.style.display="block";
        }else{
        	pa.style.display="none"
        }
    })

} 
//게시글 모달창 닫기
function close(){
    let x= document.querySelector(".close button")
    let pa=document.querySelector(".parent")
    x.addEventListener("click",()=>{
         pa.style.display="none";
    })
    
 }
 //삭제 경고창
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
//댓글 쓰기
function replyInsert(){
	let reply_btn = document.querySelector(".reply_btn");

		replyFrm.method="post";
		replyFrm.action="/syl/insertReply?board_no=${list.board_no }";
		replyFrm.submit();
		
}



</script>
</head>
<body class="bd">
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
		<h2>문의하기</h2>
		<div class="box">
		  <div class="del_p">
				    <div class="del">
				        <div class="warn"><strong>삭제하시겠습니까?</strong></div>
				        <div class="go">
				            <a href="/syl/ask_del?board_no=${list.board_no }" >확인</a>
				        </div>
				        <div class="cancel">
				            <a href="/syl/detail?board_no=${list.board_no }">취소</a>
				        </div>
				    </div>
			    </div>
		<%--  <%HttpSession userInfo = request.getSession();
			String sessionId = "" + userInfo.getAttribute("logOn.id");
			
			if(!sessionId.equals("null")){
			%>	 --%>
			<div class="view_more">
				<img src="https://cdn-icons-png.flaticon.com/512/7794/7794501.png">
			</div>
		<%-- 	<%} %> --%>
			<div class="parent">
		            <div class="close">
            			<button type="button" style="height:15px; width: 15px; font-size: 10px; padding: 0; background-color:lightgray;">X</button>
   					 </div>
			 <%--   <%
			   HttpSession testSession = request.getSession();
			   testSession.setAttribute("ask_classify",ask_classify); 
			   testSession.setAttribute("board_no",board_no); 
			   testSession.setAttribute("title",title); 
/* 			   request.setAttribute("id",id);  */
			   testSession.setAttribute("content",content); 
			   testSession.setAttribute("title",title); 
			   testSession.setAttribute("ask_secret",ask_secret); 
			   System.out.println("수정전 설정한 값 :"+ask_secret );
			   testSession.setAttribute("ask_pwd",ask_pwd); 
			   
		
	
			   %> --%>
			  <%--  <%if(id.equals(sessionId) || "admin01".equals(sessionId)){ %>	 --%>
		        <a href="/syl/ask_mod?board_no=${list.board_no }" class="mod">수정하기</a><br>
		        <br>
		        <div class="del_text">삭제하기</div><br>
		        <br>
		       <%--  <%} %>  --%>
		        <a href="/syl/reWrite?board_no=${list.board_no }" class="re">답글달기</a> 
	    	</div>
		

			<div class="title_p"> 
				<div class="title">
					<strong>제목</strong>
				</div>
				<div class="title_text">
					[${list.ask_classify}] ${list.title}</div>
			</div>
			<div class="nick_p">
				<div class="nick">
					<strong>작성자</strong>
				</div>
				<div class="nick_text">${list.id}</div>
			</div>
			<div class="content">${list.content}</div>
		</div>
		<div class="reBox">
		<c:forEach var="reply" items="${ReplyList }">
			<c:choose>
				<c:when test="${empty reply.parent_no }">
					<div class="re_inbox">
						<div class="re_id">${reply.id}</div>
						<div class="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="YYYY-MM-dd"/></div>
						<div class="re_content">${reply.content}</div>
						<a href="" class="mod_re">수정</a>
						<a href="/syl/ask_reply_del?re_no=${reply.re_no }&board_no=${param.board_no }" class="del_re">삭제</a>
						<a href="" class="re_re">답글쓰기</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="re_inbox" style="padding:padding-left:${list.level *10}px;">
					ㄴ
						<div class="re_id">${reply.id}</div>
						<div class="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="YYYY-MM-dd"/></div>
						<div class="re_content">${reply.content}</div>
						<a href="" class="mod_re">수정</a>
						<a href="/syl/ask_reply_del?re_no=${reply.re_no }&board_no=${param.board_no }" class="del_re">삭제</a>
						<a href="" class="re_re">답글쓰기</a>
					</div>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
					<div class="re_writer">본인id</div>
		<form name="replyFrm" class="frm" >
			<div class="re_title">댓글쓰기</div>
			<input type="text" name="content" class="re_content_input">
			<input type="button" value="등록" onclick="replyInsert()" class="reply_btn">
		</form>

	<form method="post" action="/syl/ask">
		<input type="submit" value="목록" class="list">
	</form>
					</div>
			</article>
		</section>
	</main>
	
		<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="sdy/logo2.png"> <img
					class="left_logo2" src="sdy/3syl2.png">
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