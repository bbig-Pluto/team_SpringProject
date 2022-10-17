<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>아이디 찾기 / 비밀번호 재설정</title>
</head>
<style>
    .wrapper {
        margin: 0 auto;
        height: 30%;
        width: 30%;
    }

    input[type="submit"] {
        width: 292px;
        height: 30px;
    }

    .linkToLoginPage {
        text-align: center;
    }

    .inputContent {
        width: 105px;
    }

    .blankArea {
        width: 100%;
        height: 150px;
    }
</style>

<script>
	window.onload = functino() {
		
		let firstBox document.querySelector("input[name='pwdRewriteId']");
		
		document.querySelector(".pwdRewriteSubmit").addEventListener("click", function() {
			if () {
				
			}
		})
	}
</script>

<body>
    <div class="blankArea"></div>
    <div class="wrapper">
        <br><br>
        <form action="${contextPath}/member/idFind.do" method="post">
            <table align="center" border="1">
                <caption>아이디 찾기</caption>
                <tr>
                    <td class="inputContent" style="text-align: right;">email 주소 :&nbsp;</td>
                    <td><input type="text" name="idFindEmailAdd"></td>


                </tr>
                <tr>
                    <td class="inputContent" style="text-align: right;">전화번호 :&nbsp;</td>
                    <td><input type="text" name="idFindTelNum"></td>
                </tr>
                <tr>
                    <td colspan="2"><input class="idFindSubmit" type="submit" value="아이디 찾기"></td>
                </tr>
            </table>
        </form>
        <br><br>

        <form action="${contextPath}/member/pwdRewriteCheck.do" method="post">
            <table align="center" border="1">
                <caption>비밀번호 재설정</caption>
                <tbody>
                    <tr>
                        <td class="inputContent" style="text-align: right;">계정 아이디 :&nbsp;</td>
                        <td><input type="text" name="pwdRewriteId"></td>
                    </tr>
                    <tr>
                        <td class="inputContent" style="text-align: right;">전화번호 :&nbsp;</td>
                        <td><input type="text" name="pwdRewriteTelNum"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="pwdRewriteSubmit" type="submit" value="비밀번호 재설정"></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <br><br>
        <div class="linkToLoginPage">
            <a href="${contextPath}/hunminjsp/signin.jsp">로그인 페이지로</a><br>
        </div>
    </div>
</body>

</html>