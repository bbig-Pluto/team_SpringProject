<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 날짜 가져오려고 import -->
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%-- 이게 있어서 c를 사용할 수 있게 된다 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
<% HttpSession logOnSession = request.getSession(); %>
<!-- 오늘의 날짜와 어떤 날짜를 가져올지에 대한 제약조건 -->
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat(" MM월 dd일 ");
%>

<!-- 한글 깨지지 않게 -->
<%
request.setCharacterEncoding("UTF-8");
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 식단일지 </title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">

<script>
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
		
		
		
		
		// 	let guestbutton1= document.querySelector(".form_button1");
		// 	let guestbutton2= document.querySelector(".form_button2");
		// 	let guestbutton3= document.querySelector(".form_button3");
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



// 추가를 눌렀을때
let add_button= document.querySelectorAll(".form_button1");
for(let i=0; i<add_button.length; i++){
add_button[i].addEventListener("click", function(e) {
console.log("add_button[i]", add_button[i]);
	e.preventDefault();
	<%if (!(isLogon.equals("member"))) {%>
		e.preventDefault();
		alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
	<%} else {%>	// 맞는 세션으로 들어오고 id도 있는 정상적인 회원이면







		// 해야할 것 : e.target(버튼) 기준으로 tbody 안의 value를 가져올 것 (form까지 갈 필요없음 name은 tbody안에 있으니까)
		// 방법 : e.target(버튼) parentNode 사용해서 tbody를 잡고
		// 		  아래 얘네들이 document가 아닌 위에서 지정한 tbody 안의 (".Diet_diary_box6_input_menu")value를 읽어야 함
		// 메뉴, 칼로리, 총합 가져옴 (null과 trim을 체크할 예정)
		
		// 클릭한 버튼의 tbody 잡아옴
		let parent_tbody = add_button[i].parentNode.parentNode.parentNode;
		console.log("parent_tbody", parent_tbody);


		let menu_1 = parent_tbody.querySelector(".Diet_diary_box6_input_menu").value;
		console.log(" tbody_menu_1 : ", menu_1);
		let calorie_1 = parent_tbody.querySelector(".Diet_diary_box6_input_calorie").value;
		console.log(" tbody_menu_1 : ", calorie_1);
		let sum_1 = parent_tbody.querySelector(".Diet_diary_box6_input_sum").value;
		console.log(" tbody_menu_1 : ", sum_1);
		//		  









		// 정규표현식 test 함수안에 넣을 예정
		
		// 한글,영어,숫자,특수문자 구분 정규식 모음
        var check_num = /[0-9]/;    // 숫자 
        var check_eng = /[a-zA-Z]/;    // 문자 
        var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
        var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		
        // test() 함수를 이용하면 boolen 값을 얻을 수 있다.
		let str = parent_tbody.querySelector(".Diet_diary_box6_input_menu").value;
		console.log("str1 : ", str);
        // 한글 제한
		check_num.test(str); //숫자 return 값 true / false
        check_eng.test(str); //영문 return 값 true / false
        check_spc.test(str); //특수 return 값 true / false
        check_kor.test(str); //한글 return 값 true / false

		let str2 = parent_tbody.querySelector(".Diet_diary_box6_input_calorie").value;
		console.log("str2 : ", str2);
		// 숫자 제한
		check_num.test(str2); //숫자 return 값 true / false
        check_eng.test(str2); //영문 return 값 true / false
        check_spc.test(str2); //특수 return 값 true / false
        check_kor.test(str2); //한글 return 값 true / false

		let str3 = parent_tbody.querySelector(".Diet_diary_box6_input_sum").value;
		console.log("str3 : ", str3);
		// 숫자 제한2
		check_num.test(str3); //숫자 return 값 true / false
        check_eng.test(str3); //영문 return 값 true / false
        check_spc.test(str3); //특수 return 값 true / false
        check_kor.test(str3); //한글 return 값 true / false

			// null이 아니고 공백이 아니면
		if(menu_1 != null && menu_1.trim() &&
		   calorie_1 != null && calorie_1.trim() &&
		   sum_1 != null && sum_1.trim()
		){
			// 위의 조건식 일치하면 여기 if를 실행
			if(check_kor.test(str) && !check_num.test(str) && !check_eng.test(str) && !check_spc.test(str) &&
			  !check_kor.test(str2) && check_num.test(str2) && !check_eng.test(str2) && !check_spc.test(str2) &&
			  !check_kor.test(str3) && check_num.test(str3) && !check_eng.test(str3) && !check_spc.test(str3)
			){
				// 정규표현식 확인완료 적합 > sumbit 실행
				console.log("if 안의 if 정규표현식 적합");


				// 해야할 것 : form을 가져와서 submit() 시켜야 함
				// 방법 : e.target.버튼[i] parentNode 사용해서 가져오고 submit();
				// 참고 : name을 가져올 필요가 없다고 함 form을 가져오니까
				let dgdgdddd = add_button[i].parentNode.parentNode.parentNode.parentNode.parentNode.submit();
				console.log("되는건가? : ", add_button[i].parentNode.parentNode.parentNode.parentNode.parentNode.submit());
				console.log("되는건가2? : ", dgdgdddd);


			}else{
				// null이 아니고 공백도 아니지만 정규표현식에 적합하지 않은 경우 
				console.log("if 안의 else 정규표현식에 부적합");
				e.preventDefault();
				alert("메뉴에는 한글\n칼로리와 총 칼로리에는 숫자만 입력 가능합니다");
			}

		}else{
			console.log("else의 alert");
			e.preventDefault();
			alert("값을 입력 후 제출해주세요");
		}
		
	<%}%>




})


}





// 	document.querySelector(".form_button2").addEventListener("click",
// 				function(e) {
// 					e.preventDefault();
// <%if (!(isLogon.equals("member"))) {%>
// 	e.preventDefault();
// 					alert("로그인이 필요합니다");
// <%} else {%>
// 	form_name_button_2.submit();
// <%}%>
// 	})

// 	document.querySelector(".form_button3").addEventListener("click",
// 				function(e) {
// 					e.preventDefault();
// <%if (!(isLogon.equals("member"))) {%>
// 	e.preventDefault();
// 					alert("로그인이 필요합니다");
// <%} else {%>
// 	form_name_button_3.submit();
// <%}%>
// 	})


// 값이 없을때 click한 경우
// 한글과 숫자가 적합하지 않을때 click한 경우


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
	left: -16px;
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
/* tab_accordion 시작 */
/* tab_accordion 시작 */

/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
/* tab_accordion 시작 */
.tab_accordion_box {
	border-top: 1px solid black;
	/*             position: relative; */
	/*             top: 150px; */
	width: 1000px;
	height: 700px;
	/*             left: 350px; */
	background-color: rgb(255, 247, 213);
}

/* 버튼 전부에 대한 */
.tab_accordion_tab {
	cursor: pointer;
	color: black;
	border: 0px solid #00000030;
}

/* 안에 내용 안 보이게 (주석 처리한 것만 보임)*/
/* #tab_accordion_A1, */
#tab_accordion_B1, #tab_accordion_C1, #tab_accordion_D1,
	#tab_accordion_E1, #tab_accordion_F1, #tab_accordion_G1,
	#tab_accordion_H1 {
	display: none;
}

.tab_accordion_Contents {
	position: relative;
	width: 1000px;
	height: 750px;
	background-color: rgb(255, 247, 213);
}

.tab_accordion_box1 {
	background-color: rgb(241, 198, 15);
	height: 45px;
	width: 1005px;
}

/* 각각 버튼 , 내용 색상*/
/*         #tab_accordion_A:hover { */
/*             background-color: rgb(255, 249, 220); */
/*         } */
#tab_accordion_A, #tab_accordion_A1 {
	background-color: #FFFFCA;
}

#tab_accordion_A {
	border-radius: 20px 20px 0px 0px;
	width: 150px;
	height: 40px;
	background-color: white;
	position: relative;
	top: 5px;
	z-index: 2;
	font-weight: 600;
	font-size: 16px;
}

#tab_accordion_B {
	border-radius: 20px 20px 0px 0px;
	width: 150px;
	height: 25px;
	background-color: rgb(255, 226, 156);
	position: relative;
	top: 11px;
	right: 40px;
	z-index: 1;
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

/*         #tab_accordion_B:hover { */
/*             background-color: #ffa56a; */
/*         } */

/*         #tab_accordion_B, */
/*         #tab_accordion_B1 { */
/*             background-color: #FFCCAA; */
/*         } */

/*         #tab_accordion_B { */
/*             border-radius: 20px 20px 0px 0px; */
/*             width: 150px; */
/*             height: 25px; */
/*             background-color: rgb(255, 226, 156); */
/*             position: relative; */
/*             top: 15px; */
/*             right: 7px; */
/*         } */

/*         #tab_accordion_C:hover { */
/*             background-color: #ffff5a; */
/*         } */

/*         #tab_accordion_C, */
/*         #tab_accordion_C1 { */
/*             background-color: #FFFFCA; */
/*         } */

/*         #tab_accordion_D:hover { */
/*             background-color: #76d045; */
/*         } */

/*         #tab_accordion_D, */
/*         #tab_accordion_D1 { */
/*             background-color: #DCEDCA; */
/*         } */

/*         #tab_accordion_E:hover { */
/*             background-color: #68d7dd; */
/*         } */

/*         #tab_accordion_E, */
/*         #tab_accordion_E1 { */
/*             background-color: #c2e3e5; */
/*         } */

/*         #tab_accordion_F:hover { */
/*             background-color: #649be8; */
/*         } */

/*         #tab_accordion_F, */
/*         #tab_accordion_F1 { */
/*             background-color: #bed6f8; */
/*         } */

/*         #tab_accordion_G:hover { */
/*             background-color: #707cea; */
/*         } */

/*         #tab_accordion_G, */
/*         #tab_accordion_G1 { */
/*             background-color: #c7cbef; */
/*         } */

/*         #tab_accordion_H:hover { */
/*             background-color: #a480e7; */
/*         } */

/*         #tab_accordion_H, */
/*         #tab_accordion_H1 { */
/*             background-color: #d8cbf1; */
/*         } */

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

.Diet_diary_box {
	height: 500px;
	width: 900px;
	margin: auto;
}

.Diet_diary_box2 {
	height: 500px;
	background-color: white;
	border: 3px solid rgb(204, 204, 204);
	border-radius: 2px;
}

.Diet_diary_box3 {
	height: 360px;
	float: left;
}

.Diet_diary_box4 {
	position: relative;
	height: 100px;
	float: left;
	left: 300px;
	bottom: 500px;
}

.Diet_diary_box5 {
	position: relative;
	height: 100px;
	float: left;
	left: 300px;
	bottom: 500px;
}

.Diet_diary_box6 {
	border-Right: 2px solid rgb(204, 204, 204);
}

.Diet_diary_box6, .Diet_diary_box6-2, .Diet_diary_box6-3 {
	position: relative;
	width: 302px;
	height: 500px;
	padding: 5px;
}

.Diet_diary_box6-2 {
	
}

.Diet_diary_box6-3 {
	border-left: 2px solid rgb(204, 204, 204);
}

.Diet_diary_box7 {
	width: 298px;
	height: 500px;
}

.Diet_diary_box8 {
	width: 298px;
	height: 500px;
}

.Diet_diary_box6_input {
	width: 136px;
}

/*         첫번째 form의 디테일 */
.form_menu {
	position: relative;
	top: 0px;
}

.form_calorie {
	position: relative;
	bottom: 0px;
}

.Diet_diary_box6_input_menu {
	position: relative;
	bottom: 10px;
	width: 130px;
	height: 35px;
	border-radius: 7px;
	border: 1px solid rgb(204, 204, 204);
}

.Diet_diary_box6_input_calorie {
	position: relative;
	width: 115px;
	height: 35px;
	top: 1px;
	left: 5px;
	border-radius: 7px;
	border: 1px solid rgb(204, 204, 204);
}

.Diet_diary_top_text {
	position: relative;
	bottom: 30px;
	width: 1px;
	height: 1px;
	left: 90px;
}

.Diet_diary_bottom_text {
	position: relative;
	bottom: 25px;
	width: 1px;
	height: 1px;
	left: 80px;
}

.form_calorie_td {
	position: relative;
	left: 10px;
	top: 50px;
}

.Diet_diary_box6_input_sum {
	position: relative;
	right: 20px;
	width: 125px;
	height: 40px;
	top: 10px;
	border-radius: 7px;
	border: 1px solid rgb(204, 204, 204);
}

.form_sum {
	position: relative;
	top: 50px;
	left: 20px;
}

.form_button1, .form_button2, .form_button3 {
	width: 100px;
	height: 40px;
	position: relative;
	left: 95px;
	cursor: pointer;
	background-color: rgb(52, 152, 219);
	color: white;
	border-radius: 5px;
	font-weight: 600;
	font-size: 17px;
	border: 0px solid #c9c9c9;
}

.img1, .img2, .img3 {
	border-radius: 100%;
}

.img1text {
	position: relative;
	top: 20px;
	right: 135px;
	font-weight: 600;
}

.img2text {
	position: relative;
	top: 20px;
	right: 120px;
	font-weight: 600;
}

.img3text {
	position: relative;
	top: 20px;
	right: 105px;
	font-weight: 600;
}

.img4, .img5, .img6 {
	position: relative;
	top: 10px;
	border-radius: 100%;
}

.todey_menu {
	position: relative;
	bottom: 10px;
	left: 70px;
	font-weight: 600;
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
								<button id="tab_accordion_A" class="tab_accordion_tab">식단
									일지</button>
								<a href='${ contextPath }/diet_2page.do'><button
										id="tab_accordion_B" class="tab_accordion_tab">식단 조회</button></a>
								<!--             <button id="tab_accordion_B" class="tab_accordion_tab">칼로리 그래프</button> -->
								<!--             <button id="tab_accordion_C" class="tab_accordion_tab">C</button> -->
								<!--             <button id="tab_accordion_D" class="tab_accordion_tab">D</button> -->
								<!--             <button id="tab_accordion_E" class="tab_accordion_tab">E</button> -->
								<!--             <button id="tab_accordion_F" class="tab_accordion_tab">F</button> -->
								<!--             <button id="tab_accordion_G" class="tab_accordion_tab">G</button> -->
								<!--             <button id="tab_accordion_H" class="tab_accordion_tab">H</button> -->
							</div>

							<!-- 내용물 -->
							<div class="tab_accordion_box2">
								<div id="tab_accordion_A1" class="tab_accordion_content">
									<div class="tab_accordion_Contents">
										<span class="nowtime"> 오늘의 날짜 : <%=sf.format(nowTime)%></span>
										<h2 class="Diet_diary_h2">오늘 먹은 음식</h2>
										<div class="Diet_diary_type">
											<img src="/syl/resources/lhj/lhjimg/morning.png" width="40px"
												height="35px" class="img1"> <img
												src="/syl/resources/lhj/lhjimg/lunch.png" width="40px" height="35px"
												class="img1"> <img src="/syl/resources/lhj/lhjimg/dinner.png"
												width="40px" height="35px" class="img1"> <span
												class="img1text">아침</span><span class="img2text">점심</span><span
												class="img3text">저녁</span>
										</div>
										<div class="Diet_diary_box">
											<div class="Diet_diary_box2">
												<div class="Diet_diary_box3">
													<form action="${contextPath}/diet_insert.do" name="form_name_button_1" method="post" enctype="utf-8">
														<table class="Diet_diary_box6">
															<thead>
																<tr>
																	<th colspan="2"><img
																		src="/syl/resources/lhj/lhjimg/morning.png" width="40px"
																		height="35px" class="img4"><span
																		class="imgtext1">아침</span> <input type="hidden"
																		name="diet_diary_type" value="아침"></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="form_menu"><span class="todey_menu">오늘의
																			아침 메뉴</span><br> <br> <input type="text"
																		name="diet_diary_menu"
																		class="Diet_diary_box6_input_menu"></td>
																	<td class="form_calorie"><br> <br> <input
																		type="text" name="diet_diary_menu_calorie"
																		class="Diet_diary_box6_input_calorie"> <span
																		class="Diet_diary_top_text">kcal</span></td>
																</tr>
																<tr>
																	<td class="form_calorie_td">아침 총 칼로리는</td>
																	<td class="form_sum"><input type="text"
																		name="diet_diary_menu_sum"
																		class="Diet_diary_box6_input_sum"><span
																		class="Diet_diary_bottom_text">kcal</span></td>
																</tr>
																<tr>
																	<td colspan="2">
																	<input type="submit" value="추가" class="form_button1" id="form_button1"></td>
																</tr>
															</tbody>
														</table>
													</form>
													<span class="Diet_diary_box4"> <span
														class="Diet_diary_box7">
															<form action="${contextPath}/diet_insert.do" name="form_name_button_2" method="post" enctype="utf-8">
																<table class="Diet_diary_box6-2">
																	<thead>
																		<tr>
																			<th colspan="2"><img
																				src="/syl/resources/lhj/lhjimg/lunch.png" width="40px"
																				height="35px" class="img4"> <span
																				class="imgtext2">점심</span> <input type="hidden"
																				name="diet_diary_type" value="점심"></th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td class="form_menu"><span class="todey_menu">오늘의 점심 메뉴</span><br> <br>
																					<input type="text" name="diet_diary_menu" class="Diet_diary_box6_input_menu"></td>
																			<td class="form_calorie"><br> <br>
																			<input type="text" name="diet_diary_menu_calorie" class="Diet_diary_box6_input_calorie">
																			<span class="Diet_diary_top_text">kcal</span></td>
																		</tr>
																		<tr>
																			<td class="form_calorie_td">점심 총 칼로리는</td>
																			<td class="form_sum">
																			<input type="text" name="diet_diary_menu_sum" class="Diet_diary_box6_input_sum"><span
																				class="Diet_diary_bottom_text">kcal</span>
																		</tr>
																		<tr>
																			<td colspan="2">
																			<input type="submit" value="추가" class="form_button1" id="form_button1"></td>
																		</tr>
																	</tbody>
																</table>
															</form>
													</span>
													</span> <span class="Diet_diary_box5"> <span
														class="Diet_diary_box8">

															<form action="${contextPath}/diet_insert.do"
																name="form_name_button_3" method="post" enctype="utf-8">
																<table class="Diet_diary_box6-3">
																	<thead>
																		<tr>
																			<th colspan="2"><img
																				src="/syl/resources/lhj/lhjimg/dinner.png" width="40px"
																				height="35px" class="img4"> <span
																				class="imgtext3">저녁</span> <input type="hidden"
																				name="diet_diary_type" value="저녁"></th>
																		</tr>
																	</thead>
																	<tbody>
																		<tr>
																			<td class="form_menu"><span class="todey_menu">오늘의
																					저녁 메뉴</span><br> <br> <input type="text"
																				name="diet_diary_menu"
																				class="Diet_diary_box6_input_menu"></td>
																			<td class="form_calorie"><br> <br> <input
																				type="text" name="diet_diary_menu_calorie"
																				class="Diet_diary_box6_input_calorie"><span
																				class="Diet_diary_top_text">kcal</span></td>
																		</tr>
																		<tr>
																			<td class="form_calorie_td">저녁 총 칼로리는</td>
																			<td class="form_sum"><input type="text"
																				name="diet_diary_menu_sum"
																				class="Diet_diary_box6_input_sum"><span
																				class="Diet_diary_bottom_text">kcal</span></td>
																		</tr>
																		<tr>
																			<td colspan="2"><input type="submit" value="추가"
																				class="form_button1" id="form_button1"></td>
																		</tr>
																	</tbody>
																</table>
															</form>
													</span>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간!!!!!!!!!!!!!!!! -->
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