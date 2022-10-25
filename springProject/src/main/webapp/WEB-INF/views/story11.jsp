<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토리보드 다이어리 구성</title>
<style type="text/css">
/* 헤더 */
header {
            margin-bottom: 20px;
        }

        div.wrapper {
            width: 1240px;

        }

        h1 {
            width: 200px;
            margin: 0 auto;
            display: inline-block;

        }

        .headerLogo {

            width: 200px;
            float: left;
        }

        nav {
            width: 580px;
            display: inline-block;
            vertical-align: top;
            margin-top: 3%;
            margin-left: 12%;
            font-size: 16px;

        }

        .headersub {
            color: #223919;
            text-decoration: none;
            position: relative;
        }

        .headersub:before {
            content: '';
            border-radius: 100%;
            background: #214192;
            position: absolute;
            top: -10px;
            left: -20px;
            transition: all 0.2s;
        }

        .headersub:hover::before {
            width: 5px;
            height: 5px;
            left: 50%;
            opacity: 0.8;
        }

        .headersub:hover {
            color: #42568a;
        }
        
        .lgnbtn {
            font-size: 12px;
            width: 60px;
            position: absolute;
            top: 14px;
            left: 1184px;
        }

        .headerlogin {
            color: #223919;
            display: inline-block;
            text-decoration: none;
            position: relative;

        }

        .headerloginout {
            color: #223919;
            display: inline-block;
            text-decoration: none;
            position: relative;
        }

        .headerlogin:hover {
            color: #108269;
            font-weight: bold;
        }

        .headerloginout:hover {
            color: #108269;
            font-weight: bold;
        }



        /* 중간 내용 부분 */

        .pic1{
            width: 1200px;
        }

        .pic2{
            width: 1200px;
        }

        .pic3{
            width: 1200px;

        }
        .pic4{
            width: 1200px;

        }
        .pic5{
            width: 1200px;

        }
        .pic6{
            width: 1200px;

        }




 /* footer 부분  */
 footer{
        }
        .footer_all{
            width: 1240px;
            height:200px;
            position: absolute;
            top: 15300px;
            background-color: rgba(0, 0, 0, 0.13);
            border-radius: 20px;

        }
        .left_logo{
            padding-top: 60px;
            margin-left: 100px;
            width: 220px;
            height: 120px;

        }
        .left_logo1{
            margin-left: 15px;    
            width: 200px;
            height: 50px;
            transform: skew(-32deg)
        }
        .left_logo2{
            width: 200px;
            height: 30px;
        }
        .middle_copyRight{
            margin-left: 150px;
            width: 450px;
            height: 80px;
            font-size: 12px;
            position: absolute;
            left: 300px;  top: 140px;

        }
        .mc1{
            margin-left: 80px;         
            display: inline-block;
        }
        .mc2{
            margin-left: 40px;         
            display: inline-block;

        }
        .mc3{
            margin-top: 10px;         


        }

        .right_contact{
            width: 280px;
            position: absolute;
            top: 40px; left: 950px;


        }
        .rc{
            width: 140px;
            font-size: 26px;
            font-weight: bold;

        }

        .rc2{
            width: 480px;
            font-style: italic;
            position: absolute;
            left: 400px; top: 20px;
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
<header>
			<div class="wrapper">
				<h1>
<!-- 					<img class="headerLogo" src="./3syl.png"><a href=""></a> -->
					<a href=/syl/calendarM.jsp"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
				</h1>
				<nav>
					<a href="/syl/bar/intro" class="headersub">다이어리 소개 |</a> 
	               <a href="/syl/bar/story11" class="headersub">다이어리 구성 |</a> 
	               <a href="/syl/bar/func"  class="headersub">다이어리 기능 |</a> 
	               <a href="/syl/bar/shot11"  class="headersub">다이어리 사용법 |</a> 
	               <a href="/syl//notice" class="headersub">고객의 소리</a>
						<div class="lgnbtn">
							   <a href="#" id="myPageLink" class="headermypage">마이페이지</a>
		                  <c:choose>
			                  <c:when test="${empty sessionId }">
				                  <a href="/syl/member/login " class="headerlogin">로그인</a>
			                  </c:when>
			                  <c:otherwise>
				                  <a href="/syl/member/logout.do" class="headerloginout">로그아웃</a>
			                  </c:otherwise>
		                  </c:choose>
					</div>
				</nav>
			</div>
		</header>


    <main>
        <div>
            <div><img class="pic1" src="/syl/resources/photo/stb1.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb2.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb3.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb4.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb5.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb6.png"><a href=""></a></div>
            <div><img class="pic1" src="/syl/resources/photo/stb7.png"><a href=""></a></div>
            <div><img class="pic2" src="/syl/resources/photo/stb2_1.png"><a href=""></a></div>
                                        
                                        
            <div><img class="pic3" src="/syl/resources/photo/stb3_1.png"><a href=""></a></div>
            <div><img class="pic3" src="/syl/resources/photo/stb3_2.png"><a href=""></a></div>
            <div><img class="pic3" src="/syl/resources/photo/stb3_3.png"><a href=""></a></div>
                                        
            <div><img class="pic4" src="/syl/resources/photo/stb4_1.jpg"><a href=""></a></div>
            <div><img class="pic4" src="/syl/resources/photo/stb4_2.jpg"><a href=""></a></div>
            <div><img class="pic4" src="/syl/resources/photo/stb4_3.jpg"><a href=""></a></div>
                                        
            <div><img class="pic5" src="/syl/resources/photo/stb5_1.jpg"><a href=""></a></div>
                                        
            <div><img class="pic6" src="/syl/resources/photo/stb6_1.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_2.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_3.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_4.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_5.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_6.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_7.png"><a href=""></a></div>
            <div><img class="pic6" src="/syl/resources/photo/stb6_8.png"><a href=""></a></div>


        </div>
    </main>

    <footer>
        <div  class="footer_all">

            <div class="left_logo">
                <img class="left_logo1" src="/syl/resources/photo/logo2.png">
                <img class="left_logo2" src="/syl/resources/photo/3syl2.png">
            </div>

            <div  class="rc2">
                We ONLY contact to email during office(9-6 KTS) hours for assistance, as emails regarding SYL service team.<br>
                Do NOT send multiple emails as it delays our ability to respond in a timely manner.

            </div>
            <div class="right_contact">
                    <div class="rc">Contact Us</div><br>
                    SYL <br>
                    Our Company Information<br>
                    E-mail: syL2022@email.com<br>
            </div>

            <div class="middle_copyRight">
                <div class="mc1">이용약관</div>
                    <div class="mc2">개인정보 처리방침</div>
                    <div class="mc3">2022 SYL Inc. All rights reserved. This site for our customers.</div>
                   
                </div>
            </div>

        </div>
        
    </footer>
</body>
</html>