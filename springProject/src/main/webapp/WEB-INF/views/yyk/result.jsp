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
<h1>���ε尡 �Ϸ� �Ǿ����ϴ�</h1>

<div class="result-images">

<c:forEach var="imageFileName" items="${map.fileList }" >
	<img src="${contextPath }/download?imageFileName=${imageFileName }">
<br><br>
</c:forEach>

</div>
<a href='${contextPath }/form'>�ٽ� ���ε� �ϱ�</a>

</body>
</html>