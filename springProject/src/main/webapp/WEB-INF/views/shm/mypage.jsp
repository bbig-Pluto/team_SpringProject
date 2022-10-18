<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
	HttpSession logOn = request.getSession();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyPage</title>

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
</head>
<body>
	<div class="blankArea"></div>
	<div class="wrapper">
	
    마이페이지 입니다.<br>
    <a href="${contextPath}/member/deleteaccount.do">회원탈퇴</a><br>
    <a href="${contextPath}/member/logout.do">로그아웃</a><br>
    <a href="${contextPath}/sjs/calendarM.jsp">캘린더로 돌아가기</a><br>
    </div>
</body>
</html>