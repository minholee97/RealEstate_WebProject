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
        	const pass1 = $('#pass1').val();
        	const pass2 = $('#pass2').val();
        	if (pass1 == "" || pass2 == "") {
        		alert("모든 필드를 입력해주세요");
        	} else if (pass1 != pass2) {
        		alert("두 입력이 일치하지 않습니다");
        	}
        	else {
        		var id = "<c:out value="${target}"/>";
        		const user = {
        			id : id,
        			pass : pass1
        		};
           	 	$.ajax({
            	    type: "post",
                	url: "${root}/updatePassword.do",
                	headers: {
                		"Content-Type" : "application/json",
                		"X-HTTP-Method-Override" : "POST"
                	},
                	dataType: 'text',
                	data: JSON.stringify(user),
            		success: function(data) {
            				alert("비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
            				self.location = '${root}/';
            			
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
        <h2>Forgot your password?</h2>
        <h6>Please enter the ID you use to sign in</h6>
      </div>
      <form id="form-login">
			<input id="pass1" type="password" name="pass1" placeholder="새 비밀번호"/>
			<input id="pass2" type="password" name="pass2" placeholder="새 비밀번호 확인"/> 
	  </form>
	 <button class="button-default" id="submit">찾기</button>
    </div>
  </div>  
  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>
</body>