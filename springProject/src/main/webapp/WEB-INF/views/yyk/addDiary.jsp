<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.servlet.http.HttpServlet"
	import="javax.servlet.http.HttpServletRequest"
	import="javax.servlet.http.HttpServletResponse"
	import="javax.servlet.http.HttpSession"
    import="com.myspring.syl.yyk.dao.DiaryDAO"
    import="java.util.List"
%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<%-- 웹폰트 적용 --%>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
<%-- css파일 --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/diary.css" /> --%>

<title>전체 문의 게시판 부분</title>
<style>
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
	background-color: #ffccaa;
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
	background-color: #ffccaa;
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
	background-color: #ffccaa;
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

/* ///////////////////////////////////////////////////////////// */
/* 스타일 구현 여기 아래쪽으로 하세요  제발*/
/* 배경색 수정은 전체 틀잡기 구역에 배경색상1,2,3을 수정 하면됩니다 다른 부분 터치 금지. */
/* 왼쪽 영역 */
        .left {
/*             border-top: 1px solid black; */
/*             border-left: 1px solid black; */
/*             border-bottom: 1px solid black; */
            background-color: #ffccaa;
            width: 40%;
            height: 100%;
            float: left;
            box-sizing: border-box;
        }

        /* 오늘의 사진 텍스트 */
        .left_top_text {
            display: inline-block;
            margin-top: 15%;
            margin-left: 14%;
            font-size: 38px;
            font-family: 'Dongle', sans-serif;
            font-weight: 700;
        }

        /* 원래 파일 선택 버튼 */
        input[type=file]::file-selector-button {
/*             display: none; */
/*             border: none; */
/*             background-color: #f7f3f3fe; */
/*             margin-left: 15%; */
/*             width: 70px; */
/*             height: 20px; */
        }

        /* label 파일 선택 버튼*/
        .labelWrap {
            border: 1px solid #f7f3f3fe;
            border-radius: 5px;
            background-color: rgb(255, 255, 255);
            text-align: center;
            width: 40px;
            font-size: 20px;
            font-weight: 900;
            color: #ffccaa;
            display: inline-block;
            margin-left: 7%;

        }
	 	.postit_container {
            position: relative;
/*             margin-left: 4%; */
        }
        
        /* 포스트잇 이미지 */
        .postit {
            width: 80%;
            margin-top: -17px;
            margin-left: 14%;
        }
        /* 사진 미리보기*/
        .preview{
        }
        
        /* 파일 영역 컨테이너 */
        .file_container {
            position:absolute;
            top:43px;
            left:93px;
        }

        /* ////////////////////////////////////////////////////////////////// */
        /* 왼쪽 아래 */
        .left_bottom_wrap {
            /* border: 1px solid black; */
            background-color: rgba(255, 254, 237, 0.645);
            /* background-color: rgb(247, 242, 226); */
            border-radius: 25px;
            width: 80%;
            height: 144px;
            margin-left: 14%;
            margin-top: 1%;
        }

        /* Today' mood */
        .left_bottom_text {
            margin-top: 3%;
            margin-left: 14%;
            font-size: 35px;
            font-family: 'Dongle', sans-serif;
            font-weight: 700;
        }

        /* 날씨 이모티콘 */
        .weather img {
            width: 50px;
            height: 50px;
            margin-top: 5%;
            /*margin-right: 4%;
            margin-bottom: 5%; */
            padding: 2%;
        }

        /* 날씨 맑음 아이콘 */
        .sunny {
            margin-left: 6%;
        }

        /* .slidecontainer {
            width: 100%;
            margin-top: 100px;
        } */

        /* 슬라이더 바 */
        .diary_slider {
            -webkit-appearance: none;  /*기본 CSS 스타일을 적용하지 않기 위해서 */
            width: 80%;                /* 슬라이더 길이 */
            height: 10px;              /* 슬라이더 두께 */
            border-radius: 5px;        /* 슬라이더 모서리 약간 둥글게 */
            background :                /* 슬라이더 색상 */
                linear-gradient(to right, #a0a8f8, #d9f196, #f8d996 ,#f08364); 
            outline: none;             /* 슬라이더 테두리 없이 */
            margin-top: 6%;
            margin-left: 8%;
        }
        /* 슬라이더 핸들 */
        .diary_slider::-webkit-slider-thumb { /*(Chrome, Safari, Edge 브라우저를 위해서 -webkit-*/
            -webkit-appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
            appearance: none; /* 기본 CSS 스타일을 적용하지 않기 위해서 */
            width: 20px; /* 슬라이더 핸들 크기 */
            height: 20px; 
            border-radius: 50%; /*핸들 모양을 원모양으로 만들기*/
            background: rgba(255, 195, 155, 0.99); /* 슬라이더 핸들 색상 */
            cursor: pointer; 
            /* background-image: url(./image/구름.png); */
        }
       

        /* //////////////////////////////////////////////////////////////// */
        /* 오른쪽 영역 */
        .right {
/*             border-top: 1px solid black; */
/*             border-right: 1px solid black; */
/*             border-bottom: 1px solid black; */
            background-color: #ffccaa;
            width: 60%;
            height: 100%;
            float: right;
            box-sizing: border-box;
        }

        /* 일기장 텍스트 */
        .diary {
            font-size: 52px;
            font-weight: 600;
            font-family: 'Dongle', sans-serif;
            margin: 20px;
            margin-top: 30px;
            /* margin-left: 7%; */
            position: relative;
            left: 70%;
        }

        /* 오른쪽 일기장 배경 */
        .right_wrap {
            /* border: 1px solid rgb(57, 56, 56); */
            border-radius: 25px;
            background-color: white;
            margin-top: -20px;
            margin-left: 5%;
            width: 85%;
            height: 552px;
        }

        /* 제목 */
        .title {
            height: 6%;
            margin-top: 11%;
            margin-left: 15%;
            position: relative;
            z-index: 10;
            display: inline-block;
            font-family: 'Nanum NeuRisNeuRisCe';
            font-size: 25px;
            font-weight: 600;
        }

        /* 제목 입력 칸 */
        .title_input {
            display: inline-block;
            border: none;
            outline: none;
            border-radius: 25px;
            background-color: #f7bc919c;
            /* border-bottom: 1px solid black; */
            position: relative;
            z-index: 10;
            font-family: 'Nanum NeuRisNeuRisCe';
            font-size: 27px;
            font-weight: 500;
            margin-left: 3%;
            width: 55%;
            height: 30px;
            padding-left: 10px;
        }

        /* 줄노트 */
        .notes {
            background-attachment: local;
            background-image:
                linear-gradient(to right, white 10px, transparent 10px),
                linear-gradient(to left, white 10px, transparent 10px),
                repeating-linear-gradient(white, white 30px, #ffccaa 30px, #ffccaa, white 31px);
            line-height: 31px;
            /* padding: 8px 10px; */
            position: relative;
            z-index: 10;
            margin-top: 4%;
            margin-left: 13%;
            border: 0;
            outline: none;
            width: 73%;
            height: 350px;
            resize: none;
            padding-left: 10px;
        }
        /* 저장버튼 */
        .diary_submit_btn {
        	display: inline-block;
            border: none;
            border-radius: 15px;
            background-color: rgb(250, 170, 130);
            color: black;
            font-family: 'Nanum NeuRisNeuRisCe';
            font-size: 20px;
            font-weight: 500;
            width: 100px;
            height: 30px;
            margin-top: 2%;
            margin-left: 28%;
            
        }
        /* 목록버튼 */
        .diary_goList_btn{
            display: inline-block;
            border: none;
            border: 1px solid rgba(243, 219, 204, 0.36);
            border-radius: 15px;
            background-color: rgba(255, 224, 209, 0.353);
            color: black;
            font-family: 'Nanum NeuRisNeuRisCe';
            font-size: 20px;
            font-weight: 500;
            width: 100px;
            height: 30px;
            line-height: 15px;
            margin-top: 2%;
            margin-left: 2%;
            vertical-align: bottom;
        }
         /* 저장,목록 버튼 hover */
        .diary_submit_btn:hover, .diary_goList_btn:hover {
            background-color: #ffccaaad;
        }
        
        .diaryWrap{
        	width: 100%;
        	height: 90%;
        }
        
        
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
                       border: 1px solid rgb(219, 219, 219);
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
            left: 10px;

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


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
window.onload = function() {
	icon_zoomIn();
	icon_zoomOut();
// 	readURL(input);
	
	
	// 회원 : 제목 입력 안하고 저장 시 경고창
	// 비회원 : 저장 시 로그인 경고 문구
	document.querySelector('input[type="submit"]').addEventListener("click", function(e) {
		// form type이 submit이라 써줌
			e.preventDefault();
			
				let title = document.querySelector('input[name="d_title"]').value;
				title = title.trim();
				if(title == '' || title.length == 0 ) {
						alert("제목을 입력해주세요");
					} else {
						<% System.out.println("addDiary submit route"); %>
						add.method = "post";
						add.action = "/syl/addDiary";
						add.enctype = "multipart/form-data"
						add.submit();
					}
	})
	
	
	
}
	// 사진 이미지 미리보기
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e) {
				$('.preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}


	// 아이콘 hover시 해당 아이콘 크기 커짐
    function icon_zoomIn(event) {
        if(event){
            event.target.style.transform = "scale(1.2)"; // 크기 1.2배 키워주기
            event.target.style.zIndex = 1;
            event.target.style.transition = "all 0.1s"; // 커지는 데 0.1초
        }
    }
    
    function icon_zoomOut(event) {
        if(event){
            event.target.style.transform = "scale(1)"; 
            event.target.style.zIndex = 0;
            event.target.style.transition = "all 0.1s";
        }
    }


</script>
</head>



<body>
	<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="${ contextPath }/js/calendarM.jsp"><img class="headerLogo" src="/team_Project/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ contextPath }/intro.jsp" class="headersub">다이어리 소개 |</a> 
               <a href="${ contextPath }/story11.jsp" class="headersub">다이어리 구성 |</a> 
               <a href="${ contextPath }/func.jsp" class="headersub">다이어리 기능 |</a> 
               <a href="${ contextPath }/shot11.jsp"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ contextPath }/sdy/notice_show.jsp" class="headersub">고객의 소리</a>
               <div class="lgnbtn">
                  <a href="${ contextPath }/hunminjsp/mypage.jsp" class="headermypage">마이페이지</a>
                  <a href="${ contextPath }/hunminjsp/signin.jsp" class="headerlogin">로그인</a>
                  <a href="${ contextPath }/member/logout.do" class="headerloginout">로그아웃</a>
               </div>
            </nav>
         </div>
      </header>

	<main>
		<section>
			<article>
				<div class="area_wrapper">
					<div class="calendarWhole">
						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->
						<form name="add" >
				            <div class="diaryWrap">
					            <!-- 왼쪽 영역 -->
					            <div class="left">
					
					                <!-- 사진 파일 -->
					                <div class="left_top_wrap">
					                    <div class="left_top_text">Today's Photo</div><br>
					                    <!-- 포스트잇 이미지 -->
					                    <!-- 업로드 -->
										<div class="postit_container">
											<img src="resources/yyk/image/포스트잇(완).png" class="postit" >
											<div class="file_container">
												<img class="preview"  width=250 height=250/><br>
												<input type="file" name="file" onchange ="readURL(this);"><br>
											</div>
										</div>
					                </div>
					
					
					                <!-- 기분 & 날씨 -->
					                <div class="left_bottom_text">Today's Emotion</div>
					                <div class="left_bottom_wrap">
					                    <!-- 날씨 -->
					                    <div class="weather">
					                        <img src="resources/yyk/image/맑음.png" class="sunny" onmouseenter="icon_zoomIn(event)" onmouseleave="icon_zoomOut(event)">
					                        <img src="resources/yyk/image/구름.png" onmouseenter="icon_zoomIn(event)" onmouseleave="icon_zoomOut(event)">
					                        <img src="resources/yyk/image/비.png" onmouseenter="icon_zoomIn(event)" onmouseleave="icon_zoomOut(event)">
					                        <img src="resources/yyk/image/무지개.png" onmouseenter="icon_zoomIn(event)" onmouseleave="icon_zoomOut(event)">
					                    </div>
					                    <!-- 기분 -->
					                    <div class="slidecontainer">
					                        <input type="range" min="1" max="5" class="diary_slider">
					                    </div>
					                </div>
					            	</div>
					
					
					
					            <!-- 오른쪽 영역 -->
					            <div class="right">
					                <div class="diary">Diary</div>
					                <div class="right_wrap">
					                    
					                        <!-- 제목 & 제목 입력 창 -->
					                        <div class="title">제목 </div>
					                        <input type="text" name="d_title" class="title_input" autocomplete="off">
					                        
					                        <!-- 일기 내용 -->
					                        <div class="textarea_container">
					                            <textarea class="notes" name="d_content"></textarea>
					                        </div>
					                        <input type="submit" class="diary_submit_btn" value="저장" >
					                        <input type="button" class="diary_goList_btn" value="목록" onclick="location.href='/syl/diaryList'">
					                   
					                </div>
					            </div>
	           				</div> <!-- diaryWrap end -->
	           				
						 </form>
						 
        			</div> <!-- calendarWhole end -->









					<!-- 위쪽 반원 -->
					<div class="calendarLT"></div>
					<div class="calendarRT"></div>

					<!-- 아래쪽 좌측 반원 -->
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

	<footer>
		<div class="footer_all">

			<div class="left_logo">
				<img class="left_logo1" src="https://ifh.cc/g/H618K6.png"> 
				<img class="left_logo2" src="/team_Project/photo/3syl2.png">
			</div>

			<div class="rc2">
				We ONLY contact to email during office(9-6 KTS) hours for
				assistance, as emails regarding SYL service team.<br> Do NOT
				send multiple emails as it delays our ability to respond in a timely
				manner.

			</div>
			<div class="right_contact">
				<div class="rc">Contact Us</div>
				<br> SYL <br> Our Company Information<br> E-mail:
				syL2022@email.com<br>
			</div>

			<div class="middle_copyRight">
				<div class="mc1">이용약관</div>
				<div class="mc2">개인정보 처리방침</div>
				<div class="mc3">2022 SYL Inc. All rights reserved. This site
					for our customers.</div>

			</div>
		</div>

		</div>

	</footer>
</body>
</html>

