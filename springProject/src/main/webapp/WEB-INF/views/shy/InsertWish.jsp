<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
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
/*             border: 1px solid black; */
            width: 1000px;
            height: 700px;
            position: absolute;
/*             margin: 100px 5%; */
        }
        .mainLeft{
/*             border: 1px solid black; */
            width: 500px;
            height: 700px;
            position: absolute;
        }
        
        .mainRight {
/*             border: 1px solid black; */
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
        }
        .list:hover {
            cursor: pointer;
            color:rgb(116, 116, 116);
        }
        .del_chb {
            position: absolute;
            zoom: 2.0;
            accent-color: rgb(255, 181, 206);
            display: none;
        }
        .list_photo {
            width: 120px;
            height: 120px;
            background-color:rgb(221, 221, 221);
            border-radius: 10px;
            margin: 0px;
        }
        .null_photo {
        	width: 120px;
        	height: 120px;
        	background-color: rgb(221, 221, 221);
        	border-radius: 10px;
        	margin: 0px;
        	display: none;
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
        .view_photo {
            width: 230px; 
            height: 230px; 
            margin: 15px; 
            border-radius: 8px; 
            margin-left: 115px;
            cursor: pointer;
            display: none;
        }
        .mod_photo {
            position: absolute;
            background-color: rgba(0, 0, 0, 0.068);
            font-size: 60px;
            font-weight: 900;
            color: rgba(255, 255, 255, 0.842);
            width: 230px;
            height: 230px;
            border-radius: 8px;
            text-align: center;
            line-height: 230px;
            display: none;
            cursor: pointer;
            z-index: 1;
            top: 75px;
            left: 140px;
        }
        .view_photo:hover ~ .mod_photo {
            display: block;
        }
        .view_info {
            background-color: #89b5b8;
            width: 420px !important;
            height: 285px !important;
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
            margin: 15px 25px;
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
        .select option {
            background-color: rgb(255, 246, 227);
            border-radius: 5px;
            font-weight: 900;
            color: #125169;
            font-size: 15px;
        }
         .price {
            /* float: right; */
            width: 168px;
            height: 35px;
            text-align: right;
            font-weight: 900;
            font-size: 18px;
            border: none;
            margin-top: 20px;
            border-radius: 5px;
            border-top-right-radius: 0px;
            border-bottom-right-radius: 0px;
            outline: none;
            background-color: rgb(255, 246, 227);
            padding-right: 10px;
            transition: 0.3s;
            line-height: 35px;
            display: inline-block;
            margin-left: 98px;
        }
        .price:focus {
            background-color: rgb(255, 253, 244);
            transition: 0.3s;
            left: 0;
            width: 180px;
            margin-left: 86px;
        }
        .price_txt {
            margin-right: 25px;
        	width: 30px;
        	height: 37px;
        	background-color: rgb(255, 246, 227);
        	font-size: 18px;
        	float: right;
        	margin-top: 20px;
            line-height: 35px;
            font-weight: 900;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
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
            overflow-y: auto;
        }
        .link:focus {
            background-color: rgba(255, 253, 244);
            transition: 0.3s;
            left: 0;
            width: 270px;
        }
        .link::-webkit-scrollbar {
            width: 0px;
        }
        .save {
            margin-top: 35px;
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
        .cetegory_page {
            font-weight: 900;
            font-size: 24px;
            margin-top: 20px;
            color: rgb(60,60,60);
            margin-left: 350px;
        }
        .ca_title {
            font-size: 25px;
            font-weight: 900;
            margin: 25px auto;
            margin-top: 10px;
            text-align: center;
            border-bottom: 4px solid rgb(118, 173, 173);
            padding: 15px;
            width: 260px;
        }
        .ca_area {
            background-color:rgb(250, 241, 215);
            width: 380px;
            margin: auto;
            padding: 20px;
            height: 215px;
            border-radius: 5px;
            overflow: auto;
        }
        .ca_area::-webkit-scrollbar {
            border-radius:  5px;
            height: 200px;
            width: 5px;
        }
        .ca_area::-webkit-scrollbar-track {
            background-color: 250, 241, 215;
        }
        .ca_area::-webkit-scrollbar-thumb {
            background-color: rgb(212, 198, 177);
        }
        .ca_list {
            background-color:#007e7e;
            color: white;
            width: auto;
            height: 35px;
            text-align: center;
            line-height: 30px;
            margin: 10px 10px;
            margin-right: 5px;
        }
        .ca_list:hover {
            background-color: rgb(50, 145, 145);
            cursor: pointer;
        }
        .category_null {
        	font-size: 16px;
        	color: gray;
        	text-align: center;
        	margin-top: 85px;
        	font-weight: 900;
        }
        .add_title {
            font-size: 25px;
            font-weight: 900;
            margin: 5px auto;
            text-align: center;
            border-bottom: 4px solid rgb(118, 173, 173);
            padding: 15px;
            width: 260px;
        }
        .ca_add {
            background-color:rgb(211, 194, 163);
            width: 380px;
            margin: 20px auto;
            border-radius: 4px;
            height: 100px;
            position: absolute;
            margin-left: 60px;
        }
        .add_text {
            width: 250px;
            margin: 30px 20px;
            text-align: center;
            height: 35px;
            border: none;
            transition: 0.2s;
            outline: none;
            border-radius: 5px;
            color:rgb(85, 85, 85);
            font-size: 16px;
            font-weight: 900;
        }
        .add_text:focus {
            height: 40px;
            margin: 27.5px 20px;
        }
        .add_text::placeholder {
            font-size: 14px;
            color: rgb(189, 189, 189);
            font-weight: 0px;
        }
        .add_btn {
            float: right;
            margin-right: 85px;
            margin-top: 45px;
            position: relative;
            background-color: rgb(250, 241, 215);
            width: 60px;
            height: 50px;
            text-align: center;
            line-height: 50px;
            border-radius: 3px;
            font-weight: 900;
            border: none;
            border-bottom: 3px solid rgb(118, 173, 173);
            color: rgb(60,60,60);
            font-weight: 900;
        }
        .add_btn:hover {
            cursor: pointer;
        }
        .next {
            width: 200px;
            height: 45px;
            border: none;
            border-radius: 6px;
            background-color: rgb(99, 212, 188);
            color: white;
            font-size: 18px;
            font-weight: 700;
            position: relative;
            margin: 45px 150px;
            border-bottom: 3px solid rgb(95, 175, 158);
        }
        .next:hover {
            background-color: rgb(132, 223, 203);
            cursor: pointer;
            border-bottom: 3px solid rgb(113, 194, 176);
        }
        #view_page {
/*             display: none; */
        }
        a {
        	text-decoration: none;
        }
        .image_notice {
            background-color: rgba(255, 242, 206, 0.733);
            position: absolute;
            z-index: 1;
            top: 300px;
            left: 360px;
            width: 250px;
            height: 110px;
            /* border: 2px solid rgb(167, 192, 187); */
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            display: none;
        }
        .image_name {
            font-weight: 900;
            margin-top: 10px;
            color: rgb(60, 60, 60);
        }
        .image_confirm {
            width: 90px;
            background-color: rgb(99, 212, 188);
            border-radius: 3px;
            border: none;
            height: 35px;
            font-weight: 900;
            margin-left: 10px;
            color: white;
            font-size: 15px;
            margin-top: 25px;
            cursor: pointer;
        }
        .name_notice {
            background-color: rgba(255, 242, 206, 0.733);
            position: absolute;
            z-index: 1;
            top: 300px;
            left: 360px;
            width: 250px;
            height: 110px;
            /* border: 2px solid rgb(167, 192, 187); */
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            display: none;
        }
        .name_name {
            font-weight: 900;
            margin-top: 10px;
            color: rgb(60, 60, 60);
        }
        .name_confirm {
            width: 90px;
            background-color: rgb(99, 212, 188);
            border-radius: 3px;
            border: none;
            height: 35px;
            font-weight: 900;
            margin-left: 10px;
            color: white;
            font-size: 15px;
            margin-top: 25px;
            cursor: pointer;
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

         .post2.It1 {
     
            z-index: 2;
            top: 60px;
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

            z-index: 2;
            top: 240px;
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
    </style>
	<script>
        window.onload = function() {
            upload();
            
            document.querySelector('input[name="save"]').addEventListener("click", function(e) {
            	e.preventDefault();
            	
            	let name = document.querySelector('input[name="name"]').value;
            	name = name.trim();
            	
            	let image = document.querySelector('input[name="photo"]').value;
            	image = image.trim();
            	
            	let imgntc = document.querySelector(".image_notice");
            		let imgcf = document.querySelector(".image_confirm");
            	let namentc = document.querySelector(".name_notice");
            		let namecf = document.querySelector(".name_confirm");
            	
            	if(name == '' || name.length == 0) {
            		namentc.style.display = "block";
            		namecf.addEventListener("click", ()=> namentc.style.display = "none");
            		
            	} else if(image == '' || image.length == 0) {
            		imgntc.style.display = "block";
            		imgcf.addEventListener("click", ()=> imgntc.style.display = "none");
            		
            	} else {
            		<% System.out.println("InsertWish Submit Route"); %>
            		insert.method = "post";
            		insert.action = "/syl/insertwish";
            		insert.enctype = "multipart/form-data"
            		insert.submit();
            	}
            })
            
        }
        
        /* 파일 업로드 버튼 대체 */
        function upload() {
            
            let up = document.querySelector(".upload_photo");
            let add = document.querySelector(".photo_add");
	        let mPhoto = document.querySelector(".mod_photo");
            
	        add.addEventListener("click", ()=> up.click());
	        mPhoto.addEventListener("click", ()=> up.click());
//             up.addEventListener("change", getImageFiles);
//             up.addEventListener("change", readURL(up));
            up.addEventListener("change", ()=> up.click());
        }

		/* 이미지 미리보기 */
		function readURL(input) {
			
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e) {
// 					$('.view_photo').attr('src', e.target.result);
					document.querySelector('.view_photo').setAttribute('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
				
				let photo = document.querySelector(".view_photo");
				photo.style.display = "block";
				
			}
		}
        
    </script>
</head>
<body>

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
                    
                    <!-- + (추가) 버튼을 누르면 상품 추가 페이지로 이동  -->
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
                    	<c:when test="${empty wishlist }">
							<div class="list_null">상품 목록이 없습니다</div>                    	
                    	</c:when>
                    	
                    	<c:when test="${!empty wishlist }">
	                    	<c:forEach var="wish" items="${wishlist }">
	                    		<a href="${contextPath }/pickwish?seqNum=${ wish.seqNum }">
			                        <div class="list">
			                        	<input class="del_chb" type="checkbox">
			                            <img class="list_photo"
			                            	src="${contextPath }/donwloadwishphoto?imageFileName=${wish.photo}">
			                            <div class="list_name">${wish.name }</div>
			                            <input type="hidden" name="seqNum" value="${ wish.seqNum }">
			                        </div>
			                    </a>
	                        </c:forEach>
                        </c:when>
                    </c:choose>
                        
                        
                    </div>
                    
                    
                </div>
                
                <!-- 오른쪽 화면 -->
                
                <div class="mainRight">
                    
                        
<!--                     <div id="category_area"> -->

<!--                         <div class="cetegory_page">CATEGORY</div> -->
                        
                        
<!--                         <div class="ca_title">카테고리 선택</div> -->
                    			
<!-- 			           	<div class="ca_area"> -->
<%-- 	                       	<c:choose> --%>
<%-- 	                            <c:when test="${empty wishList }"> --%>
<!-- 	                               	<div class="category_null">카테고리를 추가해주세요</div> -->
<%-- 	                            </c:when> --%>
<%-- 	                    		<c:when test="${!empty wishList }"> --%>
<%-- 	                    			<c:forEach var="wish" items="${wishList }"> --%>
<%-- 				                            <div class="ca_list">${wish.category }</div> --%>
<%-- 				                    </c:forEach> --%>
<%-- 				               </c:when> --%>
<%-- 				            </c:choose> --%>
<!-- 			            </div> -->
                        
<!--                         <div class="add_title">추가하기</div> -->
                        
<%--                         <form method="post" action="${contextPath }/wishlist/addWish.do"> --%>
<!-- 	                        <div class="ca_add"> -->
<!-- 	                            <input name="category" class="add_text" type="text" placeholder="카테고리명을 입력해주세요"> -->
<!-- 	                        </div> -->
<!-- 	                            <input type="submit" class="add_btn" value="추가"> -->
<!--                         </form> -->
                            
<!--                             <input onclick="next()" class="next" type="submit" value="다음"> -->
<!--                         </div> -->
                    
                    <div id="view_page">
                        
                        <div class="right_title">VIEW</div>
                        
                <!-- 상품 추가 -->
                <form name="insert">

						<!-- 이미지 업로드 -->
                        <div class="view">
                            <input name="photo" type="file" class="upload_photo" accept="image/*" onchange="readURL(this);">
                                <img class="view_photo">
                            <div class="mod_photo">+</div>
                            <div class="photo_add">+</div>
                        </div>
                    
                    	<!-- 상품 이름 -->
                        <div class="view_info">
                            <input name="name" type="text" class="view_name" placeholder="상품 이름을 입력하세요">
                            
                        <!-- 카테고리 선택 -->
                            <div class="subname">카테고리</div>
                            
                            <select name="category" class="select">
                                <option value="기타">선택해주세요</option>
<%--                                 <c:choose> --%>
<%--                                 	<c:when test="${!empty selcategory }"> --%>
<%--                                 		<c:forEach var="cate" items="${selcategory }"> --%>
                                			<option value="가전제품">가전제품</option>
                                			<option value="건강">건강</option>
                                			<option value="도서">도서</option>
                                			<option value="문화생활">문화생활</option>
                                			<option value="미용">미용</option>
                                			<option value="생활용품">생활용품</option>
                                			<option value="음식">음식</option>
                                			<option value="전자기기">전자기기</option>
                                			<option value="패션">패션</option>
<%--                                 			<option value="${selcategory.category }" >${selcategory.category }</option> --%>
<%--                                 		</c:forEach> --%>
<%--                                 	</c:when> --%>
<%--                                 </c:choose> --%>
                            </select><br>
                            
                            <!-- 상품 가격 -->
                            <div class="subname">가격</div>
	                            <input name="price" class="price" type="text">
	                            <div class="price_txt">￦</div><br>
                            
                            <!-- 상품 링크 -->
                            <div class="subname">링크</div>
                            <textarea name="link" class="link" type="text"></textarea>
                            
                            <input name="save" class="save" type="submit" value="저장하기">
                        </div>
				   </form>
                    
                    </div>
                        
                    </div>
                    
			                <!-- 이미지 팝업 -->
			                <div class="image_notice">
			                    <div class="image_name">상품 이미지를 등록해주세요</div>
			                    <input class="image_confirm" type="button" value="확인">
			                </div>
			
			                <!-- 상품명 팝업 -->
			                <div class="name_notice">
			                    <div class="name_name">상품명을 입력해주세요</div>
			                    <input class="name_confirm" type="button" value="확인">
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
						<a href='${ contextPath }/yyk/diaryList.jsp'><div class="post1 It2">Diary</div></a>
			            <a href='${ contextPath }/Hanu/Diet_diary_EL_View.jsp'><div class="post1 It3">Diet</div></a>
			            <a href='${ contextPath }/shy/mainwish.jsp'><div class="post1 It5">Wish</div></a>
					</div>
			            
						
					<div class="rightLine2">
			            <div class="post2 It1"></div>
			            <div class="post2 It4"></div>
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

</body>
</html>