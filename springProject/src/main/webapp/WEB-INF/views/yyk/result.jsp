<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>업로드가 완료 되었습니다</h1>

<div class="result-images">

<c:forEach var="imageFileName" items="${map.fileList }" >
	<img src="${contextPath }/download?imageFileName=${imageFileName }">
<br><br>
</c:forEach>

</div>
<a href='${contextPath }/form'>다시 업로드 하기</a>

</body>
</html>