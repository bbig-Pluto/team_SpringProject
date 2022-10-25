<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 날짜 가져오려고 import -->
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:useBean id="menudao" class="Diet_diary_01.Diet_diary_Menu_DAO" /> --%>
<%-- <jsp:useBean id="dto" class="Diet_diary_01.DietDTO" /> --%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
<% HttpSession logOnSession = request.getSession(); %>

<!-- 오늘의 날짜와 어떤 날짜를 가져올지에 대한 제약조건 -->
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat(" MM월 dd일 ");
%>

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title> 식단일지 </title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
<script type="text/javascript">
	window.onload = function() {
		
		// 마이페이지 js
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
		
		
		<%HttpSession userInfo = request.getSession(); // 세션 가져와서
		String isLogon = "guest";

		if (userInfo.isNew()) { // 세션도 없고 로그인도 없이 직접 주소창에 들어온 Case, 세션을 여기서 생성하고, 달력페이지로 튕겨냄
			userInfo.setAttribute("isLogon", "guest");
			response.sendRedirect("/syl/calendarM"); // 세션 없고, 로그인 없이 들어오면 캘린더로 보냄
		} else if (userInfo.getAttribute("logOn.id") == null) { // 세션은 만들었는데, 로그인은 안 한 케이스
			isLogon = "guest";
		} else { // 세션도 만들었고, 로그인도 하고 들어온 Case
			isLogon = "member";
		}%>


		// 수정 버튼 눌렀을 때
		document.querySelector(".table_class_diet_reset").addEventListener("click",function(e) {
		// e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			// e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면
			// lnbody_table_name.submit();
			insert_bind()
		<%}%>
		})



		function insert_bind() {

		// 수정버튼
		let reset = document.querySelector(".table_class_diet_reset");
		// 수정취소버튼
		let cancel = document.querySelector(".table_class_diet_cancel");
		// 제출버튼
		let update = document.querySelector(".table_class_diet_update");

		// 기존에 value에 있고 누르면 none이 될
		let set_menu = document.querySelector(".set_menu");
		let set_calorie = document.querySelector(".set_calorie");
		let set_sum = document.querySelector(".set_sum");

		// 기존에 숨겨놓고 누르면 block이 될
		let set_menu_2 = document.querySelector(".set_menu_2");
		let set_calorie_2 = document.querySelector(".set_calorie_2");
		let set_sum_2 = document.querySelector(".set_sum_2");

		// 수정 버튼을 누르면
			// 가려진 값이 보임
			set_menu_2.style.display = "block"
			set_calorie_2.style.display = "block"
			set_sum_2.style.display = "block"
			cancel.style.display = "block"
			update.style.display = "block"

			// 보여진 값이 가려짐
			set_menu.style.display = "none"
			set_calorie.style.display = "none"
			set_sum.style.display = "none"
			reset.style.display = "none"

		// 수정 취소 버튼을 누르면
		cancel.addEventListener("click", function() {
			// 가려진 값이 보임
			set_menu_2.style.display = "none"
			set_calorie_2.style.display = "none"
			set_sum_2.style.display = "none"
			cancel.style.display = "none"
			update.style.display = "none"

			// 보여진 값이 가려짐
			set_menu.style.display = "block"
			set_calorie.style.display = "block"
			set_sum.style.display = "block"
			reset.style.display = "block"

		})

	}

	// 오늘의 아침 메뉴
	
	
	document.querySelector(".table_class_diet_update").addEventListener("click", function(e){
		console.log("수정제출 클릭 이벤트 진입 : ");
	



		let set_menu_2_value = document.querySelector(".set_menu_2").value;
		let set_calorie_2_value = document.querySelector(".set_calorie_2").value;
		let set_sum_2_value = document.querySelector(".set_sum_2").value;



		let str = document.querySelector(".set_menu_2").value;
        
        // 한글,영어,숫자,특수문자 구분 정규식 모음
        var check_num = /[0-9]/;    // 숫자 
        var check_eng = /[a-zA-Z]/;    // 문자 
        var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
        var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

        // test() 함수를 이용하면 boolen 값을 얻을 수 있다.
        check_num.test(str); //숫자 return 값 true / false
        check_eng.test(str); //영문 return 값 true / false
        check_spc.test(str); //특수 return 값 true / false
        check_kor.test(str); //한글 return 값 true / false

		
		let str2 = document.querySelector(".set_calorie_2").value;

		// 숫자 제한
		check_num.test(str2); //숫자 return 값 true / false
        check_eng.test(str2); //영문 return 값 true / false
        check_spc.test(str2); //특수 return 값 true / false
        check_kor.test(str2); //한글 return 값 true / false

		
		let str3 = document.querySelector(".set_sum_2").value;

		// 숫자 제한2
		check_num.test(str3); //숫자 return 값 true / false
        check_eng.test(str3); //영문 return 값 true / false
        check_spc.test(str3); //특수 return 값 true / false
        check_kor.test(str3); //한글 return 값 true / false


		// null이 아니고 공백이 아니면
		if(
			set_menu_2_value != null && set_menu_2_value.trim() &&
			set_calorie_2_value != null && set_calorie_2_value.trim() &&
			set_sum_2_value != null && set_sum_2_value.trim()
		){
			// 위의 조건을 충족하면 정규표현식의 if로 이동
			// 메뉴가 한글일 경우
			// 칼로리가 숫자일 경우
			// 칼로리 총합이 숫자일 경우
			if(check_kor.test(str) && !check_num.test(str) && !check_eng.test(str) && !check_spc.test(str) &&
  			  !check_kor.test(str2) && check_num.test(str2) && !check_eng.test(str2) && !check_spc.test(str2) &&
			  !check_kor.test(str3) && check_num.test(str3) && !check_eng.test(str3) && !check_spc.test(str3)
			){
				// null이 아니고 공백이 아니며 정규표현식에 적합한 경우
				console.log("if안의 if submit() 직전 ");
				diet_update_2page.submit();
			}else{ // null이 아니고 공백이 아니지만 정규표현식에 적합하지 않은 경우
				e.preventDefault();
				alert("메뉴에는 한글\n칼로리와 총 칼로리에는 숫자만 입력 가능합니다");
			}

			// null이거나 공백인 경우
			}else{
			console.log("else의 alert");
			e.preventDefault();
			alert("값을 입력 후 제출해주세요");
		}
	})




} // window 닫는 괄호
</script>
<style>
.set_menu_2, .set_calorie_2, .set_sum_2, .table_class_diet_cancel {
	display: none;
}

.table_class_diet_cancel {
	display: none;
}

.table_class_diet_update {
	display: none;
}

/* // 위는 자바스크립트에 사용중 지우지 말기*/
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
	background-color: rgb(255, 247, 213);
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
	background-color: rgb(255, 247, 213);
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
	background-color: rgb(255, 247, 213);
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

.post1 {
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

.post2 {
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

/* 지수가 해준 스타일 끝///////////////////////////////////////////////////////////// */

/*         form 안에 테이블들 시작	*/
.tab_accordion_box {
	border-top: 1px solid black;
	width: 1005px;
	height: 700px;
	background-color: rgb(255, 247, 213);
}

.tab_accordion_Contents {
	width: 1000px;
	height: 700px;
	background-color: rgb(255, 247, 213);
}

.tab_accordion_box1 {
	background-color: rgb(241, 198, 15);
	height: 45px;
}

/* 각각 버튼 , 내용 색상*/
#tab_accordion_A, #tab_accordion_A1 {
	background-color: #FFFFCA;
}

#tab_accordion_A {
	border-radius: 20px 20px 0px 0px;
	width: 150px;
	height: 25px;
	background-color: rgb(255, 226, 156);
	position: relative;
	top: 11px;
	z-index: 1;
	border: 0px solid #00000030;
}

#tab_accordion_B {
	border-radius: 20px 20px 0px 0px;
	width: 150px;
	height: 40px;
	background-color: white;
	position: relative;
	top: 5px;
	right: 40px;
	z-index: 2;
	border: 0px solid #00000030;
	font-weight: 600;
	font-size: 16px;
}

.nowtime {
	position: relative;
	width: 302px;
	top: 80px;
	left: 60px;
	/* 	border: 1px solid rgb(204, 204, 204); */
	font-weight: 600;
	font-size: 18px;
}

.page2text {
	position: relative;
	top: 20px;
	right: 100px;
	font-weight: 600;
}

.page2_text_form {
	position: relative;
	top: 20px;
	right: 885px;
	font-weight: 600;
}

.img1_form_text1 {
	position: relative;
	top: 100px;
}

.img2_form_text2 {
	position: relative;
	top: 250px;
	right: 30px;
}

.img3_form_text3 {
	position: relative;
	top: 400px;
	right: 60px;
}

.img1text2 {
	position: relative;
	right: 35px;
	font-weight: 600;
}

.img2text2 {
	position: relative;
	right: 20px;
	font-weight: 600;
}

.img3text2 {
	position: relative;
	right: 5px;
	font-weight: 600;
}

.page2_img1, .page2_img2, .page2_img3 {
	border-radius: 100%;
}

.page2_img1 {
	
}

/* Diet_diary 시작 */
/* Diet_diary 시작 */
/* Diet_diary 시작 */
.Diet_diary_h2 {
	text-align: center;
}

.Diet_diary_type {
	position: relative;
	left: 750px;
	bottom: 50px;
}

.today_menu {
	position: relative;
	top: 10px;
	width: 300px;
	margin-left: 50px;
	position: relative;
	height: 450px;
	border: 3px solid rgb(204, 204, 204);
	bottom: 10px;
	background-color: white;
	padding: 10px;
	border-radius: 2px;
}

.set_menu_2, .set_calorie_2, .set_sum_2 {
	height: 30px;
	width: 100px;
}

.set_sum_2 {
	width: 100px;
}

.button_3 {
	position: relative;
	width: 100px;
	height: 40px;
}

.table_class_diet_reset, .table_class_diet_cancel,
	.table_class_diet_update {
	width: 100px;
	height: 40px;
	cursor: pointer;
	background-color: rgb(52, 152, 219);
	color: white;
	border-radius: 5px;
	font-weight: 600;
	font-size: 17px;
	border: 0px solid rgb(204, 204, 204);
}

.table_class_diet_reset {
	position: relative;
	left: 155px;
	top: 20px;
}

.table_class_diet_cancel {
	position: relative;
	left: 90px;
	color: white;
	top: 20px;
	font-size: 15px;
}

.table_class_diet_update {
	position: relative;
	bottom: 20px;
	left: 215px;
	color: white;
	font-size: 15px;
}

.into_box {
	position: relative;
	height: 500px;
	bottom: 500px;
	left: 400px;
	border: 2px solid rgb(204, 204, 204);
	background-color: white;
	width: 520px;
	padding-left: 30px;
	border-radius: 5px;
}

.table_All {
	position: relative;
	left: 80px;
	padding: 10px;
	margin-bottom: 15px;
	border: 2px solid rgb(204, 204, 204);
	border-radius: 2px;
	/* 		background-color: #fff8e8; */
	background-color: white;
}

.page2_form_img1 {
	position: relative;
	right: 750px;
	top: 100px;
	border-radius: 100%;
}

.page2_form_img2 {
	position: relative;
	right: 795px;
	top: 250px;
	border-radius: 100%;
}

.page2_form_img3 {
	position: relative;
	right: 840px;
	top: 400px;
	border-radius: 100%;
}

.into_box_text {
	width: 70px;
	height: 50px;
}

.delete_button {
	position: relative;
	bottom: 50px;
	left: 420px;
	width: 70px;
	height: 30px;
	border-radius: 2px;
	background-color: rgb(123, 135, 149);
	color: white;
	cursor: pointer;
	font-size: 15px;
}


/* 마이페이지 */
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
</head>

<body>
	<header>
         <div class="wrapper">
            <h1>
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
		                  <a href="/syl/member/login" class="headerlogin">로그인</a>
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
						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->


						<!-- 탭 tab accordion -->
						<div class="tab_accordion_box">
							<div class="tab_accordion_box1">
								<a href='${ contextPath }/diet_1page.do'><button
										id="tab_accordion_A" class="tab_accordion_tab">식단 일지</button></a>
								<button id="tab_accordion_B" class="tab_accordion_tab">식단
									조회</button>

							</div>

							<!-- 내용물 -->
							<div class="tab_accordion_box2">
								<div id="tab_accordion_A1" class="tab_accordion_content">
									<div class="tab_accordion_Contents">
										<span class="nowtime"> 오늘의 날짜 : <%=sf.format(nowTime)%>
										</span>
										<h2 class="Diet_diary_h2">오늘 먹은 음식</h2>
										<div class="Diet_diary_type">
											<img src="/syl/resources/lhj/lhjimg/morning.png" width="40px"
												height="35px" class="page2_img1"> <img
												src="/syl/resources/lhj/lhjimg/lunch.png" width="40px" height="35px"
												class="page2_img2"> <img
												src="/syl/resources/lhj/lhjimg/dinner.png" width="40px" height="35px"
												class="page2_img3"> <span class="page2text"><span
												class="img1text2">아침</span><span class="img2text2">점심</span><span
												class="img3text2">저녁</span></span>
										</div>


										<form action="${contextPath}/diet_update_2page.do" name = "diet_update_2page"
											method="post">
											<table class="today_menu">
												<thead>
													<tr>
														<th colspan="2">오늘의 아침</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>오늘의 아침 메뉴 <br> <span class="set_menu">${diet_list_Last.diet_diary_menu}</span>
															<input value=" ${diet_list_Last.diet_diary_menu}"
															class="set_menu_2" name="diet_diary_menu">
														</td>
														<td>칼로리 <br> <span class="set_calorie">
																${diet_list_Last.diet_diary_menu_calorie} kcal</span> <input
															value=" ${diet_list_Last.diet_diary_menu_calorie}"
															class="set_calorie_2" name="diet_diary_menu_calorie">
														</td>
													</tr>
													<tr>
														<td>아침 총 칼로리</td>
														<td><span class="set_sum">
																${diet_list_Last.diet_diary_menu_sum} kcal</span> <input
															value=" ${diet_list_Last.diet_diary_menu_sum}"
															class="set_sum_2" name="diet_diary_menu_sum"></td>
													</tr>
													<tr>
													</tr>
												</tbody>
												<%-- <%=request.getAttribute("menukey") %>
																				--%>
											</table>
											<div class="button_3">
												<input type="button" value="수정"
													class="table_class_diet_reset"> <input
													type="button" value="수정취소" class="table_class_diet_cancel">
												<input type="submit" value="수정제출"
													class="table_class_diet_update">
											</div>
										</form>

										<%-- <strong>${listDiet_diary.Diet_diary_type
																		}</strong><br> --%>
										<%-- </c:when> --%>









										<!-- 내가 생성한 테이블  -->
										<div class="into_box">
											<div class="Diet_diary_type">
												<img src="/syl/resources/lhj/lhjimg/morning.png" width="40px"
													height="35px" class="page2_form_img1"> <img
													src="/syl/resources/lhj/lhjimg/lunch.png" width="40px" height="35px"
													class="page2_form_img2"> <img
													src="/syl/resources/lhj/lhjimg/dinner.png" width="40px" height="35px"
													class="page2_form_img3"> <span
													class="page2_text_form"> <span
													class="img1_form_text1">아침</span> <span
													class="img2_form_text2">점심</span><span
													class="img3_form_text3">저녁</span></span>
											</div>


											<c:forEach var="menu" items="${listDiet_diary_menu}"
												varStatus="varcount">
												<form action="${contextPath}/diet_delete_2page.do"
													method="post" name="form_name_delete_button">
													<table class="table_All">
														<thead></thead>
														<tr>

															<div class="page2_into_box">
																<td class="into_box_text">${varcount.count
																										}.</td>
																<br>
																<td class="into_box_text">메뉴 <br>${menu.diet_diary_menu}
																	<input type="hidden" name="diet_diary_menu">
																</td>

																<td class="into_box_text">칼로리<br>${menu.diet_diary_menu_calorie}
																	kcal <input type="hidden"
																	name="diet_diary_menu_calorie">
																</td>

																<td class="into_box_text">총 칼로리<br>${menu.diet_diary_menu_sum}
																	kcal<input type="hidden" name="diet_diary_menu_sum">
																</td>
																<%-- <% List
																										listDiet_diary_menu=menudao.listDiet_diary_menu(dto);
																										%> --%>
																<%-- <% for (int
																											i=0; i <
																											listDiet_diary_menu.size();
																											i++) { %>
																											--%>

																<%-- <%}%>
																												--%>
															</div>
														</tr>
													</table>
													<input type="submit" name="delete_button_name" value="삭제"
														class="delete_button"> <input type="hidden"
														name="seq_diet_diary_menu"
														value="${menu.seq_diet_diary_menu}">
												</form>
											</c:forEach>
										</div>
									</div>
									<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간 끝!!!!!!!!!!!!!!!! -->
								</div>
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
						<!--  여기 Index에 이동 a링크 구성하기 -->
						<a href='${ Path }/syl/todo'>
						<div class="postTodo It1">todo<br>memo</div>
						</a>
						
						<a href='${ contextPath }/diaryList'>
						<div class="post1 It2">Diary</div>
						</a>
						
						<a href='${ contextPath }/diet_1page.do'>
						<div class="post1 It3">Diet</div>
						</a>
						

						<a href='${ contextPath }/mainwish'>
						<div class="post1 It5">Wish</div>
						</a>
					</div>
					<div class="rightLine2">
<!-- 						<div class="post2 It1"></div> -->
						<a href='${ contextPath }/ec_list.do'>
						<div class="post2 It4">Exercise</div>
						</a>
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
				<img class="left_logo1" src="/syl/resources/photo/logo2.png"> <img
					class="left_logo2" src="/syl/resources/photo/3syl2.png">
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