
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${root}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${root}/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${root}/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>

<link href="${root}/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${root}/js/main.js"></script>
<script type="text/javascript" src="${root}/js/header.js"></script>
<script type="text/javascript" src="${root}/js/areaData.js"></script>
<script>
	$(document).ready(function() {
		$("#searchBtn").click(function() {
			var type = $("#type").val();
			var sido = $("#sido").val();
			var sigugun = $("#sigugun").val();
			var dong = $("#dong").val();
			if (sido == "" || sigugun == "" || dong == "") {
				alert("모든 필드를 입력해주세요");
			} else {
				var dongcode = sido + sigugun + dong + "00";
				$("#dealtype").val(type);
				$("#dongcode").val(dongcode);
				if (type == "" && sido == "" && sigugun == "") {
					alert("모든 목록 조회!!!");
				}
				$("#pageform").attr("action", "${root}/deal/list").submit();
			}
		});
	});
	$(function() {
		$('#toggle').on("click", function() {
			if ($('#navbarDefault').hasClass('show'))
				$('#navbarDefault').removeClass('show');
			else
				$('#navbarDefault').addClass('show');
		});
	});
</script>
<div class="click-closed"></div>
<div class="box-collapse">
	<div class="title-box-d">
		<h3 class="title-d">아파트 검색하기</h3>
	</div>
	<span class="close-box-collapse right-boxed bi bi-x"></span>
	<div class="container box-collapse-wrap form">
		<div class="row">
			<form name="pageform" id="pageform" method="GET" action="">
				<input type="hidden" name="pg" id="pg" value=""> <input
					type="hidden" name="dealtype" id="dealtype"> <input
					type="hidden" name="dongcode" id="dongcode">
			</form>
			<form method="get">
				<div class="my-3"></div>
				<div class="col-md-12 mb-2">
					<h5>동별 실거래가 조회하기</h5>
				</div>
				<label class="pb-2" for="Type">거래유형</label> <select
					class="form-control form-select form-control-a" name="type"
					id="type">
					<option value="0">모두</option>
					<option value="1">매매</option>
					<option value="2">전월세</option>
				</select>
				<div class="col-md-4 mb-2">
					<div class="form-group mt-3">
						<label class="pb-2" for="Type">시/도</label> <select
							class="form-control form-select form-control-a" id="sido"
							name="sido">
							<option value="">선택</option>
						</select>
					</div>
				</div>
				<div class="col-md-4 mb-2">
					<div class="form-group mt-3">
						<label class="pb-2" for="Type">시/군/구</label> <select
							class="form-control form-select form-control-a" id="sigugun"
							name="gugun">
							<option value="">선택</option>
						</select>
					</div>
				</div>
				<div class="col-md-4 mb-2">
					<div class="form-group mt-3">
						<label class="pb-2" for="city">읍/면/동</label> <select
							class="form-control form-select form-control-a" id="dong"
							name="dong">
							<option value="">선택</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
					<button type="button" id="searchBtn" class="btn btn-b">검색하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- ======= 네비바 ======= -->
<nav
	class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
	<div class="container">
		<button id="toggle" class="navbar-toggler collapsed" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarDefault"
			aria-controls="navbarDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span></span> <span></span> <span></span>
		</button>
		<img src="${root}/img/logo.png" width="100px"
			style="margin-right: 10px;"> <a class="navbar-brand text-brand"
			href="${root}/">Happy <span class="color-b">House</span></a>

		<div class="navbar-collapse collapse justify-content-center"
			id="navbarDefault">
			<ul class="navbar-nav">

				<li class="nav-item"><a class="nav-link " href="${root}/">홈</a></li>

				<li class="nav-item"><a class="nav-link "
					href="${root}/aboutForm.do">소개</a></li>

				<li class="nav-item"><a class="nav-link "
					href="${root}/noticeForm.do">공지사항</a></li>
				<li class="nav-item"><a class="nav-link " href="${root}/article/info?pg=1&key=&word=">정보마당</a></li>
				<c:choose>
					<c:when test="${empty user}">
						<li class="nav-item" id='loginNav'><a class="nav-link "
							href="${root}/loginForm.do">로그인</a></li>
						<li class="nav-item" id='registerNav'><a class="nav-link "
							href="${root}/registerForm.do">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link "
							href="${root}/vueqna">QNA</a></li>
						<c:choose>
							<c:when test="${user.id == 'admin'}">
				<li class="nav-item"><a class="nav-link " href="${root}/article/news">크롤링</a></li>
								<li class="nav-item" id='loginNav'><a class="nav-link "
									href="${root}/usermanage.do">회원관리</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" id='userNav'><a class="nav-link "
									href="${root}/mypageForm.do">마이페이지</a></li>
								<li class="nav-item" id='wishNav'><a class="nav-link "
									href="${root}/wishlist.do/${user.id}">관심매물</a></li>
							</c:otherwise>
						</c:choose>

						<li class="nav-item" id='logoutNav'><a class="nav-link"
							href="${root}/logout.do">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<button id="searchTabBtn" type="button"
			class="btn btn-b-n navbar-toggle-box navbar-toggle-box-collapse"
			data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
			<i class="bi bi-search"></i>
		</button>

	</div>
</nav>
<script>
	var msg = '${msg}';
	if (msg) {
		alert(msg);
	}
</script>
