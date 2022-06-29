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

<script>
    $(function(){
        $('#submit').on("click",function () {
			const id = ${notice.id};
        	const title = '${notice.title}';
        	const author = '${notice.author}';
        	const written_date = null;
        	const description = $('#text').val();
        	const notice = {
        		id: id,
        		title: title,
        		author: author,
        		written_date: written_date,
        		description: description
        	};
           	$.ajax({
                type: "PUT",
               	url: "${root}/updateNotice.do",
               	headers: {
               	 	"Content-Type" : "application/json",
              		"X-HTTP-Method-Override" : "PUT"
               	},
               	dataType: 'text',
               	data: JSON.stringify(notice),
            	success: function(data) {
            		if (data == "success") {
            			self.location = '${root}/noticeForm.do';
            		}
            		else {
            			alert("입력 값을 다시 확인해주세요.");
            		}
            	}
           });
          })
       });
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
					<tr>
						<td><c:out value="${notice.id}" /></td>
						<td><c:out value="${notice.title}" /></a></td>
						<td><c:out value="${notice.author}" /></td>
						<td><c:out value="${notice.written_date}" /></td>
					</tr>
			</tbody>
      	</table>
      	<div class="container">
			<textarea id="text" class="form-control col-sm-5" rows="5"></textarea>
		</div>
	 	<button class="button-default" id="submit">수정</button>
    </div>
  </div>
  <!-- Vendor JS Files -->
  <script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${root}/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${root}/js/main.js"></script>
</body>