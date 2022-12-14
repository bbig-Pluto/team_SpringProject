<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<!-- 	<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png"> -->
	
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap');
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
                		/* ///////////////////////////////////////책안에 내용 집어넣기/////////////////////////////////////////// */
		/* 전체 틀 잡기 */
		main {
			/* border: 3px solid black; */
			
		}
		
		.area_wrapper {
			width: 1240px;
			height: 920px;
			display: flex;
			position: absolute;
		}
		
		/* 페이지 들어갈 공간 */
		.calendarWhole {
			width: 1005px;
			height: 770px;
			margin-left: 110px;
			margin-top: 65px;
			border: 2px solid rgb(115, 115, 115);
			border-top: 0px;
			border-bottom: 0px;
			position: absolute;
			z-index: 2;
			/* 배경색상1 */
		/* 	background-color: #c2e3e5; */
		}
		
		/* 위쪽 반원 */
		.calendarLT {
			width: 505px;
			height: 150px;
			position: absolute;
			left: 110px;
			top: 0px;
			border: 3px solid black;
			border-radius: 50% 50% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			/* 배경색상2 */
		}
		
		.calendarRT {
			width: 504px;
			height: 150px;
			position: absolute;
			left: 615px;
			top: 0px;
			border: 3px solid black;
			border-radius: 50% 50% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			/* 배경색상3 */
			background-color: #c2e3e5;
		}
		
		/* 하좌측 반원 위 공백 */
		.calendarLB0 {
			width: 505px;
			height: 145px;
			position: absolute;
			left: 110px;
			top: 750px;
			border: 3px solid white;
			border-radius: 50% 50% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			z-index: 3;
			background-color: white;
		}
		/* 하좌측 반원 */
		.calendarLB1 {
			width: 505px;
			height: 145px;
			position: absolute;
			left: 110px;
			top: 770px;
			border: 3px solid black;
			border-radius: 50% 50% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			z-index: 3;
			background-color: white;
		}
		
		.calendarLB2 {
			width: 380px;
			height: 120px;
			position: absolute;
			left: 185px;
			top: 847px;
			border: 3px solid black;
			border-radius: 30% 40% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			z-index: 3;
		}
		
		/* 하우측 반원 */
		.calendarRB1 {
			width: 505px;
			height: 145px;
			position: absolute;
			left: 615px;
			top: 770px;
			border: 3px solid black;
			border-radius: 50% 50% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			background-color: white;
			z-index: 3;
		}
		
		.calendarRB2 {
			width: 386px;
			height: 114px;
			position: absolute;
			left: 665px;
			top: 840px;
			border: 3px solid black;
			border-radius: 40% 40% 0 0;
			border-bottom: 0px solid rgba(255, 255, 255, 0);
			border-right: 0px solid rgba(255, 255, 255, 0);
			border-left: 0px solid rgba(255, 255, 255, 0);
			z-index: 3;
		}
		
		/* 각 사각 대각선 */
		.diagonalRT, .diagonalLT {
			width: 70px;
			height: 2px;
			background-color: black;
			position: absolute;
		}
		
		.diagonalRB, .diagonalLB {
			width: 65px;
			height: 2px;
			background-color: black;
			position: absolute;
		}
		
		.diagonalRT {
			left: 1108px;
			top: 90px;
			transform: rotate(45deg);
		}
		
		.diagonalLT {
			left: 52px;
			top: 90px;
			transform: rotate(-45deg);
		}
		
		.diagonalRB {
			left: 1110px;
			top: 858px;
			transform: rotate(40deg);
		}
		
		.diagonalLB {
			left: 53px;
			top: 858px;
			transform: rotate(-40deg);
		}
		
		/* 중앙선(+좌우) */
		.lineM {
			width: 100px;
			height: 2px;
			margin-left: 110px;
			margin-top: 100px;
			background-color: black;
			position: absolute;
			top: 792px;
			left: 455px;
			z-index: 3;
		}
		
		.lineL {
			width: 125px;
			height: 2px;
			background-color: black;
			position: absolute;
			top: 879px;
			left: 60px;
			z-index: 3;
		}
		
		.lineR {
			width: 120px;
			height: 2px;
			background-color: black;
			position: absolute;
			top: 880px;
			left: 1049px;
			z-index: 3;
		}
		
		/* 왼쪽 직선 3개 */
		.leftLine1 {
			width: 1px;
			height: 765px;
			background-color: black;
			position: absolute;
			top: 89px;
			left: 90px;
		}
		
		.leftLine2 {
			width: 2px;
			height: 765px;
			background-color: black;
			position: absolute;
			top: 103px;
			left: 75px;
		}
		
		.leftLine3 {
			width: 3px;
			height: 765px;
			background-color: black;
			position: absolute;
			top: 115px;
			left: 60px;
		}
		
		/* 오른쪽 직선 3개 */
		.rightLine1, .rightLine2, .rightLine3 {
			height: 767px;
			background-color: black;
			position: absolute;
		}
		
		.rightLine1 {
			width: 1px;
			top: 85px;
			left: 1135px;
		}
		
		.rightLine2 {
			width: 2px;
			top: 100px;
			left: 1150px;
		}
		
		.rightLine3 {
			width: 3px;
			top: 114px;
			left: 1166px;
		}
		
		/* 책표지 */
		.LMR {
			width: 1198px;
			height: 5px;
			background-color: black;
			position: absolute;
			top: 900px;
			left: 15px;
			z-index: 3;
		}
		
		.LT {
			width: 70px;
			height: 5px;
			background-color: black;
			position: absolute;
			top: 96px;
			left: 15px;
			transform: rotate(-10deg);
		}
		
		.RT {
			width: 70px;
			height: 5px;
			background-color: black;
			position: absolute;
			top: 94px;
			left: 1143px;
			transform: rotate(10deg);
		}
		
		.LL {
			width: 5px;
			height: 800px;
			background-color: black;
			position: absolute;
			top: 102px;
			left: 15px;
		}
		
		.RR {
			width: 5px;
			height: 800px;
			background-color: black;
			position: absolute;
			top: 102px;
			left: 1208px;
		}
		
        		/* 메인 */
        .mainT {
            width: 1000px;
            height: 700px;
            position: absolute;
/*             margin: 100px 5%; */
        }
        .mainLeft{
            width: 500px;
            height: 700px;
            position: absolute;
        }
        
        .mainRight {
            width: 500px;
            height: 770px;
            position: absolute;
            left: 504px;
            background-color: #c2e3e5;
        }
        .title {
            font-weight: 900;
            font-size: 24px;
            margin: 10px 25px;
            color: rgb(60,60,60);
            display: inline-block;
        }
        .add_delete {
            float: right;
            margin: 0px 18px;
        }
        .delete {
            width: 35px;
        }
        .delete:hover {
            cursor: pointer;
        }
        .add {
            font-size: 45px;
            height:55px;
            width: 55px;
            color: rgb(116, 116, 116);
            background-color: rgba(255, 255, 255, 0);
            border: none;
            padding: 0px;
            transition: all 1s;
        }
        .add:hover {
            cursor: pointer;
            color:rgb(88, 190, 165);
            transform: rotate(180deg);
        }
        .category {
            margin: 5px 25px;
            height: 84px;
            overflow: auto;
            width: 475px;
        }
        .category::-webkit-scrollbar {
            width: 10px;
        }
        .category::-webkit-scrollbar-thumb {
            background-color: #c2e3e5;
            border-radius: 5px;
        }
        .category_all {
            width: 80px;
            margin-right: 8px;
            background-color: rgb(70, 204, 186);
            color: white;
            font-weight: 700;
            border: none;
            border-radius: 30px;
            height: 30px;
            line-height: 26px;
            margin-bottom: 5px;
        }
        .category_all:hover {
            cursor: pointer;
            background-color: rgb(117, 218, 204);
        }
        .category_submit {
            margin-right: 8px;
            font-weight: 700;
            border: none;
            border-radius: 30px;
            height: 32px;
            line-height: 26px;
            margin-bottom: 10px;
            font-weight: 900;
            font-size: 13px;
            padding: 0px 20px;
            font-family: 'Nanum Gothic', sans-serif;
            background-color: rgb(255, 254, 230);
            color: rgb(84, 180, 172);
            border: 2.5px solid rgb(84, 180, 172);
        }
        .category_submit:hover {
            cursor: pointer;
            background-color: rgb(255, 255, 255);
        }
        .list_area {
            margin: 30px 20px;
            overflow-y: auto;
            height: 530px;
            width: 480px;
            padding-bottom: 100px;
        }
        .list_area::-webkit-scrollbar {
            background-color: white;
            width: 10px;
        }
        .list_area::-webkit-scrollbar-thumb {
            background-color:#c2e3e5;
            border-radius: 10px;
        }
        .list {
            width: 120px;
            display: inline-block;
            margin: 13px;
            margin-bottom: 0px;
            color: rgb(60, 60, 60);
            padding-top: 0px;
            height: 198px;
        }
        .list:hover {
            cursor: pointer;
            color:rgb(116, 116, 116);
        }
        .allselect {
            position: absolute;
            top: 155px;
            display: none;
        }
        .all_chb {
            zoom: 1.8;
            accent-color: rgb(0, 105, 79);
        }
        .all_sel {
            position: relative;
            top: -30px;
            left: 40px;
            font-weight: 900;
        }
        .select_can {
            position: relative;
            top: -55px;
            left: 355px;
            border: none;
            font-weight: 900;
            width: 50px;
            height: 30px;
            color:rgb(145, 145, 145);
            font-size: 15px;
            cursor: pointer;
        }
        .select_del {
            position: relative;
            top: -85px;
            left: 400px;
            border: none;
            font-weight: 900;
            width: 50px;
            height: 30px;
            color:rgb(255, 112, 124);
            font-size: 15px;
            cursor: pointer;
        }
        .select_chb {
			position: relative;
			top: -195px;
			display: none;
        }
        .del_chb {
            zoom: 1.8;
            accent-color: rgb(0, 105, 79);
        }
        .list_photo {
            width: 120px;
            height: 120px;
            background-color:rgb(221, 221, 221);
            border-radius: 10px;
            margin: 0px;
        }
        .list_name {
            font-weight: 900;
            text-align: center;
            margin-top: 13px;
            margin-bottom: 0px;
            font-size: 16px;
            /* width: 120px; */
            height: 60px;
            overflow: hidden;
        }
        .list_null {
        	font-size: 25px;
        	color: gray;
        	text-align: center;
        	margin-top: 150px;
        }
        .right_title {
            font-weight: 900;
            font-size: 24px;
            margin-top: 5px;
            color: rgb(60,60,60);
            margin-left: 410px;
        }
        .view{
            width: 450px !important;
            height: 260px !important;
            margin: 20px 25px;
            overflow-x: auto;
            background-color: rgb(255, 255, 255);
            border-radius: 8px;
        }
        .view::-webkit-scrollbar {
            width: 0px;
        }
        .upload_photo {
            display: none;
        }
        .photo_add {
            font-size: 40px;
            width: 50px;
            height: 50px;
            line-height: 45px;
            font-weight: 900;
            border: none;
            border-radius: 5px;
            color: #71989b;
            margin: 105px auto;
            background-color:rgb(243, 243, 243);
            text-align: center;
        }
        .photo_add:hover {
            cursor: pointer;
            color: #9ebdbe;
        }
        li {
            list-style: none;
        }
        .view_photo {
            width: 220px;
            height: 220px;
            background-color:#89b5b8;
            display: inline-block;
            margin: 20px auto;
            border-radius: 8px;
            margin-left: 90px;
            display: none;
        }
        .view_info {
            background-color: #89b5b8;
            width: 420px !important;
            height: 265px !important;
            margin: 20px auto;
            border-radius: 8px;
        }
        .view_name {
            font-weight: 900;
            width: 400px;
            height: 50px;
            text-align: center;
            font-size: 19px;
            border: none;
            background-color: rgba(255, 255, 255);
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin-bottom: 10px;
            color:#007e7e;
            padding: 0px 10px;
            outline: none;
        }
        .view_name::placeholder {
            color: rgb(194, 194, 194);
            font-size: 18px;
        }
        .subname {
            font-weight: 900;
            margin: 25px 25px;
            font-size: 18px;
            display: inline-block;
        }
        .select {
            float: right;
            margin-top: 10px;
            margin-right: 25px;
            width: 180px;
            height: 35px;
            border: none;
            border-radius: 5px;
            outline: none;
            text-align: center;
            background-color: rgb(255, 246, 227);
            font-weight: 900;
        }
        .select:hover {
            cursor: pointer;
        }
        .select:focus {
            background-color: rgb(255, 253, 244);
        }
        .price {
            float: right;
            width: 168px;
            height: 35px;
            text-align: right;
            font-weight: 900;
            font-size: 18px;
            border: none;
            margin-top: 20px;
            margin-right: 25px;
            border-radius: 5px;
            outline: none;
            background-color: rgb(255, 246, 227);
            padding-right: 10px;
            transition: 0.3s;
            line-height: 35px;
        }
        .price:focus {
            background-color: rgb(255, 253, 244);
            transition: 0.3s;
            left: 0;
            width: 180px;
        }
        .link {
            float: right;
            width: 260px;
            height: 45px;
            margin-top: 20px;
            margin-right: 25px;
            border: none;
            border-radius: 5px;
            background-color: rgb(255, 246, 227);
            outline: none;
            text-align: center;
            font-weight: 900;
            padding: 10px;
            color:rgb(116, 116, 116);
            transition: 0.3s;
        }
        .link:focus {
            background-color: rgba(255, 253, 244);
            transition: 0.3s;
            left: 0;
            width: 270px;
        }
        .save {
            margin-top: 60px;
            margin-left: 115px;
            width: 200px;
            height: 45px;
            border: none;
            border-radius: 6px;
            background-color: rgb(99, 212, 188);
            color: white;
            font-size: 20px;
            font-weight: 700;
            border-bottom: 3px solid rgb(95, 175, 158);
        }
        .save:hover {
            background-color: rgb(132, 223, 203);
            cursor: pointer;
            border-bottom: 3px solid rgb(113, 194, 176);
        }
        a {
        	text-decoration: none;
        }
        .main_title {
            height: 200px;
            margin: 70px auto;
            border-top: solid 6px rgb(94, 148, 127);
            width: 350px;
            border-radius: 10px;
        }
        .img_area {
            border-bottom: solid 6px rgb(94, 148, 127);
            margin: 10px -40px;
            width: 430px;
            border-radius: 10px;
        }
        .wish_img {
            width: 350px;
            margin-left: 40px;
            padding: 10px 0px;
            margin-bottom: 10px;
        }
        .white_box {
            background-color: white;
            width: 400px;
            height: 250px;
            border-radius: 200px;
            margin: 100px 50px;
            font-size: 150px;
            color: rgb(78, 122, 95);
        }
        .cart_img {
            width: 200px;
            margin: 20px 100px;
        }
                		/* 포스트잇 */
        .post1{
            width: 60px;
            height: 27px;
            position: absolute;
            font-size: 12px;
            font-weight: bold;
            font-style: italic;
            text-align: center;
            padding-top: 10px;
            color: rgba(104, 100, 100, 0.692);

         }
         .post2{
            width: 40px;
            height: 37px;
            position: absolute;
         }

         .postTodo {
			width: 60px;
			height: 27px;
			position: absolute;
			font-size: 12px;
			font-weight: bold;
			font-style: italic;
			text-align: center;
			padding-top: 1px;
			padding-bottom: 9px;
			color: rgba(104, 100, 100, 0.692);
		}
		.postTodo.It1 {
			z-index: 1;
			top: 32px;
			left: 10px;
			border-radius: 0px 80px 80px 0px;
			background-color: #FF9A9A;
		}
        .post1.It2 {
            z-index: 2;
            top: 120px;
            left: 8px;
            border-radius: 0px 80px 80px 0px;
            background-color: #FFCCAA;

        }
        .post1.It3 {

            z-index: 2;
            top: 200px;
            left: -10px;

            border-radius: 0px 80px 80px 0px;
            background-color: #fffabb;
            border-left: none;
        }
		.post2.It4 {
		   width: 60px;
		   height: 27px;
		   position: absolute;
		   font-size: 12px;
		   font-weight: bold;
		   font-style: italic;
		   text-align: center;
		   padding-top: 10px;
		   color: rgba(104, 100, 100, 0.692);
		   
		
		
		   z-index: 2;
		   top: 250px;
		   border-radius: 0px 80px 80px 0px;
		   background-color: #DCEDCA;
		}
        .post1.It5 {

            z-index: 2;
            top: 300px;
            left: -30px;
			width: 80px;
            border-radius: 0px 80px 80px 0px;
            background-color: #c2e3e5;
            }
        .post2.It6 {

            z-index: 2;
            top: 380px;
            border-radius: 0px 80px 80px 0px;
            background-color: #bed6f8;
        }
        .post2.It7 {

            z-index: 2;
            top: 420px;
            left: 10px;
            border-radius: 0px 80px 80px 0px;
            background-color: #c7cbef;
        }
        .post2.It8 {

            z-index: 2;
            top: 500px;
            /* left: 10px; */
            border-radius: 0px 80px 80px 0px;
            background-color: #d8cbf1;
        }
                /* 헤더 */
		header {
			margin-bottom: 20px;
		}
		
		div.wrapper {
			width: 1240px;
			margin-bottom: 20px;
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
		/*헤더 끝*/
		/* footer 부분  */
		footer {
			
		}
		
		.footer_all {
			width: 1240px;
			height: 200px;
			position: absolute;
			top: 1080px;
			background-color: rgba(0, 0, 0, 0.13);
			border-radius: 20px;
		}
		
		.left_logo {
			padding-top: 60px;
			margin-left: 100px;
			width: 220px;
			height: 120px;
		}
		
		.left_logo1 {
			margin-left: 15px;
			width: 200px;
			height: 50px;
			transform: skew(-32deg)
		}
		
		.left_logo2 {
			width: 200px;
			height: 30px;
		}
		
		.middle_copyRight {
			margin-left: 150px;
			width: 450px;
			height: 80px;
			font-size: 12px;
			position: absolute;
			left: 300px;
			top: 140px;
		}
		
		.mc1 {
			margin-left: 80px;
			display: inline-block;
		}
		
		.mc2 {
			margin-left: 40px;
			display: inline-block;
		}
		
		.mc3 {
			margin-top: 10px;
		}
		
		.right_contact {
			width: 280px;
			position: absolute;
			top: 40px;
			left: 950px;
		}
		
		.rc {
			width: 140px;
			font-size: 26px;
			font-weight: bold;
		}
		
		.rc2 {
			width: 480px;
			font-style: italic;
			position: absolute;
			left: 400px;
			top: 20px;
		}
		/*footer 끝*/
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
    window.onload = function() {
        seldel();
    }
    
    function seldel() {

        let del = document.querySelector(".delete");
        let chb = document.querySelectorAll(".select_chb")
        let all = document.querySelector('.allselect');
        let can = document.querySelector(".select_can");
        let list = document.querySelector(".list_area");
        let seldel = document.querySelector(".select_del");
        let realdel = document.querySelector(".real_del");

        for(let i=0; i<chb.length; i++) {
            del.addEventListener("click", ()=> chb[i].style.display = "block");
            can.addEventListener("click", ()=> chb[i].style.display = "none");
        }

            del.addEventListener("click", ()=> all.style.display = "block");
            del.addEventListener("click", ()=> list.style.marginTop = "50px");
            
            can.addEventListener("click", ()=> all.style.display = "none");
            can.addEventListener("click", ()=> list.style.marginTop = "30px");
            
            seldel.addEventListener("click", ()=> realdel.click());

    }
    
    
    function checkSelectAll()  {
    	  // 전체 체크박스
    	  const checkboxes 
    	    = document.querySelectorAll('input[name="check"]');
    	  // 선택된 체크박스
    	  const checked 
    	    = document.querySelectorAll('input[name="check"]:checked');
    	  // select all 체크박스
    	  const selectAll 
    	    = document.querySelector('input[name="checkAll"]');
    	  
    	  if(checkboxes.length === checked.length)  {
    	    selectAll.checked = true;
    	  }else {
    	    selectAll.checked = false;
    	  }

    	}

    	function selectAll(selectAll)  {
    	  const checkboxes 
    	     = document.getElementsByName('check');
    	  
    	  checkboxes.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked
    	  })
    	}
    
    </script>
</head>
<body>

         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="/syl/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
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

    <!-- 메인 -->
    <main>
    
    <section>
			<article>
				<div class="area_wrapper">
					<div class="calendarWhole">
						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->
						
						
        <div class="ex">
            <div class="mainT">
                
                <!-- 왼쪽 화면 -->
                <div class="mainLeft">
                    
                    <a href="${contextPath }/mainwish">
                    <div class="title">WISH LIST</div>
                    </a>
                    
                    <!-- 상품 추가 / 삭제 버튼 -->
                    <div class="add_delete">
                    
                    <!-- +(추가) 버튼을 누르면 카테고리 추가 페이지로 이동  -->
                    <a href="${contextPath }/insertwishpage">
                        <input onclick="doDisplay()" class="add" type="submit" value="+">
                    </a>
                    
                        <img class="delete" src="https://ifh.cc/g/2K5tVb.png">
                    </div>
                    
                    <!-- 상품 카테고리 -->
                    <div class="category">
                    			
						<form method="post" action="${contextPath }/searchcategory">
                    		<a href="${contextPath }/mainwish">
		                    	<input class="category_all" type="button" value="All">
		                    </a>
							<input name="category" class="category_submit" type="submit" value="가전제품">
							<input name="category" class="category_submit" type="submit" value="건강">
							<input name="category" class="category_submit" type="submit" value="도서">
							<input name="category" class="category_submit" type="submit" value="문화생활">
							<input name="category" class="category_submit" type="submit" value="미용">
							<input name="category" class="category_submit" type="submit" value="생활용품">
							<input name="category" class="category_submit" type="submit" value="음식">
							<input name="category" class="category_submit" type="submit" value="전자기기">
							<input name="category" class="category_submit" type="submit" value="패션">
							<input name="category" class="category_submit" type="submit" value="기타">
						</form>
						
                    </div>
                    
                    <!-- 상품 목록 -->
                    <div class="list_area">
                        
                    <c:choose>
                    	<c:when test="${empty search }">
							<div class="list_null">상품 목록이 없습니다</div>                    	
                    	</c:when>
                    	
                    	<c:when test="${!empty search }">
                    	
                    			<div class="allselect">
	                                <input name="checkAll" class="all_chb" type="checkbox" onclick='selectAll(this)'>
	                                <div class="all_sel">전체선택</div>
	                                <div class="select_can">취소</div>
	                                <div class="select_del">삭제</div>
	                            </div>
	                        
	                        <form name="frm" action="${contextPath }/checkdel" method="post">
	                    	<c:forEach var="sear" items="${search }">
	                    		<a href="${contextPath }/pickwish?seqNum=${ sear.seqNum }">
			                        <div class="list">
			                            <img class="list_photo"
			                            	src="${contextPath }/donwloadwishphoto?imageFileName=${sear.photo}">
			                            <div class="list_name">${sear.name }</div>
			                            <div class="select_chb">
			                             	<input name="check" class="del_chb" type="checkbox" value="${wish.seqNum }" onclick='checkSelectAll(this)'>
                                        </div>
			                            <input type="hidden" name="seqNum" value="${ sear.seqNum }">
			                        </div>
			                    </a>
	                        </c:forEach>
	                        
	                        	<input style="display: none;" type="submit" class="real_del">
	                    	</form>
	                    	
                        </c:when>
                    </c:choose>
                        
                        
                    </div>
                    
                    
                </div>
                
                <!-- 오른쪽 화면 -->
                <div class="mainRight">
                    
                    <div id="mainwish">

                        <div class="main_title">
                            <div class="img_area">
                                <img class="wish_img" src="https://ifh.cc/g/4CNLoR.png">
                            </div>
                        </div>
                        
                        <div class="white_box">
                            <img class="cart_img" src="https://ifh.cc/g/Dak2qn.png">
                        </div>
                      	
                	</div>
                	
                	
                </div>
			</div>
		</div>
		</div>
		
		            					<!-- 위쪽 반원 -->
					<div class="calendarLT"></div>
					<div class="calendarRT"></div>

					<!-- 아래쪽 좌측 반원 -->
					<div class="calendarLB0"></div>
					<div class="calendarLB1"></div>
					<div class="calendarLB2"></div>
					<!-- <div class="calendarLB3"></div> -->
					<!-- 아래쪽 우측 반원 -->
					<div class="calendarRB1"></div>
					<div class="calendarRB2"></div>
					<!-- <div class="calendarRB3"></div> -->

					<!-- 4개의 대각선 -->
					<div class="diagonalRT"></div>
					<div class="diagonalLT"></div>
					<div class="diagonalRB"></div>
					<div class="diagonalLB"></div>

					<!-- 중앙선 -->
					<div class="lineM"></div>
					<div class="lineL"></div>
					<div class="lineR"></div>

					<!-- 왼쪽 직선 3개 -->
					<div class="leftLine1"></div>
					<div class="leftLine2"></div>
					<div class="leftLine3"></div>
					<!-- 오른쪽 직선 3개 -->
					<div class="rightLine1">
						<a href='/syl/todo'><div class="postTodo It1">todo<br>memo</div></a>
						<a href='/syl/diaryList'><div class="post1 It2">Diary</div></a>
			            <a href='/syl/diet_1page.do'><div class="post1 It3">Diet</div></a>
			            <a href='/syl/ec_list.do'><div class="post2 It4">Exercise</div></a>
			            <a href='/syl/mainwish'><div class="post1 It5">Wish</div></a>
					</div>
			            
						
					<div class="rightLine2">
			            <div class="post2 It6"></div>
			            <div class="post2 It7"></div>
			            <div class="post2 It8"></div>
					</div>
					
					<div class="rightLine3"></div>

					<!-- 책표지 부분 -->
					<div class="LMR"></div>
					<div class="RT"></div>
					<div class="LL"></div>
					<div class="RR"></div>
					<div class="LT"></div>

				</div>
			</article>
		</section>
	
	</main>
	<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="/syl/resources/photo/logo2.png"> 
				<img class="left_logo2" src="/syl/resources/photo/3syl2.png">
			</div>

			<div class="rc2">
				We ONLY contact to email during office(9-6 KTS) hours for
				assistance, as emails regarding syl service team.<br> Do NOT
				send multiple emails as it delays our ability to respond in a timely
				manner.

			</div>
			<div class="right_contact">
				<div class="rc">Contact Us</div>
				<br> syl <br> Our Company Information<br> E-mail:
				syl2022@email.com<br>
			</div>

			<div class="middle_copyRight">
				<div class="mc1">이용약관</div>
				<div class="mc2">개인정보 처리방침</div>
				<div class="mc3">2022 syl Inc. All rights reserved. This site
					for our customers.</div>

			</div>
		</div>

	</footer> 
</body>
</html>