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
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap');
        body {
            font-family: 'Noto Sans KR', sans-serif;
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
            margin: 20px 25px;
            color: rgb(60,60,60);
            display: inline-block;
        }
        .add_delete {
            float: right;
            margin: 10px 18px;
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
            height: 60px;
            overflow: auto;
            width: 490px;
        }
        .category_submit {
            width: 80px;
            margin-right: 8px;
            background-color: rgb(70, 204, 186);
            color: white;
            font-weight: 700;
            border: none;
            border-radius: 30px;
            height: 26px;
            line-height: 26px;
            margin-bottom: 5px;
        }
        .category_submit:hover {
            cursor: pointer;
            background-color: rgb(117, 218, 204);
        }
        .category_all {
            width: 80px;
            margin-right: 8px;
            background-color: rgb(70, 204, 186);
            color: white;
            font-weight: 700;
            border: none;
            border-radius: 30px;
            height: 26px;
            line-height: 26px;
            margin-bottom: 5px;
        }
        .category_all:hover {
            cursor: pointer;
            background-color: rgb(117, 218, 204);
        }
        .list_area {
            margin: 30px 20px;
            overflow-y: auto;
            height: 510px;
            width: 480px;
        }
        .list_area::-webkit-scrollbar {
            background-color: white;
            width: 12px;
        }
        .list_area::-webkit-scrollbar-thumb {
            background-color:rgb(180, 221, 216);
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
            margin-top: 20px;
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
    </style>
    <script>
        window.onload = function() {
            upload();
            doDisplay();
            next();
        }
        
        function getImageFiles(e) {
            let files = e.currentTarget.files;
            console.log(typeof files, files);
        }
        
        function upload() {
            
            let up = document.querySelector(".upload_photo");
            let add = document.querySelector(".photo_add");
            
            add.addEventListener("click", ()=> up.click());
            up.addEventListener("change", getImageFiles);
            
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
                    
                    <div class="title">WISH LIST</div>
                    
                    <!-- 상품 추가 / 삭제 버튼 -->
                    <div class="add_delete">
                    
                    <!-- +(추가) 버튼을 누르면 카테고리 추가 페이지로 이동  -->
                    <a href="${contextPath }/wishlist//wishAdd.do">
                        <input onclick="doDisplay()" class="add" type="submit" value="+">
                    </a>
                    
                        <img class="delete" src="https://ifh.cc/g/2K5tVb.png">
                    </div>
                    
                    <!-- 상품 카테고리 -->
                    <div class="category">
                    
		                        <input class="category_all" type="submit" value="All">
<%--                     <c:choose> --%>
<%--                     	<c:when test="${!empty wishList }"> --%>
<%--                     		<c:forEach var="wish" items="${wishList }"> --%>
                    		
<%-- 		                        <input class="category_submit" type="submit" value="${wish.category }"> --%>
<%--                         	</c:forEach> --%>
<%--                         </c:when> --%>
<%--                     </c:choose> --%>
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
			                            <div class="list_photo"></div>
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

</body>
</html>