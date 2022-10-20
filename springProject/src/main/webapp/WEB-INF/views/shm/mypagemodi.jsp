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
    <title>회원 정보 수정</title>

    <style>

        .wrapper {
            height: 50%;
            width: 50%;
            margin: 0 auto;
            text-align: center;
        }

        .blankArea {
            width: 100%;
            height: 150px;
        }

        .modCategory {
            text-align: right;
        }

        .forbidModi {
            background-color: rgb(196, 196, 196);
        }

    </style>
</head>

<body>
    <div class="blankArea"></div>
    <form action="${contextPath}/member/modifyInfoSelf.do" method="get">
        <table align="center">
            <caption>회원 정보 수정</caption>
            <tbody>
                <tr>
                    <td class="modCategory">아이디 : &nbsp;</td>
                    <td><input class="forbidModi" type="text" name="id" value="${ memberInfo.id }" readonly></td>
                    <td><a href="${contextPath}/member/rd/idpwfinder">아이디 찾기</a></td>
                </tr>
                <tr>
                    <td class="modCategory">비밀번호 : &nbsp;</td>
                    <td><input class="forbidModi" type="text" name="pwd" value="${ memberInfo.pwd }" readonly></td>
                    <td><a href="${contextPath}/member/rd/idpwfinder">비밀번호 재설정</a></td>
                </tr>
                <tr>
                    <td class="modCategory">전화번호 : &nbsp;</td>
                    <td><input type="text" name="telNum" value="${ memberInfo.telNum }"></td>
                </tr>
                <tr>
                    <td class="modCategory">닉네임 : &nbsp;</td>
                    <td><input type="text" name="nickName" value="${ memberInfo.nickName }"></td>
                </tr>
                <tr>
                    <td class="modCategory">이메일 : &nbsp;</td>
                    <td><input type="text" name="emailAdd" value="${ memberInfo.emailAdd }"></td>
                </tr>
                <tr>
                    <td class="modCategory">가입일 : &nbsp;</td>
                    <td><input class="forbidModi" type="text" name="joinDate" value="${ memberInfo.joinDate }" readonly>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="1"><input type="submit" value="완료">&nbsp;&nbsp;<input type="reset" value="다시입력"></td>
                </tr>
            </tbody>
        </table>
    </form>
    </div>
</body>

</html>