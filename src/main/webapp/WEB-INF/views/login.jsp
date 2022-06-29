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
        	if (id == "" || password == "") {
        		alert("모든 필드를 입력해주세요");
        	}
        	else {
        		const user = {
        			id: id,
        			password: password
        		};
           	 	$.ajax({
            	    type: "post",
                	url: "${root}/login.do",
                	headers: {
                		"Content-Type" : "application/json",
                		"X-HTTP-Method-Override" : "POST"
                	},
                	dataType: 'text',
                	data: JSON.stringify(user),
            		success: function(data) {
            			if (data == "success") {
            				self.location = '${root}/';
            			} else {
            				alert("ID 또는 Password를 다시 확인해주세요.");
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
      <div class="wrapper-title">
        <h2>Sign In</h2>
      </div>
      <!-- Login Form -->
      <form id="form-login">
			<input id="id" type="text" name="id" placeholder="아이디"/> 
			<input id="password" type="password" name="password" placeholder="비밀번호" /> 
	  </form>
	 <button class="button-default" id="submit">로그인</button>
	  
	  
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
</body>