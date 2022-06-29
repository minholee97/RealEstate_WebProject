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
function deleteId(id) {
	const url = "${root}/deleteNotice.do/"+id
	$.ajax({
		type: "DELETE",
		url: url,
		success: function (data) {
			self.location = '${root}/noticeForm.do';
		}
	})
}
</script>
</head>

<body>
  <jsp:include page="header.jsp"/>
  <div class="wrapper">
    <div class="container bg-light p-5">
      <h2>공지사항</h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
          </tr>
        </thead>
			<tbody>
				<c:forEach var="notice" items="${noticelist}">
					<tr>
						<td><c:out value="${notice.id}" /></td>
						<td><a href="${root}/noticeDetail.do/${notice.id}"><c:out value="${notice.title}" /></a></td>
						<td><c:out value="${notice.author}" /></td>
						<td><c:out value="${notice.written_date}" /></td>
						<c:choose>
      						<c:when test="${user.id == 'admin'}">
								<td>
									<button class="button-default2" onClick="location.href='${root}/noticeUpdateForm.do/${notice.id}'">수정</button>
								</td>
								<td>
									<button class="button-default2" onclick="deleteId('${notice.id}')"> 삭제 </button>
								</td>
							</c:when>
	  					</c:choose>
					</tr>
				</c:forEach>
			</tbody>
      	</table>
		<c:choose>
      		<c:when test="${user.id == 'admin'}">
      			<button type="button" class="btn btn-success" onClick="location.href='${root}/noticeRegisterForm.do'">새 공지사항 등록</button>
	  		</c:when>
	  	</c:choose>
    </div>
  </div>
  <!-- Vendor JS Files -->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/swiper/swiper-bundle.min.js"></script>
  <script src="vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="js/main.js"></script>
</body>