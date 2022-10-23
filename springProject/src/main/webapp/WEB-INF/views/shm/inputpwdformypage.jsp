<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%> -->

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>마이페이지 비밀번호 입력</title>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		window.onload = function () {

			$(function () {
				$("#pwdSubmitEnterIntoMypage").click(function (e) {
					console.log("pwdSubmitEnterIntoMypage clicked")
					let pwd = { pwd: document.querySelector("#inputtedPwd").value }
					$.ajax ({
						type: "post",
						url: "${contextPath}/member/mypage",
						contentType: "application/json",
						data: JSON.stringify(pwd),
						success: function (data, textStatus) {
							eval(data);
						}
					})
				})
			})

		}
	</script>

	<style>

	</style>
</head>

<body>
	<p>본인 확인을 위한 계정 비밀번호를 입력해주세요</p>
		비밀번호 : <input id="inputtedPwd" type="password"> &nbsp;
		<button id="pwdSubmitEnterIntoMypage" type="button">제출</button>
</body>

</html>