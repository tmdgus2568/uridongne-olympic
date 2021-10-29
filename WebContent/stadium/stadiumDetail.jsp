<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stadium 위치</title>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59"></script>
        
    </head>

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