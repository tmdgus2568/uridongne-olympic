<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<link href="../css/tableStyle.css" rel="stylesheet" type="text/css">
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">


<style>
.cls1 {
	text-align: center;
	font-size: 30px;
}

.outer {
  text-align: center;
}


</style>
<meta charset="UTF-8">
<title>우리동네올림픽</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



</head>

<body>
	<%@ include file="../header.jsp"%>
	<div class="content" text-align="center">
	<!-- 					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="../image/11.PNG" class="d-block w-100 h-80"" alt="../image/11.PNG">
					    </div>
					    <div class="carousel-item">
					      <img src="../image/22.PNG" class="d-block w-100 h-80"" alt="../image/22.PNG">
					    </div>
					    <div class="carousel-item">
					      <img src="../image/33.PNG" class="d-block w-100 h-80" alt="../image/33.PNG">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
					
					 -->
				<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-indicators">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				  </div>
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="../image/11.PNG" class="d-block w-100" alt="../image/11.PNG">
				    </div>
				    <div class="carousel-item">
				      <img src="../image/22.PNG" class="d-block w-100" alt="../image/22.PNG">
				    </div>
				    <div class="carousel-item">
				      <img src="../image/33.PNG" class="d-block w-100" alt="../image/33.PNG">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div><br>
			<br>
	
	
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>