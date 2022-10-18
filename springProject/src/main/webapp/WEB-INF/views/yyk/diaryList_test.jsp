<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
			<tr>
				<td>제목</td>
				<td>내용</td>
			</tr>

			<c:forEach var="list" items="${ list }">
				<tr align="center">
					<td>${ list.d_title }</td>
					<td>${ list.d_contents }</td>
				</tr>
			</c:forEach>
		</table>

</body>
</html>