<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
.flex-row{display:flex;}

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
</style>
</head>
<body>

<h1>경기장 정보</h1>

	<section class="imagearea">
		<p><img src="${stadium.stadium_photo}" width="500"><p>

	<aside class="Detailarea">
				<div>
					<div>
						<div>경기장명: ${stadium.stadium_name}</div>
						<div>이용요금: ${stadium.payment_method}</div>
						<div>수용가능인원: ${stadium.stadium_number}</div>
						<div>매칭총인원: ${stadium.mat_max}</div>
						<div>경기장종류: ${stadium.sports_name}</div>
						<div>경기장연락처: ${stadium.stadium_phone}</div>
						<div>경기장주소: ${stadium.location}</div>
						<div>이용시작일: ${stadium.stadium_start}</div>
						<div>이용종료일: ${stadium.stadium_end}</div>
						<div>경기장주소: ${stadium.stadium_address}</div>
						<div>주차가능여부: ${stadium.stadium_parking}</div>
						<div>샤워시설유무: ${stadium.stadium_shower}</div>
						<div>상세정보: ${stadium.stadium_char}</div>
						<div>x좌표: ${stadium.address_x}</div>
						<div>y좌표: ${stadium.address_y}</div>
						<%-- <div>사진: ${stadium.stadium_photo}</div> --%>
					</div>
					<button onClick="review(${review.review_id})">상세리뷰 보러가기>>></button>
					<br> <br>

				</div>
			</form>
		</aside>

		<!-- 카카오맵  -->
		<div class="map_wrap">
			<div id="map"
				style="width: 80%; height: 100%; position: relative; overflow: hidden;"></div>
			<div class="hAddr">
				<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
			</div>
		</div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59&libraries=services"></script>
		<script>
		
	<%--	let lat = ${stadium.address_x};
		let lng = ${stadium.address_y};
		getAddr(lat,lng);
		function getAddr(lat,lng){
		    let geocoder = new kakao.maps.services.Geocoder();

		    let coord = new kakao.maps.LatLng(lat, lng);
		    let callback = function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		            console.log(result);
		        }
		    };

		    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		}
	
		
		
	   var lat = ${stadium.address_x};
	   alert(lat);
	
	--%>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};
 
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,    //위도 경도를 여기 넣어라. 좌표 개수만큼 forloop돌게
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
	</script>
</body>
</html>

<!--원본  <html>
    <head>
        <meta charset="utf-8">
        <title>Stadium 위치</title>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59"></script>
        
    </head>
-->
<%--     
<body>
        <!-- 지도를 표시할 div -->
        <div id="map" style="width:40%;height:600px;"></div>
    </body>
</html>

<script>
    // 지도를 표시할 div 
    let mapContainer = document.getElementById('map'),
        mapOption = { 
            // 지도의 중심좌표
            //center: new kakao.maps.LatLng(33.450701, 126.570667), 
            center: new kakao.maps.LatLng(37.5031, 127.07889), //y, x 
            // 지도의 확대 레벨(1~14) 값이 클 수록 지도가 축소 되어 보임.
            level: 5
        };

    // 지도를 표시할 div와 지도 옵션으로 지도를 생성.
    let map = new kakao.maps.Map(mapContainer, mapOption); 


    // 마커가 표시될 위치.
    //let markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
    let markerPosition  = new kakao.maps.LatLng(37.5031, 127.07889); //test

    // 마커를 생성.
    let marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커를 해당 위치에 설정
    marker.setMap(map);
</script>
--%>