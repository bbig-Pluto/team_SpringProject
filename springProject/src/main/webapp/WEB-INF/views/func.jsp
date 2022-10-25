<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기능</title>
<style>
        body{
            background-color: black;
        }
        .m_logo{
            margin-left: 440px;
            margin-top: 240px;
        }
        .m_logo2{
            margin-left: 435px;

        }
        #c1{
            /* border: 2px solid green; */
            color: aqua;
            /* width: 240px;
            height: 30px;         */
            text-align: center;
        }
        .headermypage {
	 	color: #223919;
		display: inline-block;
		text-decoration: none;
		position: relative;
	}
		        
	.headermypage:hover {
		color: #108269;
		font-weight: bold;
	}
    </style>
 <script>
 window.onload=()=>{

 	<%
	String isLogon = "guest";
	HttpSession logOnSession = request.getSession();
	
	if(logOnSession.isNew()) {
		logOnSession.setAttribute("isLogon", "guest"); // 세션이 없으면 만들어서 isLogon 에 guest 세팅
	} else { // 세션은 있는데 로그인을 안 하고 들어온 Case
		if(logOnSession.getAttribute("logOn.id") == null) {
			isLogon = "guest"; // 세션이 있다면 isLogon 에 세션에 있던 값을 세팅
			System.out.println("memoList if-else route ( guest )" );
		} else {
			isLogon = "member"; 			
			System.out.println("memoList if-else route ( member )");
		}
	}
%>
	 
	 let popupWidth = 470;
	 let popupHeight = 140;
	 // 브라우저 기준 중앙 정렬			
	 let popupX = (document.body.offsetWidth / 2) - (popupWidth / 2);
	 let popupY = (window.screen.height / 2) - (popupHeight / 2);
	 			
	 document.querySelector("#myPageLink").addEventListener("click", function(e) {
	 	<% if ((""+logOnSession.getAttribute("isLogon")).equals("member")) { %>
	 		window.open('${contextPath}/member/rd/inputpwdformypage', '비밀번호 재확인', 'width=' + popupHeight + ', height=' + popupHeight + ', left='+ popupX + ', top=' + popupY + ', scrollbars=yes');
	 	<% } else { %>
	 		alert("로그인이 필요한 서비스입니다.");				
	 	<% } %>
	 })

 }
 </script>
</head>
<body>
    <a href="/syl/diaryList"><img class="m_logo" src="/syl/resources/photo/logo3.png"></a>
    <a href="/syl/diaryList"><img class="m_logo2" src="/syl/resources/photo/3syl2.png"></a>
    <div id="c1">coming soon <br>기다려주셔서 감사합니다.</div>
</body>
</html>