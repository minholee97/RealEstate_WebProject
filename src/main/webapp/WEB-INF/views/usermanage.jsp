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
$(function() {
	console.log("asd");

	<c:forEach var="user" items="${userlist}">
		console.log("${user}");
	</c:forEach>
});
function deleteId(id) {
	const url = "${root}/delete.do/"+id
	$.ajax({
		type: "DELETE",
		url: url,
		success: function (data) {
			self.location = '${root}/usermanage.do';
		}
	})
}
</script>
</head>

<body>
	<jsp:include page="header.jsp" />
	<div class="wrapper">
		<div class="container bg-light p-5">
			<h2>회원 관리</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>동코드</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userlist}">
						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.phone}" /></td>
							<td><c:out value="${user.dongCode}" /></td>
							<td>
								<button class="button-default2" onClick="location.href='${root}/userupdateForm.do/${user.id}'">수정</button>
							</td>
							<td>
								<button class="button-default2" onclick="deleteId('${user.id}')"> 삭제 </button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>
</body>