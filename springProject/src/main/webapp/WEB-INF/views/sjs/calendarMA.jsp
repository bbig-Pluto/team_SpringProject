<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS 메인 달력 부분</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
		window.onload = function () {

			let date = new Date();

			$("input[name=previousMonth]").click(function () { // 이전달
				$(".calendar > tbody > td").remove();
				$(".calendar > tbody > tr").remove();
				date = new Date(date.getFullYear(), date.getMonth() - 1, date.getDate());
				days();
				selectDate();
			})

			$("input[name=followingMonth]").click(function () { //다음달
				$(".calendar > tbody > td").remove();
				$(".calendar > tbody > tr").remove();
				date = new Date(date.getFullYear(), date.getMonth() + 1, date.getDate());
				days();
				selectDate();


			})


			function days() {

				let showUpYear = date.getFullYear();
				let showUpMonth = date.getMonth();
				let showUpmonthEng = date.toLocaleString('en-US', { month: 'long' })

				let firstDate = new Date(showUpYear, showUpMonth, 1).getDate();
				let firstDay = new Date(showUpYear, showUpMonth, 1).getDay(); //1st의 요일
				let lastDate = new Date(showUpYear, showUpMonth + 1, 0).getDate();


				$(".monthENG").text(showUpmonthEng) + "월";


				if ((showUpYear % 4 === 0 && showUpYear % 100 !== 0) || showUpYear % 400 === 0) { //윤년 적용
					lastDate[1] = 29;
				}

				$(".year_month").text(showUpYear + "년 " + (showUpMonth + 1) + "월 ");


				for (i = 0; i < firstDay; i++) { //첫번째 줄 빈칸
					$(".calendar tbody").append("<td></td>");
				}
				for (i = 1; i <= lastDate; i++) { // 날짜 채우기
					plusDate = new Date(showUpYear, showUpMonth, i).getDay();
					if (plusDate == 0) {
						$(".calendar tbody").append("<tr></tr>");
					}
					$(".calendar tbody").append("<td class='date'><div>" + i + "</div><div class='aaa' id='data_" + i + "'>" + "</div></td>");
				}
				if ($(".calendar > tbody > td").length % 7 != 0) { //마지막 줄 빈칸
					for (i = 1; i <= $(".calendar > tbody > td").length % 7; i++) {
						$(".calendar tbody").append("<td></td>");
					}
				}
				$(".date").each(function (e) { // 오늘 날짜 표시
					if (showUpYear == date.getFullYear() && showUpMonth == date.getMonth() && $(".date").eq(e).text() == date.getDate()) {
						$(".date").eq(e).addClass('Today');
					}
				})



			}
			days();


// 			            document.querySelector(".headerloginout").addEventListener("click", function(e) {
// 			                e.preventDefault();
// 			                setTimeout(()=>{
// 			                if (confirm("로그아웃 하시겠습니까?")) {
// 			                   location.href = e.target.getAttribute("href");
// 			                } else {
// 			                }
// 			                }, 10);
// 			             })

			selectDate();



		}



		function selectDate() {

			let clickDateBlank = document.querySelectorAll(".date");

			for (let i = 0; i < clickDateBlank.length; i++) {
				clickDateBlank[i].addEventListener("click", function (e) {

					let attt = document.querySelector(".year_month").innerHTML;


					let a222 = clickDateBlank[i].firstElementChild.innerHTML;

					console.log("a222:::" + a222);


					let showPopUp = document.querySelector(".schedule_Popup");
					document.querySelector(".schedule_Popup #target").value = a222;
					showPopUp.style.display = 'block';

					//가져오려는 날짜를 변수로 지정

					let showinCalDate = attt + a222 + "일";


					//날짜를 가져옴
					let showDateInSchd = document.querySelector(".schedule_Popup_date").innerText = showinCalDate;





					let close_btn = document.querySelector(".schedule_Popup_close");
		
					close_btn.addEventListener("click", function (evt) {
						showPopUp.style.display = 'none';
		
					});
				})

				
			}
			
		
			let showPopUp = document.querySelector(".schedule_Popup");
			
			let chk_btn = document.querySelector(".schedule_Popup_chk");
			
			chk_btn.addEventListener("click", function (evt) {
				
				let targer_dy = document.querySelector(".schedule_Popup #target").value;
				let word = document.querySelector(".schedule_Popup_title").value;
				
				console.log("chk_btn.addEventListener(click) 의 word : " + word);
				document.querySelector("#data_" + (targer_dy) + "").innerHTML = word;
				
				showPopUp.style.display = 'none';


			});
	

				


		}




	</script>
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
	/* 배경색상 */
	background-color: rgb(112, 145, 133);
	z-index: 2;
}

/* .calendarLeft {
            width: 500px;
            height: 700px;
            margin-left: 110px;
            margin-top: 95px;
            border: 3px solid black;
            border-right: 1.5px solid black;
            border-top: 0px;
            border-bottom: 0px;
            display: inline-block;
        }

        .calendarRight {
            width: 500px;
            height: 700px;
            margin-top: 95px;
            border: 3px solid black;
            border-left: 1.5px solid black;
            border-top: 0px;
            border-bottom: 0px;

            display: inline-block;
        } */

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
	/* 배경색상 */
	background-color: rgb(112, 145, 133);
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
	/* 배경색상 */
	background-color: rgb(112, 145, 133);
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

/* //////////////////////////달력구간/////////////////////////////////// */
table {
	margin-left: 3px;
	border-top-right-radius: 50px;
}

.topCircle {
	width: 300px;
	height: 40px;
	border-radius: 50px 50px 0px 0px;
	text-align: center;
	border: 1px solid white;
	margin-left: 3px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.monthENG {
	font-size: 25px;
	font-style: italic;
	transform: skewX(-20deg);
	color: white;
}

.calendar {
	width: 1000px;
	height: 660px;
	color: white;
}

th {
	width: 50px;
	border-radius: 10px;
	border: 1px solid white;
}

td {
	vertical-align: top;
	padding-top: 5px;
	border-radius: 20px;
	font-weight: bold;
	border: 1px solid white;
}

.aaa {
			height: 55px;
		}

input {
	border: none;
	width: 60px;
	height: 25px;
	background-color: rgba(255, 255, 255, 0.404);
	border-radius: 10px;
	color: white;
	border: none;
}

.Today {
	background-color: rgb(218, 243, 217);
	color: rgb(47, 96, 143);
	border: 1px solid rgb(21, 63, 97);
	border-radius: 10px;
}

#goalW {
	width: 300px;
	margin-left: 250px;
	color: white;
}

#goal {
	width: 120px;
	height: 40px;
	margin-bottom: 10px;
	font-size: 20px;
	border: 1px solid white;
}

#day {
	border-radius: 50px;
}

#t {
	width: 50px;
	background-color: rgb(162, 197, 184);
}

.todo_month {
	border: 1px solid white;
	width: 180px;
	height: 550px;
	position: absolute;
	top: 144px;
	left: 814px;
	border-radius: 10px;
	color: white;
	margin-left: 4px;
}

#tmc {
	width: 20px;
}

#tmt {
	border: 1px solid white;
	vertical-align: top;
	margin-top: 4px;
	margin-left: 10px;
	width: 130px;
	height: 20px;
}

#a {
	width: 20px;
	height: 20px;
	border: 1px solid white;
	color: black;
	margin-top: 6px
}

.m_do {
	text-align: center;
	font-weight: bold;
}

#btnM {
	color: white;
	background-color: rgb(112, 145, 133);
}

                footer{
        }
        .footer_all{
            width: 1240px;
            height:200px;
            /* border: 1px solid red; */
            position: absolute;
            top: 1080px;
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
        .right{
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
            position: absolute;
            left: 400px; top: 20px;
            font-style: italic;
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
        	width: 60px;
			height: 27px;
			position: absolute;
			font-size: 12px;
			font-weight: bold;
			font-style: italic;
			text-align: center;
			padding-top: 10px;
			color: rgba(104, 100, 100, 0.692);
			text-decoration: none;
        
        

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
        
        /* 스케줄 팝업창 추가 삭제 수정  */

		.schedule_Popup {
			width: 400px;
			height: 500px;
			border: 1px solid black;
			background-color: #c2e5c4e7;
			position: absolute;
			left: 400px;
			top: 240px;
			border-radius: 10px;
			z-index: 2;
			display: none;
		}

		.schedule_Popup_close {
			width: 20px;
			height: 20px;
			margin-left: 374px;
			border: none;
			border-radius: 5px;
			background-color: rgba(255, 255, 255, 0.603);
		}

		.schedule_Popup_top {
			margin-top: 30px;
			text-align: center;
			font-style: italic;
			font-size: 20px;
		}

		.schedule_Popup_title {
			width: 360px;
			margin-top: 40px;
			margin-left: 16px;
			color: green;
		}

		.schedule_Popup_content {
			width: 360px;
			margin-top: 20px;
			margin-left: 16px;
			height: 100px;
			color: green;

		}

		.schedule_Popup_date {
			margin-top: 20px;
			margin-left: 140px;
			width: 140px;
			height: 20px;
			font-weight: bold;
		}

		.schedule_Popup_chk {
			border: 0px solid black;
			width: 60px;
			margin-top: 130px;
			margin-left: 160px;
			height: 30px;
			border-radius: 10px;
		}
        
</style>
</head>
<body>
<body>
	<form name="frmMember" method="post" action="">
		
		<main>
			<section>
				<article>
					<div class="area_wrapper">
						<!-- 안에 페이지 넣는 공간 -->
						<div class="calendarWhole">

							<div class="topCircle">
								<div class="monthENG"></div>
							</div>
							<table class="calendar">
								<thead>
									<tr>
										<th colspan="7"
											style="height: 60px; background-color: rgb(112, 145, 133)">
											<div id="goalW">오늘의 목표</div> 
											<c:forEach var="goalList" items="${ goalList }">
											<span>${goalList.goal_set}</span>
											</c:forEach>
<!-- 											<input type="hidden" name="command" value="id"> -->
<!-- 											<input type="hidden" name="sessionId"> -->
<%-- 											<%HttpSession userInfo = request.getSession(); --%>
<%-- 											String sessionId = "" + userInfo.getAttribute("logOn.id"); %> --%>
											
											
<!--  											<input type="hidden" name="sessionId"> -->

											
											
<!-- 											<input id="goal" type="text" -->
<!-- 											name="goal_set" placeholder="이달의 목표를 설정하세요.  50자 내외"> -->
											
											
											<%
// 	        					SetInputDAO dao = new SetInputDAO();

// 	       						SetInputVO goalList2 = dao.listGoal2(sessionId);
//  	        					for(int i =0; i<goalList.size(); i++){
 	        						
	        					
//   	        					SetInputVO vo = new SetInputVO();
// 	        					int goal_Num = goalList2.getGoal_Num();
// 	        					String goal = goalList2.getGoal_set();
// 	        					String sessionId = vo.getGoal_set();
	        					
	        						        					
	        				%> 
	        				
	        				
	        				
	        				<input type="submit" value="삭제"> 
	        				<input	type="hidden" name="command" value="delGoal"> 
<%-- 	        				<input type="hidden" name="del_goal_Num" value="${goalList.goal } "> --%>

											<% 
// 	        					}
	            			%>

										</th>

										<th colspan="2" class="year_month"
											style="border-top-right-radius: 50px;">
									</tr>
									<tr>
										<th id="day">SUN / 일</th>
										<th id="day">MON / 월</th>
										<th id="day">TUE / 화</th>
										<th id="day">WED / 수</th>
										<th id="day">THU / 목</th>
										<th id="day">FRI / 금</th>
										<th id="day">SAT / 토</th>

										<th style="border-radius: 50px;"><input id="btnM"
											name="previousMonth" type="button" value="< 이전달"></th>
										<th style="border-radius: 50px;"><input id="btnM"
											name="followingMonth" type="button" value="다음달 >"></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
	</form>

	<form action="" method=post>
		<div class="todo_month">
			<div class="m_do">이번달 할일</div>
			
											
	
			
			<input id="tmt" type="text" name="todo_txt"> 
			<input id="a" type="button" value="+"> 

		</div>

	</form>
	</div>
	<div class="calendarLeft"></div>
	<div class="calendarRight"></div>

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
	 <a href='/syl/diaryList'><div class="post1 It2">Diary</div></a>
            <a href='/syl/Hanu/Diet_diary_EL_View'><div class="post1 It3">Diet</div></a>
            <a href='syl/mainwish'><div class="post1 It5">Wish</div></a>
	
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


	<form action="/syl/calendarMA_date" method="post">

		<!-- 일정 추가, 수정 및 삭제 팝업 -->
			<div class="schedule_Popup">
				<button type="button" class="schedule_Popup_close">x</button>
				<div class="schedule_Popup_top">여행자의 여정</div>
				<input type="text" class="schedule_Popup_title" name="calendarM_Title" placeholder="당신의 여정을 등록하세요."> 
				<input type="text" class="schedule_Popup_content" name="calendarM_Txt" placeholder=" 당신의 여정에 필요한 사항을 입력해주세요.">
				<div class="schedule_Popup_date"></div>
				<input type="hidden" id="target" name="calendarM_time">
				
				<c:forEach var="calendarM_list" items="${ calendarM_list }">
				<span>${calendarM_list.calendarM_time}</span>
				</c:forEach>
				${calendarM_time}
				<fmt:formatDate value="${calendarM_list.calendarM_time}" pattern="YYYY-MM-dd"/>
				
				<button type="submit" class="schedule_Popup_chk">확인</button>
				<!-- <button type="submit" class="schedule_Popup_del"> 삭제 </button> -->
		
			</div>

	</form>

	</div>
	</article>
	</section>
	</main>
	
	
	
	
</body>
</html>