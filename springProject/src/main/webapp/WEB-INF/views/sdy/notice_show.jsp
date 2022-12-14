<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*" import= "java.util.Date"  import="java.text.SimpleDateFormat"%>
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
/*Q&A*/
h2 {
	margin-top:100px;
	margin-left: 580px;
}
/*메뉴:공지사항,자주묻는 질문,문의하기 의 부모div*/
.menu {
	display: flex;
	margin-top: 40px;
	margin-bottom: 20px;
}

.menu .m1 {
	margin-left: 430px;
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

table {
	width:80%;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin-left: 120px;
	margin-top: 40px;
	border-top: 1px solid  #8a8989b4;
    border-collapse: collapse;
}

table th {
	/* background-color: #b9ceaca9; */
	background-color: #b9ceac;
	text-align: center;
	border-bottom: 1px solid #8a8989b4;
    padding: 5px;
}

table td {
	text-align: center;
	border-bottom: 1px solid #8a8989b4;
    padding: 7px;
}

table .no {
	width: 60px;
}

table .title {
	width: 500px;
	text-align: center;
}

table .nic {
	width: 70px;
	text-align: center;
}

table .date {
	width: 100px;
	text-align: center;
}
table .hit {
	width: 100px;
	text-align: center;
}
table .check {
	width: 30px;
	text-align: center;
}

.btn input[type="submit"] {
	width:80px;
	height:30px;
	background-color:#acacac;
	color:white;
	margin-top: 15px;
	margin-left: 1000px;
}

.ser {
	margin-top: 50px;
	margin-left: 420px;
	margin-bottom:50px; 
}

.ser select {
	width: 70px;
	height: 25px;
}

.ser input[type="text"] {
	width: 300px;
	height: 25px;
}

.ser input[type="submit"] {
	height: 25px;
}
.show td a {
	color: black;
	text-decoration: none;
}
.show .u, .n, .w, .h, .chk{
	text-align: center;
}
.show .t{
	text-align: left;
}
.checkDel_btn{
	margin-left:130px;
	margin-top:10px;
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
              <a href="/syl/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
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
	<h2>공지사항</h2>
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
	<% Date date = new Date(); SimpleDateFormat sd = new SimpleDateFormat("yyyy년-MM월-dd일(hh시:mm분:ss초) E요일"); 
		%>
		<jsp:useBean id="noticeDate" class="java.util.Date"/>
		<%
		HttpSession userInfo = request.getSession();
		String sessionId = "" + userInfo.getAttribute("logOn.id");

		Map map = (Map)request.getAttribute("map");

		int pageNum = (int)map.get("pageNum");
		int countPerPage = (int)map.get("countPerPage"); // 5
		int count = (int)map.get("count");	// 22
		int lastPage = (int)Math.ceil(((double)count / countPerPage));	// 올림;마지막 페이지 번호
		int section = 4;
		// lastPage: 22
		// 현재 페이지: 12
		// 4개만 보여주고 싶다면(9~12)
		int sec_position = (int)Math.ceil(((double)pageNum / section));
		int firstNo = ((sec_position-1) * section) + 1;
		// ((int)(14 / 10)) * 10
//	 	int firstNo = 12 - (12 % 4);
//	 	int firstNo = pageNum - (pageNum % section) + 1;
//	 	if(firstNo < 1){ firstNo = 1; }
		int lastNo = firstNo + section - 1;
		if(lastNo > lastPage){ lastNo = lastPage; }
	%>
	<form action="/syl/NdelCheck" method="post">
	<table>
		<tr>
	 <%if(sessionId.equals("admin01")){ %> 
			<th class="check"><input type="checkbox"  name="checkAll" onclick="selectAll(this)"></th>
	  	<%} %> 
			<th class="no">No.</th>
			<th class="title">제목</th>
			<th class="nic">작성자</th>
			<th class="date">작성일</th>
			<th class="hit">조회수</th>
		</tr>
	<c:set var="lastPage" value="<%= lastPage %>" />
		<c:forEach var="list" items="${ map.list}">
		<tr class="show">
			 <%if(sessionId.equals("admin01")){ %> 
				<td class="chk"><input type="checkbox" name="check" value="${list.board_no }" onclick="checkSelectAll()"></td>
		 	<%} %> 
		<c:choose>
			<c:when test="${list.n_set eq '공지'}">
				<td class="n"><strong>[${list.n_set }]</strong></td>
				<td class="t"><strong><a href="/syl/Ndetail?board_no=${list.board_no }&&title=${list.title }&id=${list.id }&content=${list.content }">${list.title }</a></strong></td>
			</c:when>
			<c:otherwise>
			<td class="n">${list.board_no }</td>
			<td class="t"><a href="/syl/Ndetail?board_no=${list.board_no }&title=${list.title }&id=${list.id }&content=${list.content }">${list.title }</a></td>
			</c:otherwise>	
		</c:choose>
		
			<td class="u">${list.id }</td>
			
				<!-- 시스템에서 현제시간 -->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="sysNow"><fmt:formatDate value="${now}" pattern="YYYY-MM-dd" /></c:set> 
					<!-- 글쓴 시간 -->
					<c:set var="write_date"><fmt:formatDate value="${list.write_date}" pattern="YYYY-MM-dd"/></c:set> 
				
				<c:choose>
					<c:when test="${ sysNow eq write_date}">
						<td class="w"><fmt:formatDate value="${list.write_date}" pattern="hh:mm:ss"/></td> 
					</c:when>
					<c:otherwise>
						<td class="w"><fmt:formatDate value="${list.write_date}" pattern="YYYY-MM-dd"/></td> 
					</c:otherwise>
				</c:choose>
			<td class="w">${list.hit}</td>
		</tr>
		</c:forEach>
	</table>
 	<%if(sessionId.equals("admin01")){ %> 
		<input type="submit" value="삭제" class="checkDel_btn">
	<%} %> 
</form>
	<%if(sessionId.equals("admin01")){ %> 
	<form method="post" action="/syl/notice_write">
		<div class="btn">
			<input type="submit" value="글쓰기">
		</div>
	</form>
	<%} %> 
	<form method="post" action="/syl/notice">
	<div class="ser">
		 <select name="ser_name">
			<option value="분류" selected>분류</option>
			<option value="글제목">글제목</option>
		</select> 
		<input type="text" name="search"> 
		<input type="submit" value="검색">
	</div>
	</form>
			<c:if test="<%=pageNum == 1%>">
		<div style="display:inline-block; margin-left:550px;  color:gray;"> << &nbsp;</div>
	</c:if>
	<c:if test="<%=pageNum != 1%>">
		<a href="/syl/notice?pageNum=1&countPerPage=10&ser_name=${map.ser_name}&search=${map.search}" style="color:red;font-weight:bold; margin-left:550px; color: black; text-decoration: none;"> << </a>&nbsp;
	</c:if>

	<c:forEach var="i" begin="<%=firstNo %>" end="<%=lastNo %>">
		<c:if test="${ map.pageNum eq i }">
			<a href="/syl/notice?pageNum=${i }&countPerPage=10&ser_name=${map.ser_name}&search=${map.search}" style="color:red;font-weight:bold; color:black; text-decoration: none;">${i }</a>&nbsp;
		</c:if>
		<c:if test="${ not (map.pageNum eq i) }">
			<a href="/syl/notice?pageNum=${i }&countPerPage=10&ser_name=${map.ser_name}&search=${map.search}" style="margin-top:50px; color:gray; text-decoration: none;">${i }</a>&nbsp;
		</c:if>
	</c:forEach>

	<c:if test="<%=pageNum == lastPage%>">
		<div style="margin-top:50px; display:inline-block; color:gray; "> >> </div>
	</c:if>
	<c:if test="<%=pageNum != lastPage%>">
		<a href="/syl/notice?pageNum=<%=lastPage %>&countPerPage=10&ser_name=${map.ser_name}&search=${map.search}" style="color:red;font-weight:bold; color: black; text-decoration: none;"> >> </a>&nbsp;
	</c:if>
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