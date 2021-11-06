<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
$(function(){
	 $("#apply").submit(function() {
		 
		 if(!confirm("정말 매칭에 참여하시겠습니까?")){
			 return false;
		 }
		 
	 }); 

	
});

</script>
<style>
	
	/* 테이블 전체 */
	table{
		background:white;
		width:100%;
		text-align:center;

	}
	td{
		padding:10px;
	}
	
	.td_title{
		background:black;
		color:white;
		font-weight:bold;
	}
	
	/* #title{
		width:
	} */
	
/* 	input[type=number]{

		color:black;
		float:right;
		width:200px;
		height:45px;
		border-radius:10px;
		font-size:15px;

		margin-right:20px;
		padding-left:10px;
		
	} */
	
/* 	button{
		background:black;
		color:white;
		float:right;
		width:120px;
		height:50px;
		border-radius:15px;
		font-size:15px;
		font-weight:bold;
	
	} */


	
	#stadium_map{
		
		width:400px;
		height:400px;

		float:left;
		margin-right:50px;
	}
	
 /* 	#join_btn{
		background:black;
	 	
	} */

	
	.map_title{
	
		font-weight:bold;
	

	}
	
	.stadium_deatil_info_title{
		font-size:40px;
	}
	.stadium_detail_info_sub2{
		font-size:20px;
	}
	
	

</style>
</head>
<body>
<%@ include file="../header.jsp" %>

<%-- <h1>${param.res_number}</h1> --%>
<div class="content">
	<h2>매칭 상세정보</h2>
	<br>
	<table class="table table" border="1">
		<tr>
			<th class="table-dark" scope="row">방이름</td>
			<td colspan="5">${createJoin.mat_title}</td>
		</tr>
		<tr>
			<th class="table-dark" scope="row">경기날짜</td>
			<td>${createJoin.play_start}~${createJoin.play_end}</td>
			<th class="table-dark" scope="row">인원 수</td>
			<td>${createJoin.nowjoin_people}/${createJoin.mat_people}</td>
			<th class="table-dark" scope="row">1인당 예상가격</td>
			<td>약 <fmt:parseNumber value="${createJoin.stadium_price/createJoin.mat_people}" integerOnly="true"/>원</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align:left;">${createJoin.mat_content}</td>
		</tr>
	
	</table>

	<%-- <div>내용: ${createJoin.mat_content}</div> --%>

</div>
<div class="content" id="stadium_info" text-align="center">
	<h2>경기장 정보</h2>
		<!-- 카카오맵  -->
	<p style="margin-top: -12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		</a>
		</em>
	</p>
	<div id="stadium_map"></div>
	<div id="stadium_deatil_info">
		<h1 class="stadium_deatil_info_title">${createJoin.stadium_name}</h1>
		<%-- ${createJoin.stadium_address} --%>
		<div id="stadium_detail_info_sub"></div>
		
		
	</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59&libraries=services"></script>



	<script>   //문제발생: push하고 팀원들꺼에서 잘 돌아가면 ok, 아니면 대책 필요...인증키 에러 및 146, 147코드가 안 먹음
	var x = ${createJoin.address_x}; 
	var y = ${createJoin.address_y};
	var stadium_name = '${createJoin.stadium_name}';

	var mapContainer = document.getElementById('stadium_map'), // 지도를 표시할 div 
	mapOption = {	
			
	    center: new kakao.maps.LatLng(y, x), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
		
		// 지도 생성   
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 주소-좌표 변환 객체 생성
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 마커가 표시될 위치
		let markerPosition = new kakao.maps.LatLng(y, x); //y좌표, x좌표 
		
		//마커 생성
		let marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커를 해당 위치에 설정
		marker.setMap(map);
		
		infowindow = new kakao.maps.InfoWindow({zindex:1}); // 경기장 주소 표시창 
			  searchDetailAddrFromCoords(markerPosition, function(result, status) {  //stadium 에 저장된 좌표 넣어서 주소로 
				  if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = !!result[0].road_address ? '도로명주소 : ' + result[0].road_address.address_name : '';
			            detailAddr += '지번주소 : ' + result[0].address.address_name;
			            
			         /*    var content =  '<div class="map_title" align="center">'+stadium_name+'</div>';
			            console.log(detailAddr); */
			            document.getElementById('stadium_detail_info_sub').innerHTML 
			            	= '<div class="stadium_detail_info_sub2">'+detailAddr+'</div>'
			            	+ '<div class="stadium_detail_info_sub2">전화번호 : ${createJoin.stadium_phone}</div>'
			            	+ '<div class="stadium_detail_info_sub2">운영시간 : ${createJoin.stadium_start} ~ ${createJoin.stadium_end}</div>'
			            
		        // 인포윈도우로 경기장 주소 표시
		        var infowindow = new kakao.maps.InfoWindow({   
		            content: content
		        });
		        
		        infowindow.setContent(content);
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동
		        map.setCenter(coords);
			  }
		});    
		
		function searchDetailAddrFromCoords(coords, callback) {
		    // 좌표로 경기장 주소 정보 요청
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
	</script>
	<br>
	
	<div id="join_btn" class="input-group mb-3" align="right" style="display:flex; justify-content:flex-end;">
		<form method="post" id="apply" action="apply">	
			<input type="text" name="mat_id" value="${createJoin.mat_id}" hidden="true">
			<input type="number" name="together" min="1" placeholder="참여 인원 수를 입력해 주세요" 
			required autofocus class="form-control" aria-describedby="button-addon2" style="width: 250px; display:inline">
			
			<button type="submit" class="btn btn-primary" id="button-addon2">참가하기</button>
		</form>
	
	</div>
	

</div>


<%@ include file="../footer.jsp" %>
<script>

</script>

</body>
</html>