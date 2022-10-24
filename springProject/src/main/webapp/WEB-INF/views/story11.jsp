<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
    </style>
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
						<a href="/syl/bar/func" class="headersub">다이어리 기능 |</a> 
						<a href="/syl/bar/shot11"	class="headersub">다이어리 사용법 |</a> 
						<a href="/syl//notice" class="headersub">고객의 소리</a>
						<div class="lgnbtn">
							<a href="/syl/member/rd/mypage" class="headermypage">마이페이지</a>
							<a href="/syl/member/mypage" class="headerlogin">로그인</a>
							<a href="/syl/member/logout.do" class="headerloginout">로그아웃</a>
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