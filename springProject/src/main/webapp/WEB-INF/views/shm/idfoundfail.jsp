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
<title>아이디 찾기 실패</title>
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
		입력한 정보와 일치하는 값을 가지는 아이디가 없습니다.<br><br>
		<div class="linkToLoginPage">
			<a href="${contextPath}/hunminjsp/idpwfinder.jsp">아이디 찾기 / 비밀번호 재설정 페이지로</a><br>
		</div>
	</div>
</body>
</html>