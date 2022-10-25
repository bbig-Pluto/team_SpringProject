<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value='<%=(String)session.getAttribute("logOn.id") %>'/>
<% HttpSession logOnSession = request.getSession(); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<title> 운동일지 </title>
<link rel="shortcut icon" type="image/x-icon" href="https://ifh.cc/g/1lYMPW.png">
<link href="${path}/resources/lhj/Inbody.css" rel="stylesheet">
<style>

</style>
<script>
	window.onload = function() {
		// insert_cancel();

		// insert_bind_2();
		one_check();
		session();
		
		
		// 마이페이지 세션
		let popupWidth = 470;
		let popupHeight = 140;
		// 브라우저 기준 중앙 정렬			
		let popupX = (document.body.offsetWidth / 2) - (popupWidth / 2);
		let popupY = (window.screen.height / 2) - (popupHeight / 2);
					
		document.querySelector("#myPageLink").addEventListener("click", function(e) {
			<% if ((""+logOnSession.getAttribute("isLogon")).equals("member")) { %>
				window.open('${path}/member/rd/inputpwdformypage', '비밀번호 재확인', 'width=' + popupHeight + ', height=' + popupHeight + ', left='+ popupX + ', top=' + popupY + ', scrollbars=yes');
			<% } else { %>
				alert("로그인이 필요한 서비스입니다.");				
			<% } %>
		})
		
		
	}


	function session() {
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


		// 현재 체중량 확인버튼 눌렀을 때
		document.querySelector(".lnbody_input").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면
			lnbody_table_name.submit();
		<%}%>
		})

		// 목표 체중량 확인버튼 눌렀을 때
		document.querySelector(".lnbody_input_2").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면
			lnbody_table_name_2.submit();
		<%}%>
		})

		// 삭제버튼 눌렀을 때
		document.querySelector(".inbody_delete").addEventListener("click",function(e) {
		e.preventDefault();
		<%if (!(isLogon.equals("member"))) {%>
			e.preventDefault();
			alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
		<%} else {%>	// 	세션이 있는데 logOn.id도 있으면
			
			// 체크된 값 갖고옴
			let delete_conut = 0;
			let delete_checked = document.querySelectorAll("input[name='seq_Inbody']:checked");
			for(i=0; i<delete_checked.length; i++){
				delete_conut++;
				console.log("delete_conut : " + delete_conut);
			}
			// 체크된 값이 없으면
			if(delete_conut ===0){
				alert("삭제할 값을 체크해주세요")
				e.preventDefault();
			}else if(delete_conut >=1){	// 체크된 값이 있으면
				lnbody_delete_name.submit();
			}
			
		<%}%>
		})


		// 추가를 클릭하면 session제한을 봄
		// document.querySelector(".insert_button").addEventListener("click",function(e) {
		// e.preventDefault();

		insert_bind();
		
			function insert_bind() {
				document.querySelector(".insert_button").addEventListener("click",function(e) {
				<%if (!(isLogon.equals("member"))) {%>
				alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
				<%} else {%> // 세션도 만들었고, 로그인도 하고 들어온 Case
		
					console.log("insert_bind 진입");
									// 추가버튼 remove
									document.querySelector(".insert_button")
											.remove();

									// 기존 내용 숨김
									let sapn_text = document
											.querySelectorAll(".sapn_text");
									for (let i = 0; i < sapn_text.length; i++) {
										sapn_text[i].style.display = "none";
										console.log("추가 클릭시 for문 1")
									}
									// 숨긴 내용 보임
									let text_hidden = document
											.querySelectorAll(".text_hidden");
									for (let j = 0; j < text_hidden.length; j++) {
										console.log("추가 클릭시 for문 2")
										text_hidden[j].style.display = "block";
										text_hidden[j].setAttribute("type", "text");
									}
									// 취소버튼 생성
									let sapn_button_box = document
											.querySelector(".sapn_button_box");
									let html = sapn_button_box.innerHTML;
									html += '<input type="button" value="취소" class="insert_cancel">'
									sapn_button_box.innerHTML = html;

									// 취소 버튼 do을 js 변수에 다시 초기화
									let insert_cancel = document
											.querySelector(".insert_cancel");
									call_fn();
							<%}%>

				})
				
			}


			function call_fn() {
				console.log("call_fn 진입")
				let insert_cancel = document.querySelector(".insert_cancel");

				// 취소를 클릭했을때
				insert_cancel.addEventListener("click", function(e) {
					console.log("call_fn 이벤트 진입")
									// 취소버튼 remove
									document.querySelector(".insert_cancel")
											.remove();

									// 내용 다시 숨김
									let text_hidden = document
											.querySelectorAll(".text_hidden");
									for (let j = 0; j < text_hidden.length; j++) {
										console.log("취소 클릭시 for문 1")
										text_hidden[j].style.display = "none";
										text_hidden[j].setAttribute("type",
												"hidden");
									}

									// 기존 내용 다시 보임
									let sapn_text = document
											.querySelectorAll(".sapn_text");
									for (let i = 0; i < sapn_text.length; i++) {
										console.log("취소 클릭시 for문 2")
										sapn_text[i].style.display = "block";
									}

									// 추가버튼 생성
									let sapn_button_box = document
											.querySelector(".sapn_button_box");
									let html = sapn_button_box.innerHTML;
									html += '<input type="button" value="추가" class="insert_button">'
									sapn_button_box.innerHTML = html;


									// 추가 버튼 do을 js 변수에 다시 초기화
									let insert_button = document.querySelector(".insert_button");
									insert_bind(); // 새롭게 생성된 버튼에 바인딩해서 이벤트를 기다리게 함

									console.log("call_fn 이벤트 끝나기 직전")
								})
								
			}


		






		insert_bind_2()
		// update 할거임
		function insert_bind_2() {
			document.querySelector(".update_button").addEventListener("click",function(e) {
			<%if (!(isLogon.equals("member"))) {%>
				alert("로그인이 필요합니다"); // 세션은 있는데 member가 아니면
			<%} else {%> // 세션도 만들었고, 로그인도 하고 들어온 Case
								// 수정버튼 remove
								document.querySelector(".update_button").remove();
								// 기존 내용 숨김
								let update_span = document.querySelectorAll(".update_span");

								for (let i = 0; i < update_span.length; i++) {
									update_span[i].style.display = "none";
									console.log("수정 클릭시 for문 1")
								}
								// 숨긴 내용 보임
								let update_hidden = document.querySelectorAll(".update_hidden");
								for (let j = 0; j < update_hidden.length; j++) {
									console.log("수정 클릭시 for문 2")
									update_hidden[j].style.display = "block";
									update_hidden[j].setAttribute("type","text");
								}

								// 취소버튼 생성
								let sapn_button_box2 = document
										.querySelector(".sapn_button_box2");
								let html = sapn_button_box2.innerHTML;
								html += '<input type="button" value="취소" class="update_cancel">'
								sapn_button_box2.innerHTML = html;

								// 취소 버튼 do을 js 변수에 다시 초기화
								let update_cancel = document.querySelector(".update_cancel");
								call_fn_2();
				<%}%>		
			})
		}							
						


		function call_fn_2() {
			
			// 취소를 클릭했을때
			let update_cancel = document.querySelector(".update_cancel");
			update_cancel.addEventListener("click",function(e) {
								// 취소버튼 remove
								document.querySelector(".update_cancel").remove();
								console.log("취소버튼 remove 아래")
								// 내용 다시 숨김
								let update_hidden = document
										.querySelectorAll(".update_hidden");
								for (let j = 0; j < update_hidden.length; j++) {
									console.log("취소 클릭시 for문 1")
									update_hidden[j].style.display = "none";
									update_hidden[j].setAttribute("type","hidden");
								}

								// 기존 내용 다시 보임
								let update_span = document
										.querySelectorAll(".update_span");
								for (let i = 0; i < update_span.length; i++) {
									console.log("취소 클릭시 for문 2")
									update_span[i].style.display = "block";
								}

								// 수정버튼 생성
								let sapn_button_box2 = document
										.querySelector(".sapn_button_box2");
								let html = sapn_button_box2.innerHTML;
								html += '<input type="button" value="수정" class="update_button">'
								sapn_button_box2.innerHTML = html;

								let update_button = document.querySelector(".update_button");
								insert_bind_2();
								console.log("insert_bind_2 아래")
							})

		}

	} // 세션 닫는 괄호



	// 하나 클릭
	function one_check() {
		let one_check = document.querySelectorAll(".one_check");

		for (let i = 0; i < one_check.length; i++) {
			one_check[i].addEventListener("click", function(e) {
				one_check[i].checked = e.target.checked;
				console.log("흠", one_check[i].value)
				// 체크된 값 갖고옴
				if (e.target.checked === true) {
					one_check[i].value;
					console.log(e.target.value);
				}
			})
		}
	}
</script>


</head>

<body>
	<header>
         <div class="wrapper">
            <h1>
               <a href="${ path }/calendarM"><img class="headerLogo" src="/syl/resources/photo/3syl.png"></a>
            </h1>
            <nav>
               <a href="${ path }/bar/intro" class="headersub">다이어리 소개 |</a> 
               <a href="${ path }/bar/story11" class="headersub">다이어리 구성 |</a> 
               <a href="${ path }/bar/func" class="headersub">다이어리 기능 |</a> 
               <a href="${ path }/bar/shot11"   class="headersub">다이어리 사용법 |</a> 
               <a href="${ path }/notice" class="headersub">고객의 소리</a>
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


						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 다이어리 안의 부분 -->
						<!-- 탭 tab ec -->
						<div class="tab_ec_box">
							<div class="tab_ec_box1">
								<a href="/syl/ec_list.do" id="myPageLink" class="headermypage">
								<button id="tab_ec_E" class="tab_ec_tab">운동일지 만들기</button>
								</a>
								<button id="tab_ec_F" class="tab_ec_tab">바디 기록실</button>
<!-- 								<button id="tab_ec_G" class="tab_ec_tab">G</button> -->
<!-- 								<button id="tab_ec_H" class="tab_ec_tab">H</button> -->
							</div>

							<!-- 안에 흰색 box -->
							<div class="tab_ec_box2">
								<!-- <form>
                                                    <table border="1">
                                                        <tbody>
                                                            <tr>
                                                                <th>닉네임</th>
                                                                <td>일단보류</td>
                                                                <th>성별</th>
                                                                <td>일단보류</td>
                                                                <th>나이</th>
                                                                <td>일단보류</td>
                                                        </tbody>
                                                    </table>
                                                </form> -->

								<form action="${path}/inbody/insert.do" method="post" name="lnbody_table_name">
								<div class="lnbody_box_1">
									<table class="lnbody_table">
										<caption>
											<h2 class="lnbody_caption">현재 체중량</h2>
											<hr class="lnbody_hr">
										</caption>
										<tbody class="lnbody_tbody">
											<tr class="lnbody_tr">
												<th class="lnbody_th">날짜</th>
												<td class="lnbody_td">${select_Inbody_Last[0].inBody_Today}</td>
											</tr>
											<tr>
												<th class="lnbody_th">키</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_Inbody_Last[0].inBody_Height}"
													class="text_hidden" name="inBody_Height"><span
													class="sapn_text">
														${select_Inbody_Last[0].inBody_Height} </span></td>
											</tr>
											<tr>
												<th class="lnbody_th">체중</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_Inbody_Last[0].inBody_Weight}"
													class="text_hidden" name="inBody_Weight"><span
													class="sapn_text">
														${select_Inbody_Last[0].inBody_Weight} </span></td>
											</tr>
											<tr>
												<th class="lnbody_th">체지방량</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_Inbody_Last[0].inBody_Body_Fat}"
													class="text_hidden" name="inBody_Body_Fat"><span
													class="sapn_text">
														${select_Inbody_Last[0].inBody_Body_Fat} </span></td>
											</tr>
											<tr>
												<th class="lnbody_th">골격근량</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_Inbody_Last[0].inBody_Skeletal}"
													class="text_hidden" name="inBody_Skeletal"><span
													class="sapn_text">
														${select_Inbody_Last[0].inBody_Skeletal} </span></td>
											</tr>
										</tbody>
									</table>
								</div>
									<span class="sapn_button_box"> <input type="submit"
										value="확인" class="lnbody_input"> <input type="button"
										value="추가" class="insert_button"> <input type="hidden"
										value="${select_Inbody_Last[0].seq_Inbody}" name="seq_Inbody">
									</span>
								</form>

								<form action="${path}/inbody/update.do" method="post" name="lnbody_table2_name">
									<table class="lnbody_table_2" name="lnbody_table_name_2">
										<caption>
											<h2 class="lnbody_caption">목표 체중량</h2>
											<hr class="lnbody_hr">
										</caption>
										<tbody class="lnbody_tbody">
											<tr class="lnbody_tr">
												<th class="lnbody_th">날짜</th>
												<td class="lnbody_td">${select_One_Inbody_2.inbody_Today_2}</td>
											</tr>
											<tr class="lnbody_tr">
												<th class="lnbody_th">키</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_One_Inbody_2.inbody_Height_2}"
													class="update_hidden" name="inbody_Height_2"> <span
													class="update_span">
														${select_One_Inbody_2.inbody_Height_2} </span></td>
											</tr>
											<tr class="lnbody_tr">
												<th class="lnbody_th">체중</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_One_Inbody_2.inbody_Weight_2}"
													class="update_hidden" name="inbody_Weight_2"> <span
													class="update_span">
														${select_One_Inbody_2.inbody_Weight_2} </span></td>
											</tr>
											<tr class="lnbody_tr">
												<th class="lnbody_th">체지방량</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_One_Inbody_2.inbody_Body_Fat_2}"
													class="update_hidden" name="inbody_Body_Fat_2"> <span
													class="update_span">
														${select_One_Inbody_2.inbody_Body_Fat_2} </span></td>
											</tr>
											<tr class="lnbody_tr">
												<th class="lnbody_th">골격근량</th>
												<td class="lnbody_td"><input type="hidden"
													value="${select_One_Inbody_2.inbody_Skeletal_2}"
													class="update_hidden" name="inbody_Skeletal_2"> <span
													class="update_span">
														${select_One_Inbody_2.inbody_Skeletal_2} </span></td>
											</tr>
										</tbody>
									</table>
									<span class="sapn_button_box2"> <input type="submit"
										value="확인" class="lnbody_input_2"> <input type="button"
										value="수정" class="update_button"> <input type="hidden"
										value="${select_One_Inbody_2.seq_Inbody_2}"
										name="seq_Inbody_2">
									</span>
									<div class="exercise_reservation">
										<p>${ ment }</p>
									</div>
								</form>
								<div class="lnbody_box_2">
									<h2 class="lnbody_scroll_caption">나의 기록일지</h2>
									<div class='scrolltable'>
										<form action="${path}/inbody/delete.do" method="post" name="lnbody_delete_name">
											<table class="lnbody_table_3">
												<thead>
													<tr class="lnbody_scroll_tr">
														<th class="lnbody_scroll_th_checkbox"></th>
														<th class="lnbody_scroll_th">날짜</th>
														<th class="lnbody_scroll_th">키</th>
														<th class="lnbody_scroll_th">체중</th>
														<th class="lnbody_scroll_th">체지방량</th>
														<th class="lnbody_scroll_th">골격근량</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="select_Inbody_list"
														items="${select_Inbody_list}">
														<tr>
															<td><input type="checkbox"
																value="${select_Inbody_list.seq_Inbody}"
																name="seq_Inbody" class="one_check"></td>
															<td class="lnbody_scroll_td">${select_Inbody_list.inBody_Today}</td>
															<td class="lnbody_scroll_td">
																${select_Inbody_list.inBody_Height}</td>
															<td class="lnbody_scroll_td">
																${select_Inbody_list.inBody_Weight}</td>
															<td class="lnbody_scroll_td">
																${select_Inbody_list.inBody_Body_Fat}</td>
															<td class="lnbody_scroll_td">
																${select_Inbody_list.inBody_Skeletal}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<input type="submit" value="삭제" class="inbody_delete">
										</form>
									</div>
								</div>
							</div>
						</div>


						<!-- !!!!!!!!!1!! 다이어리 안에 페이지 넣는 공간 끝!!!!!!!!!!!!!!!! -->
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
						
						<a href='${ path }/diaryList'>
						<div class="post1 It2">Diary</div>
						</a>
						
						<a href='${ path }/diet_1page.do'>
						<div class="post1 It3">Diet</div>
						</a>
						

						<a href='${ path }/mainwish'>
						<div class="post1 It5">Wish</div>
						</a>
					</div>
					<div class="rightLine2">
<!-- 						<div class="post2 It1"></div> -->
						<a href='${ path }/ec_list.do'>
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

	</footer>
</html>