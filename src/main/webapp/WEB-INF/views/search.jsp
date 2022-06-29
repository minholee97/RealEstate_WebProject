<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Happy House</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${root}/img/favicon.png" rel="icon">
<link href="${root}/img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${root}/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${root}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${root}/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${root}/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<!-- Template Main CSS File -->
<link href="${root}/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>

<!-- =======================================================
  * Template Name: EstateAgency - v4.7.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
    ======================================================== -->
<script type="text/javascript">
	$(function() {
		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/deal/list").submit();
		});
	})
</script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83dbb376cb1c02a1e2ef545868d119d6"></script>
<script>
	function marking(lat, lng) {
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(lat, lng),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);
		var markerPosition = new kakao.maps.LatLng(lat, lng);

		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		marker.setMap(map);
	}
   	function makeOverListener(map, marker, infowindow) {
   	    return function() {
   	        infowindow.open(map, marker);
   	    };
   	}

   	function makeOutListener(infowindow) {
   	    return function() {
   	        infowindow.close();
   	    };
   	}
	function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) { 
		function deg2rad(deg) {
			return deg * (Math.PI/180) 
		} 
		var R = 6371;
		var dLat = deg2rad(lat2-lat1);
		var dLon = deg2rad(lng2-lng1);
		var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
		var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		var d = R * c;
		return d; 
	}
	function moveMap(latlng) {
		var pos = latlng.split('/');
		var container = document.getElementById('map2');
		var moveLatLon = new kakao.maps.LatLng(pos[0], pos[1]);
		maps.panTo(moveLatLon);
	}
	var maps = null;
	var result;
	var tlat, tlng;
	function classify(type){
   		var positions = [];
		if (type == 'all') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       			var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       			positions.push(pos);
       		}
		} else if (type == 'food') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '음식') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		} else if (type == 'retail') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '소매') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		} else if (type == 'life') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '생활서비스') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		} else if (type == 'accom') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '숙박') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		}
		else if (type == 'edu') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '학문/교육') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		}
		else if (type == 'real') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '부동산') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		}
		else if (type == 'sport') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '스포츠') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		}
		else if (type == 'enter') {
			$("#map2Container > div").remove();
			$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
			$("#c_list > tbody").remove();
			$("#c_list").append("<tbody></tbody>");
       		for (idx in result) {
       			if (result[idx].type == '관광/여가/오락') {
       				$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       				var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       				positions.push(pos);
       			}
       		}
		}
   		var marker = new kakao.maps.Marker({
   		    position: new kakao.maps.LatLng(tlat, tlng)
   		});
   		
		var mapContainer = document.getElementById('map2'),
    	mapOption = { 
        	center: new kakao.maps.LatLng(tlat, tlng),
        	level: 2
    	};
	
		maps = new kakao.maps.Map(mapContainer, mapOption);
		marker.setMap(maps);
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		for (var i = 0; i < positions.length; i ++) {
		    var imageSize = new kakao.maps.Size(24, 35); 
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    var marker = new kakao.maps.Marker({
		        map: maps,
		        position: positions[i].latlng,
		        title : positions[i].title,
		        image : markerImage
		    });
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content
		    });

		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(maps, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
	}	
	function like() {
		if ("${user.id}" == "") {
			alert("로그인 후 이용해 주세요!");
			return;
		}
		var no = $("#no").val();
		var user = "${user.id}";
		const url = "${root}/registWish.do";
    	const wish = {
        		houseId: no,
        		userId: user
        };
		$.ajax({
			type: "POST",
			url: url,
           	headers: {
           	 	"Content-Type" : "application/json",
          		"X-HTTP-Method-Override" : "POST"
           	},
           	dataType: "text",
           	data: JSON.stringify(wish),
			success: function (data) {
       			$("#like").css("display", "none");
       			$("#dislike").css("display", "block");
			}, 
		})
	}
	function dislike() {
		var no = $("#no").val();
		var user = "${user.id}";
		const url = "${root}/deleteWish.do";
    	const wish = {
        		houseId: no,
        		userId: user
        };
		$.ajax({
			type: "DELETE",
			url: url,
           	headers: {
           	 	"Content-Type" : "application/json",
          		"X-HTTP-Method-Override" : "DELETE"
           	},
           	dataType: "text",
           	data: JSON.stringify(wish),
			success: function (data) {
       			$("#like").css("display", "block");
       			$("#dislike").css("display", "none");
			}, 
		})
	}
	function detail(name, dongCode, lat, lng, no, amount, year, dong, jibun, id) {
		console.log(lat, lng);
		$("#no").val(id);
		var user = "${user.id}";
    	const wish = {
        		houseId: id,
        		userId: user
        };
       	$.ajax({
            type: "POST",
           	url: "${root}/searchWish.do",
           	headers: {
           	 	"Content-Type" : "application/json",
          		"X-HTTP-Method-Override" : "POST"
           	},
           	dataType: "text",
           	data: JSON.stringify(wish)
       	}).done(function(data){
       		if(data == "fail") {
       			$("#like").css("display", "block");
       			$("#dislike").css("display", "none");
       		} else {
       			$("#like").css("display", "none");
       			$("#dislike").css("display", "block");       			
       		}
       		var dimg = "default";
		$("#amount").text(amount);
		$("#year").text(year);
		$("#location").text(dong);
		$("#imgContainer > img").remove();
		$("#imgContainer").append('<img style="width: 100%; height: 350px;" class="rounded mx-auto d-block" src="${root}/img/house/'+ id +'.jpg" onerror=\'this.src="${root}/img/house/default.jpg"\'>');
		$("#map2Container > div").remove();
		$("#map2Container").append('<div id="map2" style="width: 100%; height: 350px;"> 데이터를 불러오는 중입니다. </div>');
		$("#c_list > tbody").remove();
		$("#c_list").append("<tbody></tbody>");
		$("#aptName").text(name);
		tlat = lat;
		tlng = lng;
		const url = "${root}/commercial.do/" + dongCode + "/" + lat + "/" + lng;
       	$.ajax({
            type: "GET",
           	url: url,
           	dataType: "text"
       	}).done(function(data){
       		result = JSON.parse(data);
       		for (idx in result) {
       			var dist = getDistanceFromLatLonInKm(lat, lng, result[idx].lon, result[idx].lat);
       			result[idx].distance = dist.toFixed(3);
       		}
       		result.sort((a, b) => {
       			if (a.distance < b.distance) 
       				return -1;
       			if (a.distance > b.distance) 
       				return 1;
       			return 0; 
       		});
       		var positions = [];
       		for (idx in result) {
       			$("#c_list > tbody").append("<tr><td> <a href='#' onclick=moveMap('" + result[idx].lon + '/' + result[idx].lat + "');> " +  result[idx].name + "</a></td><td>"  +  result[idx].type + "</td><td> " +  result[idx].distance +"</td></tr>")
       			var pos = { content: result[idx].name, title: result[idx].name, latlng: new kakao.maps.LatLng(result[idx].lon, result[idx].lat) };
       			positions.push(pos);
       		}
       		
       		var marker = new kakao.maps.Marker({
       		    position: new kakao.maps.LatLng(lat, lng)
       		});
       		
    		var mapContainer = document.getElementById('map2'),
        	mapOption = { 
            	center: new kakao.maps.LatLng(lat, lng),
            	level: 2
        	};
		
    		maps = new kakao.maps.Map(mapContainer, mapOption);
    		
    		marker.setMap(maps);
    		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    		for (var i = 0; i < positions.length; i ++) {
    		    var imageSize = new kakao.maps.Size(24, 35); 
    		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    		    var marker = new kakao.maps.Marker({
    		        map: maps,
    		        position: positions[i].latlng,
    		        title : positions[i].title,
    		        image : markerImage
    		    });
    		    var infowindow = new kakao.maps.InfoWindow({
    		        content: positions[i].content
    		    });

    		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(maps, marker, infowindow));
    		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    		}
       	}); 
    	});
	}
</script>
</head>

<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="dealtype" id="dealtype" value="${dealtype}">
		<input type="hidden" name="dongcode" id="dongcode" value="${dongcode}">
	</form>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="blank"></div>
		<div class="row">
			<div class="col-6">
				<h2>거래정보</h2>
				<div id="houselist">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>아파트명</th>
								<th>거래가</th>
								<th>거래일자</th>
								<th>층수</th>
								<th>동이름</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="house" items="${houselist}">
								<tr>
									<td><c:out value="${house.aptName}" /></td>
									<td><c:out value="${house.dealAmount}" /></td>
									<td><c:out value="${house.dealYear}" />.<c:out
											value="${house.dealMonth}" />.<c:out
											value="${house.dealDay}" /></td>
									<td><c:out value="${house.floor}" /></td>
									<td><c:out value="${house.dongName}" /></td>
									<td>
										<button class="button-default2"
											onclick="marking('${house.lat}', '${house.lng}')">
											위치</button>
									</td>
									<td>
										<button type="button" class="button-default2"
											onclick="detail('${house.aptName}', '${house.dongCode}', '${house.lat}', '${house.lng}', '${house.aptCode}'
											, '${house.dealAmount}' , '${house.buildYear}', '${house.dongName}', '${house.jibun}' , '${house.no}')"
											data-toggle="modal" data-target=".bd-example-modal-lg">상세</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="m-3 row justify-content-center">${navigation.navigator}</div>

				</div>
			</div>
			<div class="col-6">
				<h2>지역정보</h2>
				<div id="map"></div>
			</div>

		</div>
	</div>

	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="container mt-3 p-3">
					<div class="row">
						<h2 id="aptName"></h2>
						<div class="container p-3 col-sm">
							<h5>아파트 정보</h5>
							<div id="imgContainer" class="text-center"></div>
							<div class="container p-3">
								<table class="table table-sm">

									<tbody>
										<tr>
											<th scope="row">거래가</th>
											<td id="amount"></td>
										</tr>
										<tr>
											<th scope="row">건축년도</th>
											<td id="year"></td>
										</tr>
										<tr>
											<th scope="row">위치</th>
											<td id="location"></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" id="no">
								<button id="like" type="button" class="btn btn-outline-danger"
									onclick="like()">관심 매물 등록</button>
								<button id="dislike" type="button"
									class="btn btn-outline-warning" onclick="dislike()">관심
									매물 해제</button>
								<div class="mt-5">
									<h5>주변 상권 분류</h5>
									<div class="row mt-3">
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('all')">모두</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('food')">음식</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('retail')">소매</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('life')">생활</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('accom')">숙박</button>
										</div>
									</div>
									<div class="row mt-4">
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('edu')">교육</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('real')">부동산</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('sport')">스포츠</button>
										</div>
										<div class="col-2">
											<button type="button" class="btn btn-success"
												onclick="classify('enter')">오락</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="container p-3 col-sm">
							<h5>주변 상권 정보</h5>
							<div id="map2Container">
								<div id="map2" style="width: 100%; height: 300px;">데이터를
									불러오는 중입니다.</div>
							</div>
							<div class="container p-3" style="height: 550px; overflow: auto">
								<table id="c_list" class="table">
									<thead>
										<tr>
											<th scope="col">이름</th>
											<th scope="col">업종</th>
											<th scope="col">거리(km)</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Vendor JS Files -->
	<script src="${root}/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="${root}/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${root}/js/main.js"></script>
	<script type="text/javascript" src="${root}/js/areaData.js"></script>
	<script type="text/javascript" src="${root}/js/search.js"></script>
</body>