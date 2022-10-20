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

<script>
    window.onload = function() {

        let delAccountSelfBtn = document.querySelector("#delAccountSelfBtn");
        
            delAccountSelfBtn.addEventListener("click", function(e) {
				e.preventDefault();
				
				setTimeout(()=>{
					if (confirm("정말로 회원을 탈퇴 하시겠습니까?\n기존에 작성하셨던 모든 데이터들도 지워집니다.")) {
						location.href = e.target.getAttribute("href");
					} else {

					}
				}, 10);
			})
		

    }

</script>

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
    <a id="delAccountSelfBtn" href="${contextPath}/member/deleteAccount.do">회원탈퇴</a><br>
    <a id="logoutBtn" href="${contextPath}/member/logout.do">로그아웃</a><br>
    <a id="bactToCalendar" href="${contextPath}/sjs/calendarM.jsp">캘린더로 돌아가기</a><br>
    <a id="modiInfoSelf" href="${contextPath}/member/getMemberInfo.do">회원정보 수정</a>
    </div>
</body>
</html>