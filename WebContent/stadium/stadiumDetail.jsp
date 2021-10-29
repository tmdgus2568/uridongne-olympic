<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stadium ��ġ</title>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=710efed9d2e1e3e45ce6777b45016c59"></script>
        
    </head>

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