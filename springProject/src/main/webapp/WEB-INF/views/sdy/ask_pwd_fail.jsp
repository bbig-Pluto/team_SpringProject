<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
<style>
	.parent{
		margin-top:300px;
		margin-left:500px;
		border:1px solid black;
		width:400px;
		height:200px;
		background-color:lightgray;
	}
	.top{
		width:400px;
		height:30px;
		border-bottom:1px solid black;
		background-color:#b9ceac;
	}
	.close input{
		margin-top:5px;
		margin-left:375px;
		height:20px; 
		width:20px; 
		font-size: 10px; 
		padding: 0; 
		background-color:white;
	}
	.text{
		margin-top:70px;
		margin-left:100px;
	}
</style> 


</head>
<body>
<%
 String no =request.getParameter("board_no");
%>


	 <div class="parent">
		<div class="top">
			  <form method="post" action="/syl/ask_pwd?board_no=<%=no%>" >
			  <div class="close">
	            <input type="submit" value="X">
	   		 </div>     
			  </form>
		</div>
		<div class="text"><strong>비밀번호가 일치하지않습니다.</strong></div>	 
	</div> 
</body>
</html>