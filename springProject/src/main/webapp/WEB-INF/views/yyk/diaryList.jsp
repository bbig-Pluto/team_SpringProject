<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myspring.syl.yyk.dto.DiaryDTO"
%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>

<!DOCTYPE html>
<html>
<head>
<%-- 웹폰트 적용 --%>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
	background-color: #ffe6d7;
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
	background-color: #ffe6d7;
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
	background-color: #ffe6d7;
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

	.diaryWrap {
		width: 100%;
		height: 90%;
/* 		border: 1px solid #f6dfcf; */
		background-color: #ffe6d7;
/* 		border: 1px solid red; */
		position: relative;
	}
	
	/* diary + search wrap */
	.diaryList_headWrap {
		width: 80%;
	    height: 150px;
	    background-color: #ffffff;
	    margin-top: 5%;
	    margin-left: 9%;
	    border-radius: 10px;
	    text-align: center;
	    font-size: 30px;
	    font-weight: 600;
	    /* line-height: 100px; */
	    box-shadow: 0px 4px 8px #80808091;
	    position: relative;
	}
	/* 일기장 텍스트 */
	.diaryList_text {
		font-size: 57px;
		font-family: 'Dongle', sans-serif;
		margin-top: 20px;
	}
	/* 일기장 목록 박스 wrap */
	.diaryList_boxWrap {
		display: flex;
		flex-wrap: wrap;
		align-content: flex-start;
    	justify-content: flex-start;
		margin-left: 7.5%;
		margin-top: 4%;
		width: 840px;
 		height: 450px; 
		overflow: auto;
	}
	/* 일기장 목록 박스 하나 하나 */
	.box {
		 width: 350px;
            height: 90px;
            background-color: #fedbc2;
            margin: 30px;
            margin-top: 27px; 
            border-radius: 20px;
            line-height: 70px;
            position:relative;
           
	}
	/* 일기장 목록들 제목 */
	.diary_title {
		margin-left: 5%;
		margin-right: 5%;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: 15px;
		height: 45px;
		font-size: 15px;
		font-weight: 600;
	}
	/* 일기장 목록들 시간 */
	.diary_creatTime {
		position: absolute;
		right: 28px;
		margin-top: -15px;
		font-size: 13px;
	}
	
	/* 검색창 */
	.diaryList_search_input {
		width: 50%;
		padding: 3px 15px;
		background-color: #fdd6b53d;
		background-image:
			url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
		background-repeat: no-repeat;
		background-size: 18px 18px;
		background-position: 95% center;
		border-radius: 50px;
		border: 1px solid #5757568a;
		font-family: 'Dongle', sans-serif;
		font-size: 25px;
	}
	.diaryList_search_container{
		margin-top: -10px;
	}
	/* 	숨겨진 검색 버튼 */
	.serBtn {
		width: 30px;
		height: 30px;
		position: absolute;
		right: 201px;
		bottom: 31px;
 		background-color: #f4e6da00; 
		border: none;
		border-radius: 25px;
	}
	.serBtn:hover {
		background-color: gary;
		cursor:pointer;
	}
	
	/* 검색창 hover */
	.diaryList_search_input:hover {
		border: 1px solid gray;
	}
	
	/* 	다이어리 시퀀스  */
	.diary_diaryNum {
		display: none;
	}
	
	/* 일기장 제목 a태그 */
	 a {text-decoration: none;  }			/* 밑줄 안보이게*/
     a:link { color: rgb(120, 19, 19); } 	/* 기본 상태 */
     a:visited { color: rgb(120, 19, 19); } /* 사용자가 이미 링크 방문한 상태라면 갈색으로 */
     a:hover { color: coral; } 				/* 마우스 올려져 있을때 coral색으로 */
     a:active { color: rgb(9, 9, 9); } 		/* 마우스로 클릭할떄 khaki색으로 변경 */
     
    /* 일기장 추가 버튼*/
    .addBtn_container{
     	position: absolute;
        right: 13.5%;
        margin-top: 30px;
    }
    .addBtn {
        border:none;
        background-color: #fba568aa;
        width: 40px;
        height: 25px;
        color: rgba(255, 255, 255, 0.826);
        border-radius: 5px;
        font-size: 20px;
    }
     .addBtn:hover {
        background-color: #fdad748e;
    }
        
   	/* 스크롤바 전체 */
	.diaryList_boxWrap::-webkit-scrollbar {
	    width: 15px;
	    /* height: 15px; */
		/* margin-right: 10px; */
		
	}
	 /* 스크롤 여백 */
	.diaryList_boxWrap::-webkit-scrollbar-track {
	    /* background-color: rgba(0,0,0,0.1); */
	    border-radius: 5px;
	}

	/* 스크롤 막대 */
	.diaryList_boxWrap::-webkit-scrollbar-thumb {
	    /* background-color: rgba(239, 117, 117, 0.8); */
	/*     background-color: rgba(119, 118, 118, 0.223); */
	    background-color: rgba(255, 126, 52, 0.15);
	    border-radius: 5px;
		/* height: 10px; */
	}

        
     .msg {
          display: none; 
          font-size: 30px;
        	 color: rgba(159, 158, 158, 0.656);
          text-align: center;
          margin-top: 10%;
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
            left: -18px;
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
        
        
        /*마이페이지*/
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
window.onload = function () {
	
	// 서치
	document.querySelector('input[type="submit"]').addEventListener("click", function(e) {
		console.log("diaryList search EventListener route");
// 		e.preventDefault();
		search.method = "post";
		search.action = "/syl/searchDiary";
		search.submit();
	})
	
	
	// 일기장이 아무거도 없을 때 보여주는 문구
	let boxList = document.querySelectorAll(".box");
    if(boxList.length == 0 ){
    	let msg = document.querySelector(".msg");
        msg.style.display = "block"
    }
    <%
    // 세션을 연결해주는 통로 
    HttpSession logOnSession = request.getSession();
    // 로그인 통해서 들어오지 않고 주소창에서 바로 들어오는 사람을 위해 
    // isNew로 세션이 없으면 만들어 주고 있으면 가져다 씀
    if (logOnSession.isNew()) {
    	System.out.println("diaryList.jsp isNew true route");
    	logOnSession.setAttribute("isLogon", "guest");
    } else {
    	System.out.println("diaryList.jsp isNew false route");
    }
    
   	System.out.println("diaryList isLogon 아이디 : " + logOnSession.getAttribute("isLogon"));
    %>
    
    
    // 마이페이지
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

<body>
	<header>
         <div class="wrapper">
            <h1>
<!--                <img class="headerLogo" src="./3syl.png"><a href=""></a> -->
               <a href="${ contextPath }/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ contextPath }/bar/intro" class="headersub">다이어리 소개 |</a> 
               <a href="${ contextPath }/bar/story11" class="headersub">다이어리 구성 |</a> 
               <a href="${ contextPath }/bar/func" class="headersub">다이어리 기능 |</a> 
               <a href="${ contextPath }/bar/shot11"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ contextPath }/notice" class="headersub">고객의 소리</a>
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
		<section>
			<article>
				<div class="area_wrapper">
					<div class="calendarWhole">
						<!-- !!!!!!!!!!!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->
						<div class="diaryWrap">
							<div class="diaryList_headWrap">
								<div class="diaryList_text">Diary</div>
								
								
								<!-- 검색창 -->
								<form name="search">
									<div class="diaryList_search_container">
										<input type="text" name="d_title" class="diaryList_search_input" placeholder="Search" autocomplete="off">
										<input type="submit" class="serBtn" value="">
									</div>
								</form>
							</div>
							
							<div class="addBtn_container">
				                <input type="button" value="+" class="addBtn" onclick="location.href='/syl/addDiaryList'">
				            </div>
				            <div class="msg">
				            	"+"를 눌러 일기장을 추가해보세요!
				            </div>
							<div class="diaryList_boxWrap">
								
								<c:forEach var="list" items="${ list }">
								
									<div class="box ${list}">
										<div class="diary_title">
											<a href="detailDiary
													?diaryNum=${list.diaryNum}
													&title=${list.d_title}
													&content=${list.d_content }
													&fileName=${list.d_fileName}
													&weather=${list.d_weather}
													&emotion=${list.d_emotion}">
											${list.d_title }</a>
										</div>
										
										<div class="diary_creatTime">
											작성날짜 : ${list.d_createTime }
										</div>
										<div class="diary_diaryNum">
											${list.diaryNum }
										</div>
									</div>
									
								</c:forEach>
								
								
								
						
				
							</div>
						</div>
					</div>

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
						<a href='/syl/todo'><div class="postTodo It1">todo<br>memo</div></a>
						<a href='${ contextPath }/diaryList'><div class="post1 It2">Diary</div></a>
			            <a href='${ contextPath }/diet_1page.do'><div class="post1 It3">Diet</div></a>
			            <a href='${ contextPath }/mainwish'><div class="post1 It5">Wish</div></a>
					</div>
					
					<div class="rightLine2">
<!-- 						<div class="post2 It1"></div> -->
			            <a href="/syl/ec_list.do"><div class="post2 It4">Exercise</div></a> 
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
				<img class="left_logo2" src="${contextPath }/resources/photo/3syl2.png">
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


	</footer>
</body>
</html>