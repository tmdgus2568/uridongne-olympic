<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>����� ������</title>
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

<h1>����� ����</h1>

	<section class="imagearea">
		<p><img src="${stadium.stadium_photo}" width="500"><p>

	<aside class="Detailarea">
				<div>
					<div>
						<div>������: ${stadium.stadium_name}</div>
						<div>�̿���: ${stadium.payment_method}</div>
						<div>���밡���ο�: ${stadium.stadium_number}</div>
						<div>��Ī���ο�: ${stadium.mat_max}</div>
						<div>���������: ${stadium.sports_name}</div>
						<div>����忬��ó: ${stadium.stadium_phone}</div>
						<div>������ּ�: ${stadium.location}</div>
						<div>�̿������: ${stadium.stadium_start}</div>
						<div>�̿�������: ${stadium.stadium_end}</div>
						<div>������ּ�: ${stadium.stadium_address}</div>
						<div>�������ɿ���: ${stadium.stadium_parking}</div>
						<div>�����ü�����: ${stadium.stadium_shower}</div>
						<div>������: ${stadium.stadium_char}</div>
						<div>x��ǥ: ${stadium.address_x}</div>
						<div>y��ǥ: ${stadium.address_y}</div>
						<%-- <div>����: ${stadium.stadium_photo}</div> --%>
					</div>
					<button onClick="review(${review.review_id})">�󼼸��� ��������>>></button>
					<br> <br>

				</div>
			</form>
		</aside>

		<!-- īī����  -->
		<div class="map_wrap">
			<div id="map"
				style="width: 80%; height: 100%; position: relative; overflow: hidden;"></div>
			<div class="hAddr">
				<span class="title">�����߽ɱ��� ������ �ּ�����</span> <span id="centerAddr"></span>
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
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			level : 1
		// ������ Ȯ�� ����
		};
 
		// ������ �����մϴ�    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // Ŭ���� ��ġ�� ���� �ּҸ� ǥ���� �����������Դϴ�

		// ���� ���� �߽���ǥ�� �ּҸ� �˻��ؼ� ���� ���� ��ܿ� ǥ���մϴ�
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// ������ Ŭ������ �� Ŭ�� ��ġ ��ǥ�� ���� �ּ������� ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,    //���� �浵�� ���� �־��. ��ǥ ������ŭ forloop����
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>���θ��ּ� : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>���� �ּ� : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">������ �ּ�����</span>'
							+ detailAddr + '</div>';

					// ��Ŀ�� Ŭ���� ��ġ�� ǥ���մϴ� 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// ���������쿡 Ŭ���� ��ġ�� ���� ������ �� �ּ������� ǥ���մϴ�
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		// �߽� ��ǥ�� Ȯ�� ������ ������� �� ���� �߽� ��ǥ�� ���� �ּ� ������ ǥ���ϵ��� �̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// ��ǥ�� ������ �ּ� ������ ��û�մϴ�
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// ��ǥ�� ������ �� �ּ� ������ ��û�մϴ�
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// ���� ������ܿ� ���� �߽���ǥ�� ���� �ּ������� ǥ���ϴ� �Լ��Դϴ�
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// �������� region_type ���� 'H' �̹Ƿ�
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

<!--����  <html>
    <head>
        <meta charset="utf-8">
        <title>Stadium ��ġ</title>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59"></script>
        
    </head>
-->
<%--     
<body>
        <!-- ������ ǥ���� div -->
        <div id="map" style="width:40%;height:600px;"></div>
    </body>
</html>

<script>
    // ������ ǥ���� div 
    let mapContainer = document.getElementById('map'),
        mapOption = { 
            // ������ �߽���ǥ
            //center: new kakao.maps.LatLng(33.450701, 126.570667), 
            center: new kakao.maps.LatLng(37.5031, 127.07889), //y, x 
            // ������ Ȯ�� ����(1~14) ���� Ŭ ���� ������ ��� �Ǿ� ����.
            level: 5
        };

    // ������ ǥ���� div�� ���� �ɼ����� ������ ����.
    let map = new kakao.maps.Map(mapContainer, mapOption); 


    // ��Ŀ�� ǥ�õ� ��ġ.
    //let markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
    let markerPosition  = new kakao.maps.LatLng(37.5031, 127.07889); //test

    // ��Ŀ�� ����.
    let marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // ��Ŀ�� �ش� ��ġ�� ����
    marker.setMap(map);
</script>
--%>