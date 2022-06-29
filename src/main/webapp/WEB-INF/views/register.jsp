<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Happy House</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="css/style.css" rel="stylesheet">

  <script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>

<script>
    $(function(){
        $('#submit').on("click",function () {
        	const id = $('#id').val();
        	const password = $('#password').val();
        	const name = $('#name').val();
        	const email = $('#email').val();
        	const phone = $('#phone').val();
        	const sido2 = $('#sido2').val();
        	const sigugun2 = $('#sigugun2').val();
        	const dong2 = $('#dong2').val();
        	if (id == "" || password == "" || name == "" || email == "" || phone == "" || sido2 == "" || sigugun2 == "" || dong2 == "") {
        		alert("모든 필드를 입력해주세요");
        	}
        	else {
        		const user = {
        			id: id,
        			password: password,
        			name: name,
        			email: email,
        			phone: phone,
        			sido: sido2,
        			sigugun: sigugun2,
        			dong: dong2
        		};
           	 	$.ajax({
            	    type: "post",
                	url: "${root}/regist.do",
                	headers: {
                		"Content-Type" : "application/json",
                		"X-HTTP-Method-Override" : "POST"
                	},
                	dataType: 'text',
                	data: JSON.stringify(user),
            		success: function(data) {
            			if (data == "success") {
            				self.location = '${root}/';
            			} else if(data == "dup_id") {
            				alert("중복된 아이디 입니다.");
            			}
            			else {
            				alert("입력 값을 다시 확인해주세요.");
            			}
            		}
           	    }) 
        	}
        });
    });
</script>

</head>

<body>
    <jsp:include page="header.jsp"/>
    <div class="wrapper">
        <div id="formContent">
            <!-- Tabs Titles -->
            <!-- Icon -->
            <div class="wrapper-title">
                <h2>Sign Up</h2>
            </div>

            <!-- Login Form -->
            <form id="form-register">
                <input type="text" id="id" name="id" placeholder="아이디">
                <input type="password" id="password" name="password" placeholder="비밀번호">
                <input type="text" id="name" name="name" placeholder="이름">
                <input type="text" id="email" name="email" placeholder="이메일">
                <input type="text" id="phone" name="phone" placeholder="전화번호">

                <select class="select-city form-control form-select form-control-a" id="sido2" name="sido">
                    <option value="">시/도</option>
                </select>
                <select class="select-city form-control form-select form-control-a" id="sigugun2" name="gugun">
                    <option value="">시/군/구</option>
                </select>
                <select class="select-city form-control form-select form-control-a" id="dong2" name="dong">
                    <option value="">읍/면/동</option>
                </select>
            </form>
	 		<button class="button-default" id="submit">회원 가입</button>

            <!-- Remind Passowrd -->
            <div id="formFooter">
                <a class="underlineHover" href="${root}/passwordForm.do">Forgot Password?</a>
            </div>

        </div>
    </div>
    
  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>
  <script type="text/javascript" src="js/areaData.js"></script>
  <script type="text/javascript" src="js/register.js"></script>

</body>