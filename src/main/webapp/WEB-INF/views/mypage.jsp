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

</head>

<body>
	<jsp:include page="header.jsp" />
  <div class="wrapper">
    <div id="formContent">
      <div class="container mt-3">
        <h2>회원 정보 확인</h2>
        <table class="table table-bordered">
          <tbody>
            <tr>
              <td>아이디</td>
              <td id="td_id"><c:out value="${user.id}"/></td>
            </tr>
            <tr>
              <td>비밀번호</td>
              <td id="td_pw"><c:out value="${user.password}"/></td>
            </tr>
            <tr>
              <td>이름</td>
              <td id="td_name"><c:out value="${user.name}"/></td>
            </tr>
            <tr>
              <td>이메일</td>
              <td id="td_email"><c:out value="${user.email}"/></td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td id="td_phone"><c:out value="${user.phone}"/></td>
            </tr>
            <tr>
              <td>동코드</td>
              <td id="td_sido"><c:out value="${user.dongCode}"/></td>
            </tr>
          </tbody>
        </table>
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