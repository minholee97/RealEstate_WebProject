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
  <jsp:include page="header.jsp"/>
  <div class="wrapper">
      <div class="container bg-light p-5">
        <h2>Happy House를 소개합니다</h2>
        <p>&nbsp;</p>
        <p>Happy House는 믿을 수 있는 부동산 정보 서비스로 찾고있는 집을 지도를 통해 한눈에 확인할 수 있는 서비스입니다.</p>
  		
  <div class="intro intro-carousel swiper position-relative" style="height:600px">
    <div class="swiper-wrapper">
      <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/example.JPG)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">
                      <br>
                    </p>
                    <h1 class="intro-title mb-4 ">
                      <span class="color-b"> 당신의 집을</span>
                      <br>  찾아드립니다.
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a"></span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
 <!--  -->
       <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/example2.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">
                      <br>
                    </p>
                    <h1 class="intro-title mb-4 ">
                      <span class="color-b"> 당신의 집을</span>
                      <br>  찾아드립니다.
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a"></span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
 <!--  -->
 	  <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/example3.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">
                      <br>
                    </p>
                    <h1 class="intro-title mb-4 ">
                      <span class="color-b"> 당신의 집을</span>
                      <br>  찾아드립니다.
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a"></span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<!--  -->

    </div>
    <div class="swiper-pagination"></div>
  		
  		
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