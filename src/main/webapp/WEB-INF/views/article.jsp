<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
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
</head>
<script type="text/javascript">
$(function() {
	let lst = [];
	<c:forEach var="article" items="${articleList}">
    lst.push(`${article}`);
	</c:forEach>
	$(".m-3.row.justify-content-center").on(
			'click',
			".page-item",
			function() {
				$("#pgpg").val(($(this).attr("data-pg")));
				$("#searchForm").attr("action", "${root}/article/info")
						.submit();
			});

	$("#articleItems").on('click', '#detailArticle', function() {
		var index = $(this).data('i');
		var temp = lst[index].split("title=")[1].split(", content=");
		var title= temp[0];
		var content = temp[1].split(", regdate=")[0];
		$("#modal-t").text(title);
		$("#modal-c").text(content); 
		$("#myModal").modal();
	});
	$(document).on("click", "#searchButton", function() {
		$("#key").val($("#doSel").val());
		$("#word").val($("#seWord").val());
		$("#searchForm").attr("action", "${root}/article/info").submit();
	});

})
</script>
<body>
  <jsp:include page="header.jsp"/>
  <div class="wrapper">
	<div class="container bg-light p-5">
		<h2>부동산 뉴스</h2>
		<p>부동산 뉴스는 매일 업데이트 됩니다.</p>
		<form action="" id="searchForm">
			<input type="hidden" name="key" id="key" value="${key }">
			<input type="hidden" name="word" id="word" value="${word }">
			<input type="hidden" name="pgpg" id="pgpg" value="">
		</form>
		<label class="pb-2" for="Type">검색조건</label> 
		<select class="form-control form-select form-control-a" name="doSel"
			id="doSel">
			<option value="all">전체</option>
			<option value="naver">네이버</option>
			<option value="daum">다음</option>
		</select>
		<div>
		<input type="text" id="seWord" name="seWord">
		<button type="button" class="btn btn-primary" id="searchButton">검색</button>
		</div>
		<table class="table table-hover" id="articleItems">
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<c:if test="${not empty articleList}">
				<tbody>
					<c:forEach var="article" items="${articleList}" varStatus="status">
						<tr id="detailArticle" data-i="${status.count - 1}">
							<td>${status.count}</td>
							<td><a>${article.title}</a></td>
							<td>${article.regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
		<div class="m-3 row justify-content-center">${navigation.navigator}</div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="modal-t" class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div id="modal-c" class="modal-body"></div>
				</div>
			</div>
		</div>
</div>
	</div>
  <!-- Vendor JS Files -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${root}/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${root}/js/main.js"></script>
</body>