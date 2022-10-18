<%@ page language="java" contentType="text/html; charset=UTF-8"
	import=" java.util.*, com.myspring.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자</title>

<script>
	window.onload = function() {

		let linkToModifications = document.querySelectorAll(".linkToModification");
		let linkToDeletes = document.querySelectorAll(".linkToDelete");
		
		
		
		for (let i = 0; i < linkToModifications.length; i++) {
			linkToModifications[i].addEventListener("click",function(e) {
				e.preventDefault();
				
				document.querySelectorAll("table tr")[i + 1].style.backgroundColor = "yellow";
				setTimeout(()=>{
					if (confirm("해당 회원의 정보를 수정 하시겠습니까?")) {
						location.href = e.target.getAttribute("href");
					} else {
						document.querySelectorAll("table tr")[i + 1].style.backgroundColor = "";
					}
				}, 10);
			})
		}

		for (let i = 0; i < linkToDeletes.length; i++) {
			linkToDeletes[i].addEventListener("click", function(e) {
				e.preventDefault();
				
				document.querySelectorAll("table tr")[i + 1].style.backgroundColor = "yellow";
				setTimeout(()=>{
					if (confirm("해당 회원의 계정을 삭제 하시겠습니까?")) {
						location.href = e.target.getAttribute("href");
					} else {
						document.querySelectorAll("table tr")[i + 1].style.backgroundColor = "";
					}
				}, 10);
			})
		}

	}
</script>

<style>
.cls1 {
	font-size: 40px;
	text-align: center;
}

.cls2 {
	font-size: 20px;
	text-align: center;
}

.linkTosignIn {
	text-align: center;
}
.linkToCalendar {
	text-align: center;
}
</style>

</head>

<body>
	<p class="cls1">회원정보</p>
	<table align="center" border="1">
		<tr align="center" bgcolor="lightgreen">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>닉네임</b></td>
			<td width="7%"><b>이메일</b></td>
			<td width="7%"><b>전화번호</b></td>
			<td width="7%"><b>회원번호</b></td>
			<td width="7%"><b>관리등급</b></td>
			<td width="7%"><b>가입일</b></td>
			<td width="7%"><b>수정</b></td>
			<td width="7%"><b>삭제</b></td>
		</tr>

		<c:choose>
			<c:when test="${ empty memList }">
				<tr>
					<td colspan="10" align="center"><b>등록된 회원이 없습니다.</b></td>
				</tr>
			</c:when>
			<c:when test="${ !(empty memList) }">
				<c:forEach var="mem" items="${ memList }">
					<tr align="center">
						<td>${ mem.id }</td>
						<td>${ mem.pwd }</td>
						<td>${ mem.nickName}</td>
						<td>${ mem.emailAdd }</td>
						<td>${ mem.telNum }</td>
						<td>${ mem.memberNum }</td>	
						<td>${ mem.memberClass }</td>
						<td>${ mem.joinDate }</td>
						<td><a class="linkToModification"
							href="${contextPath}/member/inquiremember.do?memberNum=${ mem.memberNum }">수정</a></td>
						<td><a class="linkToDelete"
							href="${contextPath}/member/delMember.do?memberNum=${ mem.memberNum }">삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<br>
	<br>
	<div class="linkTosignIn">
		<a href="${contextPath}/member/logout.do">로그아웃</a><br>
	</div>
	<div class="linkToCalendar">
		<a href="${contextPath}/sjs/calendarM.jsp">달력 페이지</a><br>
	</div>
</body>

</html>