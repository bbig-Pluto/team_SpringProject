<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.*"%>
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
	border-bottom: 1px solid #8a8989b4;
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
    padding: 5px;
}
table .no {
	width: 40px;
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
table .category {
	width: 70px;
	text-align: center;
}
table .hit {
	width: 70px;
	text-align: center;
}
table .check {
	width: 30px;
	text-align: center;
}
/*  table .hit{
      width: 60px;
      text-align:center;
  } */
.btn input[type="submit"] {
	width:80px;
	height:30px;
	/* background-color:#acacacb0; */
	/* background-color:black; */
	background-color:#acacac;
	color:white;
/* 	margin-top: 15px; */
	margin-left: 1000px;
	margin-top:20px;
}

.ser {
	margin-top: 50px;
	margin-left: 370px;
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
.show .u, .n, .c, .w,.h,.chk{
	text-align: center;
}
.show .t{
	text-align: left;
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
.reicon{
display:inline-block;
vertical-align:top; 
font-size:10px;
}
.re_count{
	display:inline-block;
	margin-left:10px;
	width:30px;
	border-radius:5px;
	border:1px solid #8a8989b4;
	font-size:15px;
	padding-top:2px;
	color:gray;
}
.checkDel_btn{
	margin-left:130px;
	margin-top:10px;
}

</style>
 <script>
 //전체 선택
 function selectAll(selectAll) {
	  const checkboxes 
	       = document.getElementsByName('check');
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;

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
 
/*  function PageNumber(){
	 let PageNumber =document.querySelector("#PageNumber");
	 PageNumber.addEventListener("click",()=>{
	 	document.getElementById("PageNumber").href = "/syl/ask?pageNum=${map.pageNum}";
	 })
 } */
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
		System.out.println("글쓰기 아이디: "+sessionId);
		
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
	<c:set var="lastPage" value="<%= lastPage %>" />

		<table>
			<tr>
			 <%if(sessionId.equals("admin01")){ %>
				<th class="check"><input type="checkbox" name="checkAll" onclick="selectAll(this)"></th>
			<%} %> 
				<th class="no">No.</th>
				<th class="category">카테고리</th>
				<th class="title" colspan="2">제목</th>
				<th class="reply_count"></th>
				<th class="nic">작성자</th>
				<th class="date">작성일</th>
				<th class="hit">조회수</th>
			</tr>
	<form name="frm" action="/syl/AdelCheck" method="post">
		<c:forEach var="list" items="${ map.list}">
			<tr class="show">
		 <%if(sessionId.equals("admin01")){ %> 
				<td class="chk"><input type="checkbox" name="check"value="${list.board_no}" onclick="checkSelectAll()"></td>
	 			<%} %> 
				<td class="n">${list.board_no}</td>
				<td class="c">[${list.ask_classify}]</td>
				 <td class="t" colspan="2">
				<c:choose>
					<c:when test="${not empty list.parent_no }">
						<c:choose>
							<c:when test="${'secret' eq list.ask_secret }">
									<div class="reicon" style="padding-left:${list.level*10}px;"><i class="fa-solid fa-turn-down-right"></i></div><a href="/syl/ask_pwd?board_no=${list.board_no }">&nbsp${list.title }&nbsp<img src="https://cdn-icons-png.flaticon.com/512/152/152462.png" style="width:13px; height:13px;"></a>
							</c:when>
							<c:otherwise>
									<div class="reicon" style="padding-left:${list.level*10}px;">↳</div><a href="/syl/detail?board_no=${list.board_no}">&nbsp${list.title }</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${'secret' eq list.ask_secret }">
									<a href="/syl/ask_pwd?board_no=${list.board_no }">${list.title }&nbsp<img src="https://cdn-icons-png.flaticon.com/512/152/152462.png" style="width:13px; height:13px;"></a>
							</c:when>
							<c:otherwise>
									<a href="/syl/detail?board_no=${list.board_no}">${list.title }</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>		
				</td> 
				<td class="reply_count">
					<c:if test="${list.reply_count != 0 }">
						<div class="re_count">${list.reply_count}</div>
					</c:if>
				</td>
				<td class="u">${list.id} </td>
				
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
				 <td class="h">${list.hit}</td>
	
			</tr>
		</c:forEach>
		
		</table>
	 <%if(sessionId.equals("admin01")){ %> 
		<input type="submit" value="삭제" class="checkDel_btn">
	<%}%>   
	</form>
 	   <%if(!sessionId.equals("null")){ %>  
		<form method="post" action="/syl/write">
			<div class="btn">
				<input type="submit" value="글쓰기">
			</div>
		</form>
	 	<%}%>   
		<form method="post" action="/syl/ask">
			<div class="ser">
			<select name="q_head" onchange="classifyValue(this)">
					<option value="중분류" selected>중분류</option>
					<option value="문의">문의</option>
					<option value="재문의">재문의</option>
					<option value="제안">제안</option>
				</select>  
		
				<select name="ser_name" onchange="selectValue(this)">
					<option value="소분류" selected>소분류</option>
					<option value="글제목" name="title">글제목</option>
					<option value="작성자" name="nick_name">작성자</option>
				</select> 
				<input type="text" name="search" >
				 <input type="submit" value="검색">
			</div>
		</form> 
		<c:if test="<%=pageNum == 1%>">
		<div style="display:inline-block; margin-left:550px; color:gray;"> << &nbsp;</div>
	</c:if>
	<c:if test="<%=pageNum != 1%>">
		<a href="/syl/ask?pageNum=1&ser_name=${ map.ser_name}&q_head=${map.q_head }&search=${map.search }" style="color:red;font-weight:bold; margin-left:550px;  color: black; text-decoration: none;"> << </a>&nbsp;
	</c:if>

	<c:forEach var="i" begin="<%=firstNo %>" end="<%=lastNo %>">
		<c:if test="${ map.pageNum eq i }">
			<a href="/syl/ask?pageNum=${i }&ser_name=${ map.ser_name}&q_head=${map.q_head }&search=${map.search }" style="color:red;font-weight:bold;  color:black; text-decoration: none;" id="PageNumber">${i }</a>&nbsp;
		</c:if>
		<c:if test="${ not (map.pageNum eq i) }">
			<a href="/syl/ask?pageNum=${i }&ser_name=${map.ser_name}&q_head=${map.q_head }&search=${map.search }" style="color:gray; text-decoration: none;" id="PageNumber">${i }</a>&nbsp;
		</c:if>
	</c:forEach>

	<c:if test="<%=pageNum == lastPage%>">
		<div style=" display:inline-block; color:gray; "> >> </div>
	</c:if>
	<c:if test="<%=pageNum != lastPage%>">
		<a href="/syl/ask?pageNum=<%=lastPage %>&ser_name=${ map.ser_name}&q_head=${map.q_head }&search=${map.search }" style="color:red;font-weight:bold; color: black; text-decoration: none; " id="result" > >> </a>&nbsp;
	</c:if>
				</div>
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
<%-- 	<div>
		<c:forEach begin="1" end="${Num}" var="num">
		    <span>
		     <a href="/views/ask_show?num=${pageNum}">${pageNum}</a>
		  </span>
		 </c:forEach>
	</div> --%>
	
	
		<!-- <footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="./logo2.png">
				 <img class="left_logo2" src="./3syl2.png">
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