<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 조회 성공</title>
</head>
<style>
.wrapper {
	margin: 0 auto;
	height: 30%;
	width: 50%;
	text-align: center;
}

.blankArea {
	width: 100%;
	height: 150px;
}

.linkToLoginPage {
	text-align: center;
}
</style>
<body>
	<div class="blankArea"></div>
	<div class="wrapper">
		해당 정보와 일치하는 아이디는 <br> ${ foundId } <br> 입니다.<br><br>
		<div class="linkToLoginPage">
			<a href="${contextPath}/member/hunminjsp/signin.jsp">로그인 페이지로</a><br>
		</div>
	</div>
</body>
</html>