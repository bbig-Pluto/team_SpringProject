<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myspring.syl.yyk.dto.DiaryDTO"
%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<%-- 웹폰트 적용 --%>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
 <link rel="stylesheet" href = "resources/sdy/todo.css"/> 
 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
 <c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
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
.calendarLeft {
            width: 500px;
            height: 770px;
            margin-left: 110px;
            margin-top: 68px;
            border: 3px solid black;
            border-right: 1.5px solid black;
            border-top: 0px;
            border-bottom: 0px;
            display: inline-block;
			background-color:#ff9a9a ;
        }

        .calendarRight {
            width: 500px;
            height: 770px;
            margin-top: 68px;
            border: 3px solid black;
            border-left: 1.5px solid black;
            border-top: 0px;
            border-bottom: 0px;

            /* 배경색상1 */
            display: inline-block;
            background-color:#ff9a9a ;
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
	background-color: #ff9a9a;
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
	background-color: #ff9a9a;
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
.calendarRight {
	position: relative;
	z-index: 1;
}
.memo_text {
	color : white;
	font-size : 38px;
	/* text-align: center; */
	margin-top: 5px;
	margin-left: 194px;
	position: absolute;
	z-index: 10;
}



/* 메모 작성하는 곳 */
.content {
	border:none;
	/* border: 1px solid white; */
	border-radius: 25px;
	background-color: rgba(255, 255, 255, 0.511);
	width: 88%;
	height: 490px;
	margin-top: 130px;
	margin-left: 30px;
	/* margin-bottom: 20px; */
	resize: none;
	font-size: 17px;
	padding: 17px;
	box-sizing:border-box;
	overflow: auto;
	outline: none;
	box-shadow: inset -1px 1px 5px 0px #80808091;
}
/* 저장 버튼 */
.m_addBtn {
	border: none;
	background-color: rgb(245, 217, 217);
	border-radius: 5px;
	margin-top: 17px;
	margin-left: 210px;
	width: 70px;
	height: 30px;
	
}


/* 스크롤바 전체 */
.content::-webkit-scrollbar {
    width: 15px;
    /* height: 15px; */
	/* margin-right: 10px; */
	
}
 /* 스크롤 여백 */
.content::-webkit-scrollbar-track {
    /* background-color: rgba(0,0,0,0.1); */
    border-radius: 5px;
}

/* 스크롤 막대 */
.content::-webkit-scrollbar-thumb {
    /* background-color: rgba(239, 117, 117, 0.8); */
    background-color: rgba(119, 118, 118, 0.223);
    border-radius: 5px;
	/* height: 10px; */
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

         .postTodo {
			width: 60px;
			height: 27px;
			position: absolute;
			font-size: 12px;
			font-weight: bold;
			font-style: italic;
			text-align: center;
			padding-top: 5px;
			padding-bottom: 5px;
			color: rgba(104, 100, 100, 0.692);
		}
		.postTodo.It1 {
			z-index: 1;
			top: 32px;
			left: -19px;
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
	chkUpdate();
	selectAll();
	 delHover();
	<%
	String isLogon = "guest";
	HttpSession logOnSession = request.getSession();
	
	if(logOnSession.isNew()) {
		logOnSession.setAttribute("isLogon", "guest"); // 세션이 없으면 만들어서 isLogon 에 guest 세팅
	} else { // 세션은 있는데 로그인을 안 하고 들어온 Case
		if(logOnSession.getAttribute("logOn.id") == null) {
			isLogon = "guest"; // 세션이 있다면 isLogon 에 세션에 있던 값을 세팅
			System.out.println("addMemo if-else route ( guest )" );
		} else {
			isLogon = "member"; 			
			System.out.println("addMemo if-else route ( member )");
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
	
 	
	let addMemosbm = document.querySelector(".m_addBtn");
	addMemosbm.addEventListener("click", function(e){
		e.preventDefault();
		blank();	
		
		<% if(isLogon.equals("member")){ %>
				addMemo.method = "get";
				addMemo.action = "/syl/addMemo";
				addMemo.submit();
				alert("저장!")
		<% }else { %>
				alert("로그인 후 이용해 주세요");
		<% } %>
	})
}

	//메모장 아무것도 안적혀 있을 때도 저장 가능하게
	function blank() {
		if( document.querySelector(".content").value == '' ) {
			document.querySelector(".content").value = ' ';
		}
	}
	
	//todo 스크립트 
	 //하트체크 클릭시 chk=0이 chk=1로 업데이트 
	 function chkUpdate(){
			$('input:checkbox[name="chk"]').off("click").on("click",function(){
				  
					if(this.checked){
					  $(this).val(1);
					  $(this).parent().find(".hidden_id").val(1);
					}else{
						 $(this).val(0);
						  $(this).parent().find(".hidden_id").val(0);
					}
				  var chk = $(this).val();
				  var todo_id = $(this).data('id');
				/*   var chk_hidden=$(this).parent().find(".hidden_id") */
					console.log($(this).val());
				
				let info = {
						chk:chk,
						todo_id:todo_id
				}; 
				  
				$.ajax({
					url:"/syl/todoMod",
					type:"post",
					contentType:"application/json",
					data:JSON.stringify(info),
					success :function(data){
						
					selectAll();	
					},
					error:function(){
						alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
					}
				});
			   	  if($(".heart_input:checked").length == $(".heart_input").length){
			   	  	$("#heart-check_all").prop("checked", true);
			   	   }else{
			   	  	$("#heart-check_all").prop("checked", false);
			   	  }
				});
			
	 }
	 //전체 선택시 모든 값 업데이트
	<%--  function chkUpdateAll(){
			var uid = '<%=(String)session.getAttribute("logOn.id")%>';
			$('input:checkbox[name="chkAll"]').off("click").on("click",function(){
				  
					if(this.checked){
					  $('input:checkbox[name="chk"]').each(function(){
						  $(this).val(1);
					  });
					}else{
						  $('input:checkbox[name="chk"]').each(function(){
							  $(this).val(0);
						  });
					}
				  var chk[] = $(this).val();
				  var todo_id[] = $(this).data('id');
				
				let info = {
						chk:chk,
						id:uid
				}; 
				  
				$.ajax({
					url:"/syl/todoModAll",
					type:"post",
					contentType:"application/json",
					data:JSON.stringify(info),
					success :function(data){
						
					selectAll();	
					},
					error:function(){
						alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
					}
			});
				});
		}  --%>
	 /* function chkAllUpdate(){
			$('input:checkbox[name="chk"]').off("click").on("click",function(){
				$('input:checkbox[name="chk"]').each(function() {
				  
					if(this.checked){
					  $(this).val(1)
					}else{
						 $(this).val(0)
					}
				  var chk = $(this).val();
				  var todo_id = $(this).data('id');
					console.log($(this).val());
				
				let info = {
						chk:chk,
						todo_id:todo_id
				}; 
				  
				$.ajax({
					url:"/syl/todoMod",
					type:"post",
					contentType:"application/json",
					data:JSON.stringify(info),
					success :function(data){
						
						
					},
					error:function(){
						alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
					}
			});
				});
		}  */
	/*   $(function(){
			bind();
		});
*/
/* 		function chkUpdate(){
			let list = [];
			let chk = $(".heart_input").val();
			let todo_id = $(".heart_input").data('id');
			$('input:checkbox[name="chk"]').each(function() {
				let todo_id  = '';
				if(this.checked){
					chk == 1;
				}else{
					chk == 0;
				}
				
				let info = {
						
						chk:chk,
						todo_id:todo_id
				}; 
				list.push(info)
				
			});
				$.ajax({
					url:"/syl/todoMod",
					type:"post",
					contentType:"application/json",
					data:JSON.stringify(info),
					success :function(data){
						
						
					},
					error:function(){
						alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
					}
				});
		} */
	  //전체선택
		/*  function selectAll(selectAll) {
			  const checkboxes 
				   = document.getElementsByName('chk');
			  
			  checkboxes.forEach((checkbox) => {
				checkbox.checked = selectAll.checked;
			  })
			} */
	  //전체선택,해제
		function selectAll() {
				$("#heart-check_all").click(function() {
					//전체 체크 클릭시 개별체크 모두 체크해주고 값을 1로 바꿈
					if($("#heart-check_all").is(":checked")){
						$("input[name=chk]").prop("checked", true);
						$("input[name=chk]").val(1);
						 $("input[name=chk]").parent().find(".hidden_id").val(1);
					}
					//전체 체크 해제시 개별체크 모두 해제 후 값을 0으로 바꿈
					else {
						$("input[name=chk]").prop("checked", false);
						$("input[name=chk]").val(0);
						 $("input[name=chk]").parent().find(".hidden_id").val(0);
					}
					//배열을 선언해서 여러개의 값들을 가져와서 배열에 넣어줌
						var chk_arr =[];
						var todo_id_arr=[];
					 var chk = $("input[name=chk]").each(function(){
						 var chks =$(this).val();
						 chk_arr.push(chks);
						 var todo_ids = $(this).data('id');
						 todo_id_arr.push(todo_ids);
					 });
						console.log(chk_arr);
						console.log(todo_id_arr);
					let info = {
							chk:chk_arr,
							todo_id:todo_id_arr
					}; 
					  
					$.ajax({
						url:"/syl/todoModAll",
						type:"post",
						contentType:"application/json",
						data:JSON.stringify(info),
						success :function(data){
							
						},
						error:function(){
							alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
						}
				});

				$("input[name=chk]").click(function() {
					var total = $("input[name=chk]").length;
					var checked = $("input[name=chk]:checked").length;

					if(total != checked) 
						$("#heart-check_all").prop("checked", false);
					else 
						$("#heart-check_all").prop("checked", true); 
				});
				})
			}
			
			
	//x버튼에 마우스오버 시 텍스트 정보 나오고 마우스아웃 시 텍스트 정보 없어짐
	function delHover(){
		let del_btn = document.querySelector(".del_btn");
		let textInfo = document.querySelector(".textInfo");

		del_btn.addEventListener("mouseover",()=>{
			if(textInfo.style.opacity==0){
				textInfo.style.opacity=1;
			}
		})
		del_btn.addEventListener("mouseout",()=>{
			if(textInfo.style.opacity==1){
				textInfo.style.opacity=0;
			}
		})
	}
	//todo 입력 ajax
		function bind(){
				let todo = $(".text_input").val();//jquery로만 추출
				 var uid = '<%=(String)session.getAttribute("logOn.id")%>';
				let info = {
					todo : todo,
					id : uid
				}; 
				$.ajax({
					url:"/syl/todoInsert",
					type:"post",
					contentType:"application/json",
					data:JSON.stringify(info),
					success :function(data){
						console.log(data);
							let html="";
							
							 html+=" <div style='height: 50px; overflow: hidden; display: inline-block; margin-top:20px;'>"; 
							 html+=" <input type='checkbox' name='chk' id='heart-check["+data.todo_id+"]' class='heart_input' value='"+data.chk+"' data-id='"+data.todo_id+"'>"; 
							html+="  <label for='heart-check["+data.todo_id+"]' style='margin-top:-25px;' /></label> ";
							html+="  		 <div class='text' >"+data.todo+"</div>"; 
							html+=" <input type='hidden' name='todo_id' value='"+data.todo_id+"' class='id'>";
							html+="  <input type='hidden' name='todo_chk' value='"+data.chk+"'class='hidden_id'>";
							 html+="   </div>"; 
							
							$(".box").prepend(html); 
							
							chkUpdate();
							selectAll();
							
							 if($(".heart_input:checked").length == $(".heart_input").length){
							   	  	$("#heart-check_all").prop("checked", true);
							   	   }else{
							   	  	$("#heart-check_all").prop("checked", false);
							   	  }
							
						/* 	deleteLine();
							deleteLine_all(); */
						
					},
					error:function(){
						alert("다시 입력해주세요")
					}
				});
		}
	/* 	function deleteLineFix(){
			let chk=document.querySelectorAll(".heart_input");
			if(chk)
		} */
   //체크된 체크박스 삭제줄 만들기
/*      function deleteLine(){  */
       //개별 체크박스 잡아오기
/*        let chk=document.querySelectorAll(".heart_input");  */
       // 입력받은 텍스트 잡아오기 (체크박스와 텍스트의 부모에서 자식인 자기자신을 잡아오는것이 좋음 )
       //체크박스에 이벤트 주기
  /*      for(let i=0;i<chk.length;i++){
       chk[i].addEventListener("change", (evt) => {  */
     		//chk의 부모로 올라갔다가 그 부모의 자식인 text 잡아옴
       	/*  let text = event.target.parentNode.querySelector(".text");
	            if (event.target.checked) {  */
	                // textDecoration 의 속성을 line-through로 변경
/* 	                 text.style.textDecoration = "line-through";
	            } else {
	                text.style.textDecoration = "";
	            }   

   })
       }
   }  */
   //전체선택 시 삭제줄 만들기
   /*  function deleteLine_all(){  */
       //전체 체크박스 잡아오기
      /*  let chk_all=document.querySelector("#heart-check_all");  */
       // 입력받은 텍스트 잡아오기 (체크박스와 텍스트의 부모에서 자식인 자기자신을 잡아오는것이 좋음 )
     /*   let text = document.querySelectorAll(".text");
       for(let i=0; i<text.length;i++){ */ 	 
	        //체크박스에 이벤트 주기
	       /*  chk_all.addEventListener("change", (evt) => {
	            if (evt.target.checked) {  */
	                // textDecoration 의 속성을 line-through로 변경
	/*                 text[i].style.textDecoration = "line-through";
	            } else {
	                text[i].style.textDecoration = "";
	            }
	
	
	    })
       }
   }  */
 //전체선택 박스 해제
/*     function checkSelectAll()  {
   	  const checkboxes 
   	    = document.querySelectorAll('input[name="chk"]');
   	  const checked 
   	    = document.querySelectorAll('input[name="chk"]:checked');
   	  const selectAll 
   	    = document.querySelector('input[name="chkAll"]');
   	  
   	  if(checkboxes.length === checked.length)  {
   	    selectAll.checked = true;
   	  }else {
   	    selectAll.checked = false;
   	  }

   } */
  /*  function clean(){
       let btn = document.querySelector(".regi");
       btn.addEventListener("click",()=>{
       let Text = document.querySelector(".text_input").value;
       Text="";
       })
   } */
   function loginAlert(){
       	alert("로그인이 필요한 서비스입니다.");
   }
</script>

<body>
		<header>
         <div class="wrapper">
            <h1>
               <a href="${ contextPath }/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
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
		<section>
			<article>
				<div class="area_wrapper">
					<!--왼쪽영역-->
  					 <div class="calendarLeft">
  					 		 	<!--하트버튼-->
						   <div class="textInfo">체크된 항목만 삭제됩니다.</div>
							   <section>
							   
									   <div class="allCheck">전체선택</div>
									   <input type="checkbox" name="chkAll" id="heart-check_all" class="heart_input_all">
									   <label for="heart-check_all" class="heart-check_all"></label>
						<c:if test="${! empty sessionId }">
						   <form  method="post" action="/syl/todo_delCheck">
							   <input type="submit" value="+" class="del_btn">
						</c:if>
								   <div class="box">
						
									  	<c:forEach var="list" items="${list}">
										    <c:if test="${sessionId eq list.id }"> 
											   <div style="height: 50px; overflow: hidden; display: inline-block; margin-top: 20px;">
												   <input type="checkbox" name="chk" id="heart-check[${list.todo_id }]" class="heart_input" value="${list.chk }" data-id="${list.todo_id}" <c:if test="${list.chk ==1}">checked</c:if>>
												   <label for="heart-check[${list.todo_id }]" style="margin-top:-25px;" ></label>
												   <input type="hidden" name="todo_id" value="${list.todo_id }" class="id">
												   <input type="hidden" name="todo_chk" value="${list.chk}" class="hidden_id">
												   <input type="hidden" name="id" value="${sessionId}" class="sessionId">
											  		 <div class="text">${list.todo} </div>
											   </div>
									   		 </c:if> 
										  </c:forEach>
										    <c:if test="${empty sessionId}"> 
											   <div style="height: 50px; overflow: hidden; display: inline-block; margin-top: 20px;">
												   <input type="checkbox" name="chk" id="heart-check[null]" class="heart_input" checked>
												   <label for="heart-checkheart-check[null]" style="margin-top:-25px;" ></label>
											  		 <div class="text">작살나게 밥먹기</div>
											   </div>
											   <div style="height: 50px; overflow: hidden; display: inline-block; margin-top: 20px;">
												   <input type="checkbox" name="chk" id="heart-check[null1]" class="heart_input" >
												   <label for="heart-checkheart-check[null1]" style="margin-top:-25px;" ></label>
											  		 <div class="text">간지나게 자기</div>
											   </div>
											   <div style="height: 50px; overflow: hidden; display: inline-block; margin-top: 20px;">
												   <input type="checkbox" name="chk" id="heart-check[null2]" class="heart_input">
												   <label for="heart-checkheart-check[null2]" style="margin-top:-25px;" ></label>
											  		 <div class="text">끝장나게 숨귀기</div>
											   </div>
									   		 </c:if> 
								   </div>
							   	</form>
								</section>
									<div class="input_todo">
										<input type="text"  name="todo" class="text_input">
								<c:choose>
									 <c:when test="${! empty sessionId }">
											<input type="button" class="regi" value="입력" onclick="bind()">
									</c:when>
									<c:otherwise>
										<button type="button" class="regi" onclick="loginAlert()">입력</button>
									</c:otherwise>
								</c:choose>
									</div>
					 </div>
					 <!--우측영역-->
					 <div class="calendarRight">
						<div class="memo_text">Memo</div>
						
						<form name="addMemo">
							<div class="memo_container">
									<textarea type="text" name="m_content" class="content" placeholder="내용을 입력해주세요"></textarea>
								<input type="submit" value="저장" class="m_addBtn">
							</div>
						</form>
						
					 </div>  



					
					<!-- 위쪽 반원 -->
					<div class="calendarLT"> <div class="title">Todo List</div></div>
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

		</div>

	</footer>
</body>
</html>