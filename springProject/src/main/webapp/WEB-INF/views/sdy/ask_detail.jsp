<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*"
	import="javax.servlet.http.HttpSession"%>
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
            width: 1200px;
            height: 925px;
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
            z-index:2 ; 
  
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
	margin-bottom:20px;
	
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
	position: relative;
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
	position: relative;
	left: 300px;
	top: -230px;
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
	position: relative;
	top: -220px;
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
	position: relative;
	left: 400px;
	top: -160px;
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
.re_mod_title{
/* 	margin-top:20px; */
	margin-left:290px;
	text-decoration: underline;
	font-style:italic;
	
}
.re_title_mod{
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
	margin-top:10px;
	margin-left:960px;
	
}
.reply_mod_btn{
	margin-top:10px;
	margin-left:960px;
	
}
.reply_re_btn{
	margin-top:10px;
	
}
.mod_cancel_btn{
	margin-left:920px;
	margin-top:10px;
	
}
.re_cancel_btn{
	margin-left:920px;
	margin-top:10px;
	
}
.reply_regi_btn{
	margin-top:10px;
	
}
.re_writer{
 	position:relative;
	top:50px; 
	left:300px; 
 	z-index:1 ; 
	
}
.re_menuBox{
 	margin-left:590px; 
}
.mod_re{
/* 	margin-left:590px; */
	font-size:13px;
	color: black;
	display:inline-block;
	cursor: pointer;
	text-decoration: underline;

}
.del_re{
	font-size:13px;
	color: black;
}
.re_re{
	font-size:13px;
	color: black;
	display:inline-block;
	cursor: pointer;
	text-decoration: underline;
}
.re_mod_box{
	display:none;
}
.re_re_box{
	display:none;
}
.reicon{
display:inline-block;
vertical-align:top; 
font-size:10px;
}

</style>
<script>
window.onload=()=>{
 
 show();
 close();  
 showdel();
 modaldel();
 reMod();
 modCancel();
 reRe();
 reReCancel();

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
//댓글 수정하기
function replyModGo(){
	let reply_mod_btn = document.querySelector(".reply_mod_btn");
	
		
		replyMod.method="post";
		replyMod.action="/syl/ask_reMod_write?board_no=${list.board_no}";
		replyMod.submit();
		
}
//답댓글달기
function replyDelGO(){
	//form안에 name이 content인걸 컨트롤러에서 받아오지못해서 자스에서 value값으로 get방식으로 보내줌
	let content = document.querySelector(".re_content_input").value;
	replyRe.method="post";
	replyRe.action="/syl/insertReply?board_no=${list.board_no}";
	replyRe.submit();
		
}

//댓글 수정 클릭시 수정 박스
function reMod(){
	let re_re_box = document.querySelector(".re_re_box");
	let re_mod = document.querySelectorAll(".mod_re");
	let mod_box = document.querySelector(".re_mod_box");
	let re_box = document.querySelector(".re_box");
	
	for(let i=0;i<re_mod.length;i++){
		re_mod[i].addEventListener("click",(e)=>{
			//해당 re_mod의 데이터속성값을 가져와서 
		let re_no = e.target.dataset.re_no;
			if(mod_box.style.display="none"){
				re_box.style.display="none"
				//hidden value에 넣어줌
				document.getElementById('re_no_hidden').value = re_no;
				mod_box.style.display="block"
			}
			if(re_re_box.style.display="block"){
			re_re_box.style.display="none"
		    }
	})
		
	}
}
//댓글 답댓쓰기 클릭시 답댓글 박스 
function reRe(){
	let re_re = document.querySelectorAll(".re_re");
	let re_re_box = document.querySelector(".re_re_box");
	let re_box = document.querySelector(".re_box");
	let mod_box = document.querySelector(".re_mod_box");
	
	for(let i=0;i<re_re.length;i++){
		re_re[i].addEventListener("click",(e)=>{
			//해당 re_re의 데이터속성값을 가져와서 
			let re_no = e.target.dataset.re_re_no;
			console.log("reno",re_no);
			if(re_re_box.style.display="none"){
				re_box.style.display="none"
				document.getElementById('re_re_no_hidden').value = re_no;
				re_re_box.style.display="block"	
			}
			if(mod_box.style.display="block"){
				mod_box.style.display="none"
			}
	})
		
	}
}
//댓글 수정 취소버튼 클릭시 댓글쓰기 박스로
function modCancel(){
	let mod_box = document.querySelector(".re_mod_box");
	let re_box = document.querySelector(".re_box");
	let reply_cancel_btn = document.querySelector(".mod_cancel_btn");
	
	reply_cancel_btn.addEventListener("click",()=>{
		if(re_box.style.display="none"){
			re_box.style.display="block"
			mod_box.style.display="none"
		}
		})
	
}
//댓글 대댓글 취소버튼 클릭시 댓글쓰기 박스로
function reReCancel(){
	let mod_box = document.querySelector(".re_re_box");
	let re_box = document.querySelector(".re_box");
	let reply_cancel_btn = document.querySelector(".re_cancel_btn");
	
	reply_cancel_btn.addEventListener("click",()=>{
		if(re_box.style.display="none"){
			re_box.style.display="block"
			mod_box.style.display="none"
		}
		})
	
}




</script>
</head>
<body class="bd">
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
					<h2>문의하기</h2>
					<div class="box">
					<%--   <% 
					 	HttpSession userInfo = request.getSession();
						String sessionId = "" + userInfo.getAttribute("logOn.id");
						%>	  --%>
						 <c:if test="${!empty sessionId}">
							<div class="view_more">
								<img src="https://cdn-icons-png.flaticon.com/512/7794/7794501.png">
							</div>
					 	</c:if> 
						<div class="parent">
					            <div class="close">
			            			<button type="button" style="height:15px; width: 15px; font-size: 10px; padding: 0; background-color:lightgray;">X</button>
			   					 </div>
							<c:if test="${list.id eq sessionId || sessionId eq 'admin01'}">
						        <a href="/syl/ask_mod?board_no=${list.board_no }" class="mod">수정하기</a><br>
						        <br>
						        <div class="del_text">삭제하기</div><br>
						        <br>
					        </c:if>
					        <a href="/syl/reWrite?board_no=${list.board_no }" class="re">답글달기</a> 
				    	</div>
					
			
						<div class="title_p"> 
							<div class="title">
								<strong>제목</strong>
							</div>
							<div class="title_text">[${list.ask_classify}] ${list.title}</div>
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
					<!-- 시스템에서 현제시간 -->
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<c:set var="sysNow"><fmt:formatDate value="${now}" pattern="YYYY-MM-dd" /></c:set> 
								<!-- 뎃글쓴 시간 -->
								<c:set var="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="YYYY-MM-dd"/></c:set> 
							
						<c:choose>
							<c:when test="${empty reply.parent_no }">
								<div class="re_inbox">
									<div class="re_id" >${reply.id}</div>
									<c:choose>
										<c:when test="${ sysNow eq re_date}">
											<div class="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="hh:mm:ss"/></div> 
										</c:when>
										<c:otherwise>
											<div class="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="YYYY-MM-dd"/></div>
										</c:otherwise>
								   </c:choose>
									<div class="re_content">${reply.content}</div>
								   <div class="re_menuBox">
									 	 <c:if test="${reply.id eq sessionId || sessionId eq 'admin01'}">
											<div class="mod_re" data-re_no="${reply.re_no }">수정</div>
											<a href="/syl/ask_reply_del?re_no=${reply.re_no }&board_no=${param.board_no }" class="del_re">삭제</a>
										</c:if>
										<c:choose>
											<c:when test="${reply.id eq sessionId || sessionId eq 'admin01'}">
												<div class="re_re" data-re_re_no="${reply.re_no }">답글쓰기</div>
											</c:when>
											<c:when test="${!empty sessionId}">
												<div class="re_re" data-re_re_no="${reply.re_no }" style="margin-left:50px;">답글쓰기</div>
											</c:when>
										</c:choose>
								   </div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="re_inbox">
									<div class="re_id" style="padding-left:${reply.level *10}px;"><div class="reicon">↳</div>&nbsp${reply.id}</div>
									<c:choose>
										<c:when test="${ sysNow eq re_date}">
											<div class="re_date" ><fmt:formatDate value="${reply.reply_date}" pattern="hh:mm:ss"/></div> 
										</c:when>
										<c:otherwise>
											<div class="re_date"><fmt:formatDate value="${reply.reply_date}" pattern="YYYY-MM-dd"/></div>
										</c:otherwise>
								   </c:choose>
									<div class="re_content" style="padding-left:${(reply.level *10)+15}px;">${reply.content}</div>
									 <div class="re_menuBox">
								   <c:if test="${reply.id eq sessionId || sessionId eq 'admin01'}">
										<div class="mod_re" data-re_no="${reply.re_no }">수정</div>
										<a href="/syl/ask_reply_del?re_no=${reply.re_no }&board_no=${param.board_no }" class="del_re">삭제</a>
									</c:if>
									<c:choose>
											<c:when test="${reply.id eq sessionId || sessionId eq 'admin01'}">
												<div class="re_re" data-re_re_no="${reply.re_no }">답글쓰기</div>
											</c:when>
											<c:when test="${!empty sessionId}">
												<div class="re_re" data-re_re_no="${reply.re_no }" style="margin-left:50px;">답글쓰기</div>
											</c:when>
										</c:choose>
								   </div>
								</div>
							</c:otherwise>
						</c:choose>
						</c:forEach>
					</div>
					 <c:if test="${ not empty sessionId }">  
							<div class="re_writer">${sessionId }</div>
							<div class="re_box">
								<form name="replyFrm" class="frm" >
									<div class="re_title">댓글쓰기</div>
									<input type="text" name="content" class="re_content_input">
									<input type="button" value="등록" onclick="replyInsert()" class="reply_mod_btn">
								</form>
							</div>
							<div class="re_mod_box">
								<form name="replyMod" class="frm" >
									<div class="re_mod_title">댓글수정 중</div>
									<input type="text" name="content" class="re_content_input">
									<input type="button" value="취소" class="mod_cancel_btn">
									<input type="button" value="등록" onclick="replyModGo()" class="reply_regi_btn">
									<input type="hidden"  name="re_no" value="" id="re_no_hidden">
								</form>
							</div>
							<div class="re_re_box">
								<form name="replyRe" class="frm" >
									<div class="re_mod_title">답댓글 쓰기</div>
									<input type="text" name="content" class="re_content_input">
									<input type="button" value="취소" class="re_cancel_btn">
									<input type="button" value="등록" onclick="replyDelGO()" class="reply_re_btn">
									<input type="hidden"  name="re_no" value="" id="re_re_no_hidden">
								</form>
							</div>
				 	</c:if>  
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

						<form method="post" action="/syl/ask">
							<input type="submit" value="목록" class="list">
						</form>
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
					</div>
			</article>
		</section>
	</main>
	

</body>
</html>