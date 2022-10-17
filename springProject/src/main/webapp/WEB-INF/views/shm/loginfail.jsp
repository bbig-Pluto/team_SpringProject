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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 실패</title>
<style>
.wrapper {
	height: 50%;
	width: 50%;
	margin: 0 auto;
	text-align: center;
}

.blankArea {
	width: 100%;
	height: 150px;
}
</style>
</head>
<body>
	<div class="blankArea"></div>
	<div class="wrapper">
		일치하는 회원 정보가 없습니다.<br> <a
			href="${contextPath}/hunminjsp/signin.jsp">로그인 화면으로 돌아가기</a>
	</div>
</body>
</html>