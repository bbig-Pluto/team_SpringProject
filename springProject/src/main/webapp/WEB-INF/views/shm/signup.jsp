<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-Up Page</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        window.onload = function () {
            init();
            bind();
        }

        function init() {

        }

        function bind() {

            let termsOfServiceChkBox = document.querySelectorAll("input[name='check']");
            let chkAll = document.querySelector("#joinpg2All");

            // 회원가입 버튼
            joinbtn();
            nextbtn();
            /* nextbtn2();*/
            back();
            back2();
            //  ================== 약관동의(termsOfService) 체크박스 제어 start ===================

            // 약관 동의 checkbox 일괄체크
            chkAll.addEventListener("click", function () {
                console.log(chkAll);
                // 전체 해제 -> 전체 선택
                if (chkAll.checked === true) {
                    console.log("해제->선택");
                    for (let i = 0; i < termsOfServiceChkBox.length; i++) {
                        termsOfServiceChkBox[i].checked = true;
                        checkBoxCount = 3;
                    }
                    // 전체 선택 -> 전체 해제
                } else if (chkAll.checked === false) {
                    console.log("선택->해제");
                    for (let i = 0; i < termsOfServiceChkBox.length; i++) {
                        termsOfServiceChkBox[i].checked = false;
                        checkBoxCount = 0;
                    }
                }
            })

            // 일부 선택 OR 일부 해제 -> '전체 선택 체크' 반응 함수
            let checkBoxCount = 0;
            for (let i = 0; i < termsOfServiceChkBox.length; i++) {
                termsOfServiceChkBox[i].addEventListener("click", function () {
                    if (termsOfServiceChkBox[i].checked === true) {
                        checkBoxCount++;
                        console.log(checkBoxCount);
                    } else if (termsOfServiceChkBox[i].checked === false) {
                        console.log(checkBoxCount);
                        checkBoxCount--;
                    }
                    ChkBoxBatchControl();
                })
            }

            function ChkBoxBatchControl() {
                if (checkBoxCount == termsOfServiceChkBox.length) {
                    chkAll.checked = true;
                } else if (checkBoxCount != termsOfServiceChkBox.length) {
                    chkAll.checked = false;
                }
            }
            //  ================== 약관동의(termsOfService) 체크박스 제어 end ===================
            	
            //  ================== 회원가입 id 중복확인 start===================
            

            $(function() {
                $("#submitBtn").click(function(e) {

                        e.preventDefault();

                        let signUpInputBoxes = document.querySelectorAll("#signUpForm .mandatoryInfo input[type=text]");
                        let signUpPwdBox = document.querySelector("#signUpForm .mandatoryInfo input[type=password]");
                        let signUpMandatoryCount = 0;

                        // 가입정보 필수 입력 사항 체크
                        for (let i = 0; i < signUpInputBoxes.length; i++) {
                            // 공백 제거
                            signUpInputBoxes[i].value = signUpInputBoxes[i].value
                                .split(' ').join('');
                            // signUpPwdBox = signUpPwdBox.value.split(' ').join(''); // 비밀번호 공백제거, value 말고 다른 방법으로

                            if (((signUpInputBoxes[i].value) == '')
                                || ((signUpInputBoxes[i].value) == null)) {
                                signUpMandatoryCount++;
                            }
                            // if (((signUpPwdBox.value) == '') || ((signUpPwdBox.value) == null)) { // 비밀번호 공백제거, value 말고 다른 방법으로
                            //     signUpMandatoryCount++;
                            // }
                        }

                    if (signUpMandatoryCount == 0) { // 가입 필수 입력 여부 필터링
                            if (document.querySelector("#select").checked) {
                            	if ( !(document.querySelector("input[name='rn_ForAdminAdd']").value == '') ) {
	                                
	                                console.log("관리자 등급 rn_ForAdminAdd : ", document.querySelector("input[name='rn_ForAdminAdd']").value);
	                                let signup = { id : document.querySelector("input[name='id']").value,
	                                    pwd : document.querySelector("input[name='pwd']").value,
	                                    nickName : document.querySelector("input[name='nickName']").value,
	                                    emailAdd : document.querySelector("input[name='emailAdd']").value,
	                                    telNum : document.querySelector("input[name='telNum']").value,
	                                    rn_ForAdminAdd : document.querySelector("input[name='rn_ForAdminAdd']").value}
	                                $.ajax({
	                                    type: "post",
	                                    url: "${contextPath}/ajaxconn/signup.do",
	                                    contentType: "application/json",
	                                    data: JSON.stringify(signup),
	                                    success: function(data, textStatus){
	                                        eval(data);
	                                    }
	                                })
                            	} else {
                            		alert("관리자 등록 코드를 입력해주세요.");
                            		document.querySelector("input[name='rn_ForAdminAdd']").focus();
                            	}
                            } else if (document.querySelector("#select2").checked) {
                                console.log("일반회원 추가");
                                document.querySelector('input[name="memberClass"]').value = 0;
                                let signup = { id : document.querySelector("input[name='id']").value,
                                    pwd : document.querySelector("input[name='pwd']").value,
                                    nickName : document.querySelector("input[name='nickName']").value,
                                    emailAdd : document.querySelector("input[name='emailAdd']").value,
                                    telNum : document.querySelector("input[name='telNum']").value,
                                    memberClass : document.querySelector("input[name='memberClass']").value}
                                $.ajax({
                                    type: "post",
                                    url: "${contextPath}/ajaxconn/signup.do",
                                    contentType: "application/json",
                                    data: JSON.stringify(signup),
                                    success: function(data, textStatus){
                                        eval(data); 
                                    }
                                })
                            } else if (!(document.querySelector("#select2").checked)
                                && !(document.querySelector("#select").checked)) {
                                alert("가입형태를 선택해주세요.(관리자 또는 일반회원)");
                            }
                        } else {
                            alert("필수(*) 가입정보를 입력해주세요.");
                        }
                })

            })

            
            // =================== 회원가입 버튼 클릭 end ===================

            function joinbtn() {
                ////각각 클릭이벤트에 필요한 요소 잡아온것.
                let jbtn = document.querySelector(".jp1Btn1.b");
                let num1pg = document.querySelector(".joinpg1");
                let num2pg = document.querySelector(".joinpg2");

                //가입하기 버튼을 누르면, evt이벤트가 발생.
                jbtn.addEventListener("click", function (evt) {
                    //1번 메인메뉴가 사라지면서,
                    num1pg.style.display = 'none';
                    //2번메뉴가 나오는거
                    num2pg.style.display = 'block';
                });
            }
            // 약관 동의에서 다음 버튼
            function nextbtn() {
                let jbtn = document.querySelector(".jp1Btn2.b");
                let num2pg = document.querySelector(".joinpg2");
                let num3pg = document.querySelector(".joinpg3");
                let termsOfServiceChkBox = document.querySelectorAll("input[name='check']");

                jbtn.addEventListener("click", function (evt) {
                    // 필수 약관 동의 여부 체크 포함
                    if (termsOfServiceChkBox[0].checked && termsOfServiceChkBox[1].checked) {
                        num2pg.style.display = 'none';
                        num3pg.style.display = 'block';
                        // 디폴트로 일반회원 강제
                        document.querySelector("#select2").checked = true;
                        document.querySelector('input[name="memberClass"]').value = "일반회원";
                        document.querySelector("input[name='memberClass']").readOnly = true;
                    } else {
                        alert("필수 약관 사항들에 대한 동의가 필요합니다.");
                    }

                });
            }

            // 약관 동의에서 뒤로가기 버튼
            function back() {
                ////각각 클릭이벤트에 필요한 요소 잡아온것.
                let jbtn = document.querySelector(".jp1Btn2.a");
                let num1pg = document.querySelector(".joinpg1");
                let num2pg = document.querySelector(".joinpg2");

                //가입하기 버튼을 누르면, evt이벤트가 발생.
                jbtn.addEventListener("click", function (evt) {
                    //2번 메인메뉴가 사라지면서,
                    num2pg.style.display = 'none';
                    //1번 메뉴가 나오는거
                    num1pg.style.display = 'block';
                });
            }

            // 회원정보에서 다음 버튼
            function nextbtn2() {
                let jbtn = document.querySelector(".jp1Btn3.b");
                let num3pg = document.querySelector(".joinpg3");
                let num4pg = document.querySelector(".completion");

                jbtn.addEventListener("click", function () {
                    num3pg.style.display = 'none';
                    num4pg.style.display = 'block';
                })
            };

            // 회원정보에서 뒤로가기 버튼
            function back2() {
                ////각각 클릭이벤트에 필요한 요소 잡아온것.
                let jbtn = document.querySelector(".jp1Btn3.a");
                let num2pg = document.querySelector(".joinpg2");
                let num3pg = document.querySelector(".joinpg3");

                //가입하기 버튼을 누르면, evt이벤트가 발생.
                jbtn.addEventListener("click", function (evt) {
                    //1번 메인메뉴가 사라지면서,
                    num3pg.style.display = 'none';
                    //2번메뉴가 나오는거
                    num2pg.style.display = 'block';
                });

            }
            
            // 일반회원, 관리자 가입 버튼 선택 반응
            document.querySelector("#select").addEventListener("click", function() {
                document.querySelector("input[name='memberClass']").readOnly = false;
                document.querySelector('input[name="memberClass"]').value = "";
                document.querySelector("input[name='memberClass']").setAttribute("name", "rn_ForAdminAdd");
            })
            document.querySelector("#select2").addEventListener("click", function() {
            	document.querySelector("input[name='rn_ForAdminAdd']").setAttribute("name", "memberClass");
                document.querySelector("input[name='memberClass']").readOnly = true;
                document.querySelector('input[name="memberClass"]').value = "일반회원";
            })
            
            
        let firstBackButton = document.querySelector("input[class='jp1Btn1 a']");
            
            firstBackButton.addEventListener("click", function() {
            	location.href="${contextPath}/member/login";
            })
        }
        
    </script>

    <style>
        /* 최종로그인 완성본틀(fixed) */
        .divEve {
            width: 680px;
            height: 800px;
            margin-left: 500px;
/*             margin-top: 50px; */
            position: absolute;
        }

        /* 왼쪽 다이어리 공간 */
        .squre4 {
            width: 500px;
            height: 700px;
            background-color: rgb(255, 255, 255);
            border: 7px solid black;
            position: absolute;
            top: 80px;
            right: 610px;
            transform: skewY(1deg);
        }

        /* 메인 로그인부분 // 오른쪽 다이어리 공간 */
        .lpgmain {
            border: 9px solid black;
            width: 500px;
            height: 700px;
            margin-left: 70px;
            margin-top: 80px;
            /* 책 표지에 색상을 넣고 싶을 때 ↓↓↓↓↓ 색상 변경하세요. */
            background-color: rgb(233, 247, 215);
        }

        /* 3개의 대각선 */
        .lpgdiagLT,
        .lpgdiagRT,
        .lpgdiagRB {
            width: 75px;
            height: 5px;
            background-color: black;
            position: absolute;
        }

        .lpgdiagLT {
            height: 8px;
            left: 62px;
            top: 52px;
            transform: rotate(-45deg);
        }

        .lpgdiagRT {
            left: 570px;
            top: 55px;
            transform: rotate(-45deg);
        }

        .lpgdiagRB {
            left: 571px;
            top: 763px;
            transform: rotate(-45deg);
        }

        /* 3개의 위 직선 */
        .lpgTLine1,
        .lpgTLine2,
        .lpgTLine3 {
            width: 513px;
            height: 3px;
            background-color: black;
            position: absolute;
            z-index: 2;
        }

        .lpgTLine1 {
            top: 60px;
            left: 90px;
        }

        .lpgTLine2 {
            top: 44px;
            left: 106px;
        }

        .lpgTLine3 {
            height: 9px;
            top: 26px;
            left: 123px;
        }

        /* 3개의 우측 직선 */
        .lpgRLine1,
        .lpgRLine2 {
            width: 3px;
            height: 710px;
            background-color: black;
            position: absolute;
        }

        .lpgRLine1 {
            top: 65px;
            left: 600px;
        }

        .lpgRLine2 {
            top: 45px;
            left: 618px;
        }

        .lpgRLine3 {
            width: 9px;
            height: 720px;
            background-color: black;
            position: absolute;
            top: 26px;
            left: 631px;
        }

        /* 좌측 원, 선 */
        .lpgLLine1 {
            width: 6px;
            height: 25px;
            background-color: black;
            position: absolute;
            top: 60px;
            left: 30px;
        }

        .circleHLT1 {
            width: 90px;
            height: 47px;
            position: absolute;
            top: 26px;
            left: 30px;
            border: 7px solid black;
            border-radius: 40px 0px 0px 25px;
            border-right: 0px solid rgba(255, 255, 255, 0);
        }

        /* 포스트잇 */
        .lpgRLine1 .post1.It1 {
            width: 60px;
            height: 37px;
            position: absolute;
            z-index: 3;
            top: 40px;
            border-radius: 0px 80px 80px 0px;
            background-color: #FF9A9A;
        }

        .lpgRLine1 .post1.It2 {
            width: 60px;
            height: 37px;
            position: relative;
            z-index: 2;
            top: 80px;
            left: 10px;
            border-radius: 0px 80px 80px 0px;
            background-color: #FFCCAA;
        }

        .lpgRLine2 .post2.It3 {
            width: 60px;
            height: 37px;
            position: relative;
            z-index: 1;
            top: 140px;
            border-radius: 0px 80px 80px 0px;
            background-color: #FFFFCA;
        }

        .lpgRLine1 .post1.It4 {
            width: 60px;
            height: 37px;
            position: relative;
            z-index: 2;
            top: 130px;
            left: 10px;
            border-radius: 0px 80px 80px 0px;
            background-color: #DCEDCA;
        }

        /* 똑딱이 */
        .lockHC {
            width: 90px;
            height: 101px;
            position: absolute;
            top: 332px;
            left: 688px;
            border: 6px solid black;
            border-left: 0px solid rgba(255, 255, 255, 0);
            border-radius: 0px 50px 50px 0px;
            background-color: rgb(184, 197, 168);
            transform: skewX(-5deg);
            z-index: 1;
        }

        .lockQA {
            width: 52px;
            height: 101px;
            border: 6px solid black;
            border-right: 0px solid rgba(255, 255, 255, 0);
            position: absolute;
            top: 342px;
            left: 638px;
            background-color: rgb(236, 245, 224);
            transform: skewY(-20deg);
            z-index: 2;
        }

        .join {
            margin: 40px auto;
            text-align: center;
            background-color: white;
            width: 400px;
            padding: 20px;
        }

        .menu {
            color: rgb(150, 150, 150);
            font-size: 23px;
            text-align: center;
            margin: auto;
            height: 90px;
            line-height: 90px;
            font-weight: 600;
            width: 200px;
        }

        .menu:hover {
            cursor: pointer;
            margin-left: 150px;
            color: rgb(28, 92, 28);
        }

        /* 가입 페이지 메뉴-------------------------------------------------------------------------------------------------------*/
        .joinInfo {
            width: 150px;
            margin-left: 120px;
            margin-top: 80px;
        }

        .joinInfom {
            font-size: 20px;
            font-style: italic;
            font-weight: bold;
            width: 150px;
            padding: 10px;
            text-align: center;
            border-radius: 50%;
            background-color: rgb(139, 173, 120);
            /* cursor: pointer;; */
        }

        .j1 {
            margin-bottom: 50px;
            margin-left: 40px;
        }

        .j2 {
            margin-bottom: 50px;
            margin-left: 40px;
        }

        .j3 {
            margin-bottom: 50px;
            margin-left: 40px;
        }

        .j4 {
            margin-left: 40px;
        }

        /*----------------------------------------------회원가입 시작---------------------------------------------------------------*/
        /* .joinpg1 {
    display: none;
} */

        /* 로고 */
        .syl {
            width: 250px;
            margin-bottom: 50px;
            border: 3px dotted rgb(96, 138, 102);
            border-radius: 100px;
            border-width: 5px;
            padding-left: 5px 15px;
        }

        .joinsyl {
            width: 300px;
        }

        .signUp {
            margin-top: 50px;
            margin-left: 100px;
        }

        .s1_p {
            margin-top: 20px;
            border-top: 3px solid rgb(28, 92, 28);
            border-bottom: 2px solid rgb(28, 92, 28);
            width: 300px;
            height: 40px;
            /* margin-left: 40px; */
        }

        .s1 {
            font-size: 25px;
            font-weight: bold;
            font-style: italic;
            color: rgb(28, 92, 28);
            padding-top: 5px;
            padding-left: 65px;
        }

        .sAll_p {
            text-align: center;
            margin-top: 20px;
            padding-left: 15px;
        }

        .s2 {
            width: 270px;
            font-size: 15px;
            font-weight: bolder;
            margin-bottom: 5px;
            font-style: italic;
        }

        .s3 {
            width: 270px;
            font-size: 13px;
            margin-bottom: 5px;
            font-style: italic;
        }

        .s4 {
            width: 270px;
            font-size: 13px;
            margin-bottom: 5px;
            font-style: italic;
        }

        .s5 {
            width: 270px;
            font-size: 13px;
            margin-bottom: 5px;
            font-style: italic;
        }

        .s6 {
            width: 270px;
            font-size: 13px;
            font-style: italic;
        }

        .setyou {
            width: 170px;
            margin-top: 50px;
        }

        .jp1 {
            margin-top: 40px;
            margin-bottom: 40px;
            font-size: 20px;
            border-bottom: rgb(153, 172, 152) 2px double;
            border-width: 10px;
            padding-bottom: 80px;
            padding-left: 140px;
            color: rgb(28, 92, 28);
            font-weight: bolder;
        }

        .jp1Btn {
            display: flex;
            margin-left: 60px;
        }

        .jp1Btn1 {
            width: 150px;
            margin: 0px 25px;
            height: 45px;
            border: none;
            font-weight: 900;
            border-radius: 4px;
            font-size: 15px;
        }

        .jp1Btn1.a {
            background-color: rgb(255, 255, 255);
            color: rgb(38, 77, 38);
        }

        .jp1Btn1.b {
            background-color: rgb(38, 77, 38);
            color: white;
        }

        /* 약관 동의 페이지------------------------------------------------------------------------------------------- */
        .joinpg2 {
            text-align: center;
            display: none;
        }

        .joinTitle {
            /* 약관 동의 */
            font-size: 20px;
            color: rgb(28, 92, 28);
            font-weight: 900;
            border-top: 3px solid rgb(28, 92, 28);
            border-bottom: 1px solid rgb(28, 92, 28);
            width: 200px;
            margin: 30px auto;
            margin-bottom: 15px;
            height: 35px;
            line-height: 35px;
        }

        .joinContents {
            margin: 30px auto;
        }

        .joinsub {
            font-weight: 900;
            margin: 15px auto;
            display: inline-block;
            text-align: right;
            font-size: 14px;
            margin-left: 180px;
            width: 220px;
            color: rgb(76, 85, 75);
        }

        .txt {
            width: 370px;
            height: 30px;
            text-align: center;
            margin: 0px auto;
            overflow: scroll;
            overflow-x: hidden;
            margin-bottom: 20px;
            background-color: rgb(85, 114, 90);
            color: white;
            padding: 20px;
            font-size: 13px;
        }

        .joinsubF {
            font-size: 15px;
            font-weight: 900;
            margin: 10px auto;
            display: inline-block;
            margin-bottom: 0px;
            padding-bottom: 3px;
            border-bottom: 2px solid rgb(85, 114, 90);
        }

        .jp1Btn2 {
            width: 130px;
            height: 40px;
            border: none;
            font-weight: 900;
            border-radius: 4px;
            font-size: 15px;
            margin-bottom: 20px;
        }

        .jp1Btn2.a {
            background-color: rgb(255, 255, 255);
            color: rgb(38, 77, 38);
            /* margin-left:px; */
        }

        .jp1Btn2.b {
            background-color: rgb(38, 77, 38);
            color: white;
            margin-left: 20px;
        }

        .jpsetyou2 {
            width: 170px;
        }

        /* 회원 정보 페이지----------------------------------------------------------------------------------------------*/
        .joinpg3 {
            display: none;
        }

        .joinTitle {
            text-align: center;
        }

        .infosub {
            text-align: right;
            font-size: 12px;
            margin: 5px 40px;
            font-weight: 900;
            color: rgb(130, 150, 128);
            margin-top: 10px;
        }

        .info {
            /* border: solid 1px red; */
            width: 450px;
            margin-left: 15px;
        }

        .infoname {
            display: inline-block;
            width: 120px;
            margin: 20px 0px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-right: 20px;
            text-align: right;
            font-weight: 900;
            font-size: 14px;
        }

        .infotxt {
            margin-left: 70px;
            height: 25px;
            width: 200px;
            border: none;
        }

        #signUpForm {
            margin-top: 10px;
        }

        .jp1Btn3 {
            width: 130px;
            margin-top: 20px;
            height: 40px;
            border: none;
            font-weight: 900;
            border-radius: 4px;
            font-size: 15px;
            margin-bottom: 20px;
        }

        .jp1Btn3.a {
            background-color: rgb(255, 255, 255);
            color: rgb(38, 77, 38);
            margin-left: 60px;
        }

        .jp1Btn3.b {
            background-color: rgb(38, 77, 38);
            color: white;
            margin-left: 50px;
        }

        .info form {
            margin-left: 30px;
            margin-top: 20px;
        }

        .r_title {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
            margin-top: 10px;
        }

        .r_title2 {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
        }

        .r_title3 {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
        }

        .r_title4 {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
        }

        .r_title5 {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
        }

        .r_title6 {
            display: inline-block;
            width: 70px;
            height: 35px;
            border-right: 3px solid rgb(179, 192, 172);
            padding-top: 10px;
            padding-right: 20px;
            text-align: center;
            font-weight: 900;
            font-size: 16px;
            vertical-align: top;
            margin-right: 25px;
        }

        .r_id {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block;
            margin-top: 10px;
        }

        .r_id input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_pw {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block
        }

        .r_pw input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_nick {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block
        }

        .r_nick input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_email {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block
        }

        .r_email input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_tel {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block
        }

        .r_tel input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_tel input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .r_memberClass {
            width: 280px;
            height: 50px;
            background-color: #b9ceac;
            margin-bottom: 20px;
            display: inline-block
        }

        .r_memberClass input {
            width: 230px;
            height: 30px;
            margin-left: 18px;
            margin-top: 7px;
            background-color: rgba(255, 255, 255, 0.296);
        }

        .info_btn input {
            margin-left: 23px;
            width: 100px;
            height: 40px;
            background-color: #addbc4;
            border-radius: 50%;
        }

        .num3 {
            width: 50px;
            height: 300px;
        }

        .setyou {
            margin-top: 0px;
            margin-left: 160px;
        }

        /* 가입 완료 페이지-------------------------------------------------------------------------------------------------------- */
        .completion {
            display: none;
        }

        .comsyl {
            width: 250px;
            margin: 35px auto;
            margin-left: 130px;
        }

        .txtarea {
            margin: 10px auto;
            border-top: double 6px rgb(141, 161, 142);
            border-bottom: double 6px rgb(141, 161, 142);
            /* height: 200px; */
            padding-top: 30px;
        }

        .cj1_p {
            border-top: 3px solid rgb(28, 92, 28);
            border-bottom: 2px solid rgb(28, 92, 28);
            width: 300px;
            height: 30px;
            margin-left: 90px;
        }

        .cj1 {
            font-size: 25px;
            font-weight: bold;
            font-style: italic;
            color: rgb(28, 92, 28);
            width: 200px;
            text-align: center;
            margin-left: 40px;
        }

        .cj2 {
            margin-top: 40px;
            text-align: center;
        }

        .cj3 {
            margin-top: 30px;
            padding-left: 120px;
        }

        .cj4 {
            margin-top: 20px;
            padding-left: 160px;
        }

        .cj5 {
            margin-top: 20px;
            padding-left: 190px;
            padding-bottom: 80px;
        }

        .jp1Btn4 {
            width: 150px;
            margin-top: 40px;
            height: 50px;
            border: none;
            font-weight: 900;
            border-radius: 4px;
            font-size: 15px;
            margin-bottom: 40px;
        }

        .jp1Btn4.a {
            background-color: rgb(255, 255, 255);
            color: rgb(38, 77, 38);
            margin-left: 80px;
        }

        .jp1Btn4.b {
            background-color: rgb(38, 77, 38);
            color: white;
            margin-left: 40px;
        }

        .select input[type=radio]+label {
            display: inline-block;
            cursor: pointer;
            height: 24px;
            width: 90px;
            border: 1px solid #333;
            line-height: 24px;
            text-align: center;
            font-weight: bold;
            font-size: 13px;
        }

        .select {
            padding: 5px 10px;
            text-align: center;
        }

        .select input[type=radio] {
            display: none;
        }

        .select input[type=radio]+label {
            background-color: #fff;
            color: #333;
        }

        .select input[type=radio]:checked+label {
            background-color: #333;
            color: #fff;
        }
    </style>

</head>


<body>
    <!-- 최종로그인 완성본틀(fixed) -->
    <div class="divEve">
        <!-- 왼쪽 다이어리 공간 -->
        <div class="squre4">
            <div class="joinInfo">
                <img class="syl" src="/syl/resources/photo/3syl.png">
                <div class="joinInfom j1">1. 회원가입</div>
                <div class="joinInfom j2">2. 약관동의</div>
                <div class="joinInfom j3">3. 회원정보</div>
                <div class="joinInfom j4">4. 가입완료</div>
            </div>
        </div>
        <!-- 다이어리 로그인 메인틀 / 오른쪽 다이어리 공간-->
        <div class="lpgmain">

            <!-- 가입 -->
            <div class="joinpg1">
                <div class="signUp">
                    <img class="joinsyl" src="/syl/resources/photo/3syl.png">
                    <div class="s1_p">
                        <div class="signUup s1">여행자 등록 준비</div>
                    </div>
                    <div class="sAll_p">
                        <div class="signUup s2">3SYL에 방문하신 여러분을 환영합니다.</div>
                        <div class="signUup s3">나만을 위한 다이어리 서비스를 위한</div>
                        <div class="signUup s4">나만의 계정을 만들어 보세요.</div>
                        <div class="signUup s5">지금부터 추억여행을 위한</div>
                        <div class="signUup s6">새로운 추억여행자님의</div>
                    </div>
                </div>
                <div class="jp1">기본 정보 설정을 시작합니다.</div>
                <div class="jp1Btn">
                    <input class="jp1Btn1 a" type="button" value="뒤로가기"> <input class="jp1Btn1 b" type="button"
                        value="가입하기">
                </div>

            </div>

            <!-- 약관 동의 -->
            <div class="joinpg2">
                <div class="joinTitle">약관 동의</div>

                <div class="joinContents">
                    <div class="joinsub">이용약관 동의(필수)</div>
                    <input class="joinpg2C" type="checkbox" name="check">

                    <div class="txt">
                        여러분을 환영합니다.<br> 3SYL 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. <br>
                        <br> 본 약관은 다양한 3SYL 서비스의 이용과 관련하여 3SYL 서비스를 제공하는 3SYL 주식회사(이하
                        ‘3SYL’)와 이를 이용하는 3SYL 서비스 회원(이하 ‘회원’)또는 비회원과의 관계를 설명하며,아울러 여러분의
                        3SYL 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. <br>
                        <br> 3SYL 서비스를 이용하시거나 3SYL 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영
                        정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
                    </div>

                    <div class="joinsub">개인정보 수집 및 이용 동의(필수)</div>
                    <input class="joinpg2C" type="checkbox" name="check">

                    <div class="txt">
                        개인정보보호법에 따라 3SYL에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적,
                        개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후
                        동의하여 주시기 바랍니다.<br>
                        <br> 1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 3SYL
                        서비스를 회원과 동일하게 이용 할 수 있습니다. 이용자가 캘린더, 투두리스트, 일기장 등과 같이 개인화 혹은 회원제
                        서비스를 이용하기 위해 회원가입을 할 경우, 3SYL는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
                    </div>

                    <div class="joinsub">프로모션 정보 수신 동의(선택)</div>
                    <input class="joinpg2C" type="checkbox" name="check">

                    <div class="txt">
                        3SYL에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(3SYL앱 알림 또는 문자), 이메일로 받아보실 수
                        있습니다.<br>
                        <br> 일부 서비스(별도 회원 체계로 운영하거나 3SYL 가입 이후 추가 가입하여 이용하는 서비스 등)의
                        경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를
                        받습니다.
                    </div>

                    <div class="joinsubF">3SYL 이용약관, 개인정보 수집 및 이용에 모두 동의합니다</div>
                    <input id="joinpg2All" type="checkbox" name="checkAll">
                </div>
                <div>
                    <input class="jp1Btn2 a" type="button" value="뒤로가기"> <input class="jp1Btn2 b" type="button"
                        value="다음">
                </div>
                <img class="jpsetyou2" src="/syl/resources/photo/3syl2.png">
            </div>

            <!-- 회원 정보 -->
            <div class="joinpg3">
                <div class="joinTitle">회원 정보</div>
                <div class="infosub">' * ' 은 필수 입력 항목입니다</div>
                <div class="info">

                    <form id="signUpForm" name="signUpForm">
                        <div>
                            <div class="r_title">아이디*</div>
                            <div class="r_id mandatoryInfo">
                                <input type="text" name="id" placeholder="최대 20글자" maxlength="20">
                            </div>
                        </div>
                        <div>
                            <div class="r_title2">비밀번호*</div>
                            <div class="r_pw mandatoryInfo">
                                <input type="password" name="pwd" placeholder="최대 30글자" maxlength="30">
                            </div>
                        </div>
                        <div>
                            <div class="r_title3">닉네임*</div>
                            <div class="r_nick mandatoryInfo">
                                <input type="text" name="nickName" placeholder="최대 20글자" maxlength="20">
                            </div>
                        </div>
                        <div>
                            <div class="r_title4">이메일*</div>
                            <div class="r_email mandatoryInfo">
                                <input type="text" name="emailAdd" placeholder="ex) user@company.com" maxlength="50">
                            </div>
                        </div>
                        <div>
                            <div class="r_title5">휴대폰<br>번호*</div>
                            <div class="r_tel mandatoryInfo">
                                <input type="text" name="telNum" placeholder="ex) 01077774444 ' - (하이픈)' 제외"
                                    maxlength="11">
                            </div>
                        </div>
                        <div>
                            <div class="r_title6">관리자<br>등록 코드</div>
                            <div class="r_memberClass MandatoryInfo">
                                <input type="text" name="memberClass" placeholder="" maxlength="4">
                            </div>
                        </div>
                        <div></div>
                        <div class="select">
                            <input type="radio" id="select" name="position"><label for="select">관리자</label> <input
                                type="radio" id="select2" name="position" checked="checked"><label
                                for="select2">일반회원</label> <input type="hidden" name="auth" value="">
                        </div>
                        <input class="jp1Btn3 a" type="button" value="뒤로가기"> <input id="submitBtn" class="jp1Btn3 b" type="button"
                            value="다음">
                    </form>

                    <img class="setyou" src="/syl/resources/photo/3syl2.png">
                </div>
            </div>

        </div>
        <!-- 3개의 대각선 -->
        <div class="lpgdiagLT"></div>
        <div class="lpgdiagRT"></div>
        <div class="lpgdiagRB"></div>
        <!-- 3개의 위 직선 -->
        <div class="lpgTLine1"></div>
        <div class="lpgTLine2"></div>
        <div class="lpgTLine3"></div>
        <!-- 3개의 우측 직선 -->
        <div class="lpgRLine1">
            <!-- 포스트잇 -->

            <div class="post1 It1"></div>
            <div class="post1 It2"></div>
            <div class="post1 It4"></div>
        </div>
        <div class="lpgRLine2">
            <!-- 포스트잇 -->
            <div class="post2 It3"></div>
        </div>
        <div class="lpgRLine3"></div>
        <!-- 좌측 책표지 중심 구현 -->
        <div class="circleHLT1"></div>
        <div class="lpgLLine1"></div>
        <div class="circleLine"></div>

        <!-- 다이어리 여닫이-똑딱이 -->
        <div class="lockQA"></div>
        <div class="lockHC"></div>
        <div class="lock"></div>

    </div>
</body>

</html>