<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>아이디/비밀번호 찾기 성공</title>
</head>
<body>
	(찾아낸 id 출력) or (비밀번호 재설정 입력박스) or 일치하는 정보가 없습니다.
    <a href="${contextPath}/hunminjsp/idpwfinder.jsp">아이디/비밀번호 찾기</a><br>
    <a href="${contextPath}/hunminjsp/signin.jsp">로그인 페이지로</a>
</body>
</html>