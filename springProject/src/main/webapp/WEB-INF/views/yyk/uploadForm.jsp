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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>" + "<input type='file' name='file"+cnt+"' />")
		cnt++;
	}
</script>
<h1>���� ���ε� �ϱ�</h1>
<form method="post" action="${contextPath }/upload" enctype="multipart/form-data">
<input type="button" value="���� �߰�" onclick="fn_addFile()"/><br>
<div id="d_file"></div>
<input type="submit" value="���ε�" />
</form>

</body>
</html>