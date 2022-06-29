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
  <link href="${root}/img/favicon.png" rel="icon">
  <link href="${root}/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${root}/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${root}/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${root}/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${root}/css/style.css" rel="stylesheet">

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
            	    type: "PUT",
                	url: "${root}/update.do",
                	headers: {
                		"Content-Type" : "application/json",
                		"X-HTTP-Method-Override" : "PUT"
                	},
                	dataType: 'text',
                	data: JSON.stringify(user),
            		success: function(data) {
            			if (data == "success") {
            				self.location = '${root}/usermanage.do';
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
	<jsp:include page="header.jsp" />
    <div class="wrapper">
        <div id="formContent">
            <!-- Tabs Titles -->
            <!-- Icon -->
            <div class="wrapper-title">
                <h2>회원 정보 수정</h2>
            </div>

            <!-- Login Form -->
            <form id="form-update">
            	<input type="hidden" name="act" value='modify' /> 
                <input type="text" id="id" name="id" value=<c:out value="${target}"/> readonly>
                <input type="text" id="password" name="pass" placeholder="비밀번호">
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
	 		<button class="button-default" id="submit">수정</button>
        </div>
    </div>
  <!-- Vendor JS Files -->
  <script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${root}/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${root}/js/main.js"></script>
  <script type="text/javascript" src="${root}/js/areaData.js"></script>
  <script type="text/javascript" src="${root}/js/userinfo-update.js"></script>
</body>