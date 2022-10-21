<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 비밀번호 입력</title>
</head>
<body>
	<form action="${ contextPath }/member/mypage" method="post">
		<input type="password" name="myPageEnterPwd"> &nbsp;
		<input type="submit" value="제출">
	</form>
</body>
</html>