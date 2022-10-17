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
<title>회원가입 실패</title>
</head>
<style>
.wrapper {
	margin: 0 auto;
	height: 30%;
	width: 30%;
}

.blankArea {
	width: 100%;
	height: 150px;
}
</style>
<body>
	<div class="blankArea"></div>
	<div class="wrapper">
		중복되는 회원 id가 존재합니다.<br>
		<input type="button" value="뒤로가기" onclick="history.back()" />
	</div>
</body>
</html>