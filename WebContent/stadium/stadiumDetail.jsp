<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>경기장 상세정보</title>
<style>
.imagearea {
	width: 50%
}

.Detailarea {
	width: 50%
}

.flex-row {
	display: flex;
}

.map_wrap {
	position: relative;
	width: 80%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
</head>
<body>

	<h1>경기장 정보</h1>
	<section class="imagearea">
		<p>
			<img src="${stadium.stadium_photo}" width="500">
		<p>

			<aside class="Detailarea">
				<%-- 	<c:forEach items="${stadiumDetail}" var="stadium" varStatus="status"> --%>
				<div>
					<div>
						<div>경기장명: ${stadium.stadium_name}</div>
						<div>평점: ${stadium.review_star}</div>
						<div>이용요금: ${stadium.payment_method}</div>
						<div>수용가능인원: ${stadium.stadium_number}</div>
						<div>최대매칭인원: ${stadium.mat_max}</div>
						<div>경기장종류: ${stadium.sports_name}</div>
						<div>경기장연락처: ${stadium.stadium_phone}</div>
						<div>이용시작시간: ${stadium.stadium_start}</div>
						<div>이용종료시간: ${stadium.stadium_end}</div>
						<div>주차가능대수: ${stadium.stadium_parking}</div>
						<div>샤워시설유무: ${stadium.stadium_shower}</div>
						<div>상세정보: ${stadium.stadium_char}</div>
					</div>
					<%-- <button onClick="review(${review.review_id})">상세리뷰 보러가기>>></button> --%>
					<%-- <button type="button" onclick="stadiumReview?id=${stadium.stadium_id}">상세리뷰 보러가기</button> --%>

					<td><a href="stadiumReview?id=${stadium.stadium_id}">경기장
							리뷰보기</a></td> <br> <br>
				</div>

			</aside>

			<!-- 카카오맵  -->
		<p style="margin-top: -12px">
			<em class="link"> <a href="javascript:void(0);"
				onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
			</a>
			</em>
		</p>
		<div id="map" style="width: 100%; height: 350px;"></div>



		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59&libraries=services"></script>



		<script>
			//문제발생: push하고 팀원들꺼에서 잘 돌아가면 ok, 아니면 대책 필요...인증키 에러 및 146, 147코드가 안 먹음
			var x = $
			{
				stadium.address_x
			};
			var y = $
			{
				stadium.address_y
			};

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {

				center : new kakao.maps.LatLng(y, x), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도 생성   
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체 생성
			var geocoder = new kakao.maps.services.Geocoder();

			// 마커가 표시될 위치
			let markerPosition = new kakao.maps.LatLng(y, x); //y좌표, x좌표 

			//마커 생성
			let marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커를 해당 위치에 설정
			marker.setMap(map);

			infowindow = new kakao.maps.InfoWindow({
				zindex : 1
			}); // 경기장 주소 표시창 
			searchDetailAddrFromCoords(
					markerPosition,
					function(result, status) { //stadium 에 저장된 좌표 넣어서 주소로 
						if (status === kakao.maps.services.Status.OK) {
							var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
									+ result[0].road_address.address_name
									+ '</div>'
									: '';
							detailAddr += '<div>지번 주소 : '
									+ result[0].address.address_name + '</div>';

							var content = '<div class="bAddr">'
									+ '<span class="title">경기장 주소정보</span>'
									+ detailAddr + '</div>';

							// 인포윈도우로 경기장 주소 표시
							var infowindow = new kakao.maps.InfoWindow({
								content : content
							});

							infowindow.setContent(content);
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동
							map.setCenter(coords);
						}
					});

			function searchDetailAddrFromCoords(coords, callback) {
				// 좌표로 경기장 주소 정보 요청
				geocoder.coord2Address(coords.getLng(), coords.getLat(),
						callback);
			}
		</script>


	</section>
</body>
</html>

