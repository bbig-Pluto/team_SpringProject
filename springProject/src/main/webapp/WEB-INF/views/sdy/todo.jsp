<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/> 
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
 <link rel="stylesheet" href = "resources/sdy/todo.css"/> 
 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
	width: 560px;
	display: inline-block;
	vertical-align: top;
	margin-top: 3%;
	margin-left: 14%;
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
            background-color:white ;
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
/* 포스트잇 */
/* 포스트잇 */
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

.post1.It1 {
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
</style>
<!--------------------------------------스크립트--------------------------->
<script>
	  window.onload=()=>{
		
			chkUpdate();
			selectAll();
            
        } 
	 
	 function chkUpdate(){
			$('input:checkbox[name="chk"]').off("click").on("click",function(){
				  
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
		} 
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
	  
		function selectAll() {
				$("#heart-check_all").click(function() {
					if($("#heart-check_all").is(":checked")) $("input[name=chk]").prop("checked", true);
					else $("input[name=chk]").prop("checked", false);
				});

				$("input[name=chk]").click(function() {
					var total = $("input[name=chk]").length;
					var checked = $("input[name=chk]:checked").length;

					if(total != checked) $("#heart-check_all").prop("checked", false);
					else $("#heart-check_all").prop("checked", true); 
				});
			};
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
	
		function bind(){
				let todo = $(".text_input").val();//jquery로만 추출
				let info = {
					todo : todo
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
							html+="  <input type='hidden' name='todo_chk' value='"+data.chk+"'>";
							 html+="   </div>"; 
							
							$(".box").prepend(html); 
							
							chkUpdate();
							selectAll();
					},
					error:function(){
						alert("에ㅇ에에에에에에에에에엥에에에에에에엥에러발생!!!!!!!")
					}
				});
		}
    /*체크된 체크박스 삭제줄 만들기*/
/*     function deleteLine(){ */
        //개별 체크박스 잡아오기
   /*      let chk=document.querySelectorAll(".heart_input"); */
        // 입력받은 텍스트 잡아오기 (체크박스와 텍스트의 부모에서 자식인 자기자신을 잡아오는것이 좋음 )
        //체크박스에 이벤트 주기
/*         for(let i=0;i<chk.length;i++){
        chk[i].addEventListener("change", (evt) => { */
      		//chk의 부모로 올라갔다가 그 부모의 자식인 text 잡아옴
        	/*  let text = event.target.parentNode.querySelector(".text");
	            if (event.target.checked) { */
	                // textDecoration 의 속성을 line-through로 변경
	/*                 text.style.textDecoration = "line-through";
	            } else {
	                text.style.textDecoration = "";
	            }   

    })
        }
    } */
    //전체선택 시 삭제줄 만들기
  /*   function deleteLine_all(){ */
        //전체 체크박스 잡아오기
       /*  let chk_all=document.querySelector("#heart-check_all"); */
        // 입력받은 텍스트 잡아오기 (체크박스와 텍스트의 부모에서 자식인 자기자신을 잡아오는것이 좋음 )
      /*   let text = document.querySelectorAll(".text");
        for(let i=0; i<text.length;i++){ 	 */
	        //체크박스에 이벤트 주기
	    /*     chk_all.addEventListener("change", (evt) => {
	            if (evt.target.checked) { */
	                // textDecoration 의 속성을 line-through로 변경
/* 	                text[i].style.textDecoration = "line-through";
	            } else {
	                text[i].style.textDecoration = "";
	            }
	
	
	    })
        }
    } */
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
        
	</script>
</head>
<body>
	<header>
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
                  <a href="/syl/member/rd/mypage " class="headermypage">마이페이지</a>
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
									   <input type="checkbox" name="chkAll" id="heart-check_all" class="heart_input">
									   <label for="heart-check_all" class="heart-check_all"></label>
								
						   <form  method="post" action="/syl/todo_delCheck">
							   <input type="submit" value="+" class="del_btn">
								   <div class="box">
									  	<c:forEach var="list" items="${list}">
										   <div style="height: 50px; overflow: hidden; display: inline-block; margin-top: 20px;">
											   <input type="checkbox" name="chk" id="heart-check[${list.todo_id }]" class="heart_input"  data-id="${list.todo_id}" <c:if test="${list.chk ==1}">checked</c:if>>
											   <label for="heart-check[${list.todo_id }]" style="margin-top:-25px;" ></label>
											   <input type="hidden" name="todo_id" value="${list.todo_id }" class="id">
											   <input type="hidden" name="todo_chk" value="${list.chk}">
										  		 <div class="text">${list.todo} </div>
										   </div>
										  </c:forEach>
								   </div>
							   	</form>
								</section>
									<div class="input_todo">
										<input type="text"  name="todo" class="text_input">
										<input type="button" class="regi" value="입력" onclick="bind()">
									</div>
					
					 </div>
					 <!--우측영역-->
					 <div class="calendarRight"></div>  



					
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
						<!--  여기 Index에 이동 a링크 구성하기 -->
						<a href='/syl/todo'>
							<div class="post1 It1">todo<br>memo</div>
						</a> 
						<a href='/syl/diaryList'>
							<div class="post1 It2">Diary</div>
						</a> 
						<a href='/syl/diet_1page.do'>
							<div class="post1 It3">Diet</div>
						</a>
						 <a href='/syl/mainwish'>
						 	<div class="post1 It5">Wish</div>
						 </a>
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
				<img class="left_logo1" src="/syl/resources/photo/logo2.png"> 
				<img class="left_logo2" src="/syl/resources/photo/3syl2.png">
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

