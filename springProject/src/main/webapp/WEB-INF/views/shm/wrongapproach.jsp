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
    <title>잘못된 접근페이지</title>
    <style>
        .cantAcs{
            width: 800px;
            height: 800px;
            margin-left: 200px;
            border: 40px solid red;
            border-radius: 50%;
            text-align: center;
        }
        .line{
            width: 50px;
            height: 538px;
            background-color: red;
            transform: skew(50deg);
            position: absolute;
            top: 160px;
            left: 640px;
        }
        .acs{
            width: 600px;
            height: 300px;
            margin-top: 300px;
            font-size: 50px;
            position: absolute;
            left:330px;

        }
        .re{
            text-decoration : none;
        }

    </style>
</head>
<body>
    <div class="cantAcs">
        <div class="line">
        </div>
        <div class="acs">
            잘못된 접근입니다.<br>
            <a href="${contextPath}/calendarM" class="re">=> 캘린더로 되돌아가기</a>
        </div>
    </div>
</body>
</html>