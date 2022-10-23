<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"
	import="javax.servlet.http.HttpSession"
    pageEncoding="UTF-8"%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id")%>' />
<c:set var="sessionMemberNum" value='<%=(String)session.getAttribute("logOn.memberNum")%>' />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	    window.onload = function() {
			
	    	<%
	    		HttpSession logOnSession = request.getSession();
	    		if( logOnSession.isNew() ){ // 첫 접속이라서 세션이 없다면 만들어주고 비회원 등급 부여
	    			logOnSession.setAttribute("isLogon", "guest");
	    		}
	    		
	    		// 비회원의 주소창 직접적 접근 검열
	    		if( (!(""+logOnSession.getAttribute("isLogon")).equals("guest")) 
	    				&& !(logOnSession.getAttribute("isLogon") == null) ) {
	    		
	    	%>
    			
	    	
	        let delAccountSelfBtn = document.querySelector("#delAccountSelfBtn");
	        
	            delAccountSelfBtn.addEventListener("click", function(e) {
					e.preventDefault();
					
					setTimeout(()=>{
						if (confirm("정말로 회원을 탈퇴 하시겠습니까?\n지금껏 작성하셨던 모든 데이터들(일기장 등)도 지워집니다.")) {
							location.href = e.target.getAttribute("href");
						} else {
	
						}
					}, 10);
				})
			
// 			회원정보 수정을 위해 DB 에서 회원정보 get
			$(function() {
	            $("#modiInfoSelf").click(function(e) {
//                     e.preventDefault(); // ajax 적용하려면 a href 기능 죽여야함
					console.log("modiInfoSelf clicked")
			    	let memberNum = { memberNum : ${ sessionMemberNum } }
			        $.ajax({
			            type: "post",
			            url: "${contextPath}/member/getMemberInfo.do",
			            contentType: "application/json",
			            data: JSON.stringify(memberNum),
			            success: function(data, textStatus){
			                eval(data);
	            		}
	        		})
	            })
			})
	    }
	</script>

	<style>
        body {
            margin: 0;
            padding: 0;
        }

        .backGrounImg {
            background-image: url(../resources/shm/bgimg_resizing.png);
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            background-repeat: no-repeat;
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.302);
            background-blend-mode: darken;
        }

        .linksWrapper {
            background-color: rgba(255, 255, 255, 0.789);
            width: 100%;
            height: 500px;
            border-radius: 0 0 30px 30px;
        }

        .contentsArea {
            width: 100%;
            height: 100%;
        }

        .topColorSpacer {
            width: 100%;
            height: 5px;
            background-color: rgb(25, 136, 179);
        }

    </style>
    
</head>
<body>
	<div class="backGrounImg">
        <div class="topColorSpacer"></div>
        <div class="linksWrapper">
            <table frame=void class="contentsArea" border="1" style="border-collapse : collapse; border-color: grey;">
               <tbody>
                    <tr>
                        <td>logo<br> <a id="bactToCalendar" href="${contextPath}/sjs/calendarM.jsp">캘린더로 돌아가기</a></td>
                        <td colspan="2" style="text-align: center;">${ sessionId } 님의 MyPage 입니다.</td>
                        <td><a id="logoutBtn" href="${contextPath}/member/logout.do">로그아웃</a></td>
                    </tr>
                    <tr>
                        <td>콘텐츠 비우기 영역</td>
                        <td colspan="2"><a id="modiInfoSelf" href="${contextPath}/member/getMemberInfo.do">회원정보 수정</a></td>
                        <td>test</a></td>
                    </tr>
                    <tr>
                        <td rowspan="2">비울 콘텐츠 선택, 실행 영역</td>
                        <td id="inputModifyingInfoSelf" colspan="2" rowspan="2">회원정보 수정 실행 영역</td>
                        <td>test</td>
                    </tr>
                    <tr>
                        <td><a id="delAccountSelfBtn" href="${contextPath}/member/deleteAccount.do">회원탈퇴</td>
                    </tr>
               </tbody> 
            </table>
        </div>
    </div>
</body>
	<%
	} else {
		// 잘못된 접근 페이지로 쫓아냄
		response.sendRedirect("/syl/member/rd/wrongapproach");
	}
	%>
</html>
