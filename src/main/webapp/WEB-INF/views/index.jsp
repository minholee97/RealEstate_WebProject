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

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Gugi&family=IBM+Plex+Sans+KR:wght@500&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&family=Gowun+Dodum&family=Gugi&family=IBM+Plex+Sans+KR:wght@500&display=swap');

    span,
    h1,h3 {
      font-family: 'IBM Plex Sans KR', sans-serif;
    }

    button,
    p {
      font-family: 'Gothic A1', sans-serif;
    }
  </style>
</head>

<body>
  <jsp:include page="header.jsp"/>
  <div class="intro intro-carousel swiper position-relative">

    <div class="swiper-wrapper">

      <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/slide-1.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">서울특별시, 종로구
                      <br>
                    </p>
                    <h1 class="intro-title mb-4 ">
                      <span class="color-b">익선동 </span>
                      <br> 현대뜨레비앙
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/slide-2.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">서울특별시, 종로구
                      <br>
                    </p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b">명륜1가 </span>
                      <br> 건양하늘터
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide carousel-item-a intro-item bg-image"
        style="background-image: url(img/slide-3.jpg)">
        <div class="overlay overlay-a"></div>
        <div class="intro-content display-table">
          <div class="table-cell">
            <div class="container">
              <div class="row">
                <div class="col-lg-8">
                  <div class="intro-body">
                    <p class="intro-title-top">서울특별시, 중랑구
                      <br>
                    </p>
                    <h1 class="intro-title mb-4">
                      <span class="color-b">신내동 </span>
                      <br> 동성아파트
                    </h1>
                    <p class="intro-subtitle intro-price">
                      <a href="#"><span class="price-a">rent | $ 12.000</span></a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-pagination"></div>
  </div>

  <main id="main">

    <section class="section-services section-t8">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="title-wrap d-flex justify-content-between">
              <div class="title-box" style="margin-top: -50px;">
                <img src="img/ourService.png" width="100px" style="margin-right: 10px; margin-top: -10px;"  >
                <h2 class="title-a" style="margin-right: 10px; display: inline-block;">Our Services</h2>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="card-box-c foo"
              style="padding: 20px; border-width:10px;  
              border-style:inset; border-color: rgba(104, 192, 104, 0.472); border-radius: 10px; ">
              <div class="card-header-c d-flex">
                <img src="img/main1.jpg" width="200px" style="margin-right: 10px;">
                <div class="card-title-c align-self-center">
                  <h3 style="font-weight: bold">실거래가 조회</h3>
                </div>
              </div>
              <div class="card-body-c">
                <p class="content-c" style="color:rgb(0, 0, 0)">
                  아파트 전/월세, 매매 실거래가를 조회할 수 있습니다.
                </p>
              </div>
              <div class="card-footer-c">
                <a href="#" class="link-c link-icon">Read more
                  <span class="bi bi-chevron-right"></span>
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card-box-c foo"
            style="padding: 20px; border-width:10px;  
            border-style:inset; border-color: rgba(104, 192, 104, 0.472); border-radius: 10px; ">
              <div class="card-header-c d-flex">
                <img src="img/main2.jpg" width="132px" style="margin-right: 30px;">
                <div class=" card-title-c align-self-center">
                  <h3 style="font-weight: bold">지역 환경 정보 제공</h3>
                </div>
              </div>
              <div class="card-body-c">
                <p class="content-c" style="color:rgb(0, 0, 0)">
                  관심 지역에 관련한 환경 정보를 제공하고 있습니다.
                  <br />
                </p>
              </div>
              <div class="card-footer-c">
                <a href="#" class="link-c link-icon">Read more
                  <span class="bi bi-chevron-right"></span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- ======= Footer ======= -->
  <section class="section-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">Happy House</h3>
            </div>
            <div class="w-body-a">
              <p class="w-text-a color-text-a">

              </p>
            </div>
            <div class="w-footer-a">
              <ul class="list-unstyled">
                <li class="color-a">
                  <span class="color-text-a">Phone .</span> 010-XXXX-XXXX
                </li>
                <li class="color-a">
                  <span class="color-text-a">Email .</span> ssafy@ssafy.com
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-sm-12 col-md-6 section-md-t3">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">Site Map</h3>
            </div>
            <div class="w-body-a">
              <div class="w-body-a">
                <ul class="list-unstyled">
                  <li class="item-list-a">
                    <i class="bi bi-chevron-right"></i> <a href="#">Home</a>
                  </li>
                  <li class="item-list-a">
                    <i class="bi bi-chevron-right"></i> <a href="${root}/aboutForm.do">About Us</a>
                  </li>
                  <li class="item-list-a">
                    <i class="bi bi-chevron-right"></i> <a href="${root}/noticeForm.do">Notice</a>
                  </li>
                  <li class="item-list-a">
                    <i class="bi bi-chevron-right"></i> <a href="${root}/loginForm.do">Login</a>
                  </li>
                  <li class="item-list-a">
                    <i class="bi bi-chevron-right"></i> <a href="${root}/registerForm.do">Sign Up</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="copyright-footer">
            <p class="copyright color-text-a">
              &copy; Copyright
              
              <span class="color-a">HappyHouse</span> All Rights Reserved.
            </p>
          </div>
          <div class="credits">
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
      class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>

</body>

</html>