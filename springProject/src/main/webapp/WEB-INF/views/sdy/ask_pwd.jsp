<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .out_box{
            border: 1px solid black;
            width: 700px;
            height: 400px;
            margin-top: 200px;
            margin-left: 370px;
            background-color: #b9ceac;
            
        }
        h2{
            margin-left: 320px;
        }
        .p_text{
            display: inline-block;
            font-size: 20px;
            margin-left: 130px;
           /*  margin-top: 70px; */
        }
        .out_box input[type="password"]{
            margin-left: 30px;
            display: inline-block;
            width: 300px;
            height: 30px;
        }
        .btn{
            margin-top: 100px;
            margin-left: 150px;
        }
        .btn input[type="button"]{
            margin-left: 50px;
            width: 150px;
            height: 50px;
            background-color: white;
        }
        .btn input[type="submit"]{
            width: 150px;
            height: 50px;
            background-color: #acacac;
            color: white;
        }
        .admin_text{
        	color:green;
/*         	color:#acacac; */
			margin-top:70px;
			margin-bottom:30px;
        	margin-left:250px;
        }


    </style>
    <script>
window.onload=()=>{
	sendList();
}

	 function sendList(){
		let list_btn = document.querySelector(".list");
		
		list_btn.addEventListener("click",()=>{
			frm.method="post";
			frm.action="/syl/ask";
			frm.submit();
			
		})


 }
</script>
</head>
<body>
<%
HttpSession userInfo = request.getSession();
String sessionId = "" + userInfo.getAttribute("logOn.id");
%>
<%if("admin01".equals(sessionId)){%>
	<form name="frm" method="post" action="/syl/detail">
<%}else{ %>
	<form name="frm" method="post" action="/syl/ask_check">
<%} %>
	  <div class="out_box">
	        <h2>비밀글</h2>
	          <div class="admin_text">관리자는 확인만 누르시면 됩니다.</div>
	          <div class="p_text"><strong>비밀번호</strong></div>
	          <input type="password" name="input_pwd" class="pwd">
	          <div class="btn">
	                <input type="button" value="목록" class="list" onclick="sendList()">
	                <input type="submit" value="확인">  
	                <input type="hidden" name="board_no" value="${param.board_no}" > 
	                <input type="hidden" name="command" value="pwCheck">  
	          </div>
	    </div>
</form>
</body>
</html>