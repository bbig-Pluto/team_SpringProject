<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
    </style>
</head>
<body>
    <a href="/syl/js/calendarM.jsp"><img class="m_logo" src="/syl/resources/photo/logo3.png"></a>
    <a href="/syl/js/calendarM.jsp"><img class="m_logo2" src="/syl/resources/photo/3syl2.png"></a>
    <div id="c1">단장중 - 3차에 돌아오겠습니다. <br>기다려주셔서 감사합니다.</div>
</body>
</html>