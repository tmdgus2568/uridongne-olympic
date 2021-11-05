<%@page import="member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네올림픽</title>
<style>
#wrapper {
	width: 960px;
	margin: 0 auto;
}

header { /* 헤더 */
	width: 960px;
	height: 170px;
	/* 		background-color:#066cfa; */
	border-bottom: 1px solid black;
}

.header-text {
	font-size: 20px;
	color: black;
	text-align: center;
	line-height: 120px;
}

#nav {
	list-style: none;
	height: 40px;
	padding: 5px 1px;
	margin: 0;
	background: #ffffff;
}

#nav li {
	float: left; /* 메뉴를 왼쪽부터 표시한다 */
	position: relative; /* 순서대로 표시한다 */
	margin: 5px 30px;
	padding: 0;
}

#nav li a {
	display: block; /* 메뉴칸을 블록 레벨로 만든다  */
	font-weight: bold;
	font-size: 18px;
	padding: 7px 8px;
	margin: 0;
	color: #000000;
	text-decoration: none; /* 글자의 밑줄 없애기 */
}

#nav li:hover ul {
	opacity: 1;
}

#nav li:hover ul li {
	height: 35px;
	overflow: visible; /* 영역을 넘어가는 내용이 있다면 표시 */
	padding: 0;
}

#nav li:hover>a { /* 메인메뉴 링크에 마우스 포인터를 올렸을 때  */
	background: #000000;
	color: white;
	margin: 0;
	border-radius: 15px;
	/* 	padding:5px; */
}

#nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	position: absolute; /* 고정 위치에 표시 */
	left: 0;
	top: 40px;
	width: 105px;
	background: #000000;
	text-align: center;
	opacity: 0; /* 투명하게 표시되도록 해서 평소에 안보이도록 설정  */
}

#nav ul li {
	float: none;
	margin: 0;
	padding: 0;
	font-size: 5px;
}

#nav ul a {
	font-weight: normal;
	color: white;
}

#nav ul li:hover a {
	background: white;
	font-weight: bold;
	color: black;
	border: 1px solid grey;
	border-radius: 0px;
}

#member_info a {
	text-decoration: none;
	color: black;
	padding: 10px;
}
</style>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	Kakao.init('52f4562963d0af029fb4dd18b6358be9'); //발급받은 키 중 javascript키를 사용해준다.

	//카카오 로그아웃 
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
					location.href = "member/logout";
				},
				fail : function(error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}

</script>

<body>

	<%
	session = request.getSession();

	String clientId = "LesoS08CKTFNELCZN_Ia";
	String clientSecret = "NwyLonfy0C";
	String accessToken = (String) session.getAttribute("accessToken");
	String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete";
	apiURL += "&client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&access_token=" + accessToken;
	apiURL += "&service_provider=NAVER";
	%>

	<script>
	function naverLogout(){
		$.ajax({
		url: "<%=apiURL%>",
		dataType: "json",
		type: "get",
		success: function(data){
			console.log(data);
			location.href="/uridongne-olympic/member/logout";
		}
		})
	}
		
	</script>

	<div id="wrapper">
		<header>
			<h1 class="header-text">우리동네올림픽</h1>

			<%
			session = request.getSession();
			MemberVO member = (MemberVO) session.getAttribute("member");
			if (member == null) {
			%>
			<div id="member_info" align="right">
				<a href="/uridongne-olympic/member/login.jsp">로그인 | 회원가입</a>
				<%
				} else if (member != null) {
				if (member.getLogin_platform().equals("카카오")) {
				%>
				<div id="member_info" align="right">
					<a onclick="kakaoLogout();" href="javascript:void(0)">카카오 로그아웃</a>
					<a href="/uridongne-olympic/member/mypage">마이페이지</a>
				</div>
				<%
				} else if (member.getLogin_platform().equals("네이버")) {
				%>
				<div id="member_info" align="right">
					<a onclick="naverLogout();" href="javascript:void(0)">네이버 로그아웃</a>
					<a href="/uridongne-olympic/member/mypage">마이페이지</a>
				</div>
				<%
				} else {
				%>
				<div id="member_info" align="right">
					<a href="/uridongne-olympic/member/logout">로그아웃</a> <a
						href="/uridongne-olympic/member/mypage">마이페이지</a>
				</div>
				<%
				}
				}
				%>
			</div>

		</header>

		<nav>
			<ul id="nav">
				<li><a href="/uridongne-olympic/stadium/stadiumList">경기장정보</a></li>
				<li><a href="#">예약하기</a>
					<ul>
						<li><a href="/uridongne-olympic/reservation/stadium">경기장예약</a></li>
						<li><a
							href="/uridongne-olympic/matching/stadium">매칭예약</a></li>
					</ul></li>
				<li><a href="/uridongne-olympic/matching/list">매칭참여</a></li>
				<li><a href="/uridongne-olympic/review/list">리뷰</a></li>
			</ul>
		</nav>

	</div>

</body>
</html>