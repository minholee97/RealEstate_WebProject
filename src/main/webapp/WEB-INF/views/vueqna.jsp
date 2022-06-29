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
  
  <script defer="defer" type="module" src="${root}/js/chunk-vendors.570ccea2.js"></script>
  <script defer="defer" type="module" src="${root}/js/app.48c23510.js"></script>
  <link href="${root}/css/chunk-vendors.0833f3cd.css" rel="stylesheet">
  <link href="${root}/css/app.da04779e.css" rel="stylesheet">
  <script defer="defer" src="${root}/js/chunk-vendors-legacy.c3411793.js" nomodule></script>
  <script defer="defer" src="${root}/js/app-legacy.66b587b1.js" nomodule></script>

</head>

<body>
	<jsp:include page="header.jsp" />
    <div class="wrapper">
		<div class="container bg-white p-5">
			<h3>QnA</h3>
			<div id="app"></div>
		</div>
    </div>
  <!-- Vendor JS Files -->
  <script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${root}/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${root}/js/main.js"></script>
  <script type="text/javascript" src="${root}/js/areaData.js"></script>
</body>