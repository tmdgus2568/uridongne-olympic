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
<link href="../css/Font.css" rel="stylesheet" type="text/css" />
<style>
@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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

#logo{
	padding-top:30px;
	margin:10px auto;
	text-align:center;
	width:50%;
	display: block;
}
</style>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">


<script>
	Kakao.init('52f4562963d0af029fb4dd18b6358be9'); //발급받은 키 중 javascript키를 사용해준다.

	//카카오 로그아웃 
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response)
					location.href = "/uridongne-olympic/member/logout";
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
	<script>
		
	<%session = request.getSession();

String clientId = "LesoS08CKTFNELCZN_Ia";
String clientSecret = "NwyLonfy0C";
String accessToken = (String) session.getAttribute("accessToken");
String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=delete";
apiURL += "&client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&access_token=" + accessToken;
apiURL += "&service_provider=NAVER";%>
		
	</script>

	<div id="wrapper">
		<div>
			<img id="logo" width="400" src="../image/logo.png" />

			<%
			session = request.getSession();
			MemberVO member = (MemberVO) session.getAttribute("member");
			if (member == null) {
			%>
			<div id="member_info" align="right"  style="font-family: NanumSquareRound;">
				<button type="button" class="btn btn-primary"
					onclick="location.href='/uridongne-olympic/member/login.jsp'">로그인|회원가입</button>
				<%
				} else if (member != null) {
				if (member.getLogin_platform().equals("카카오")) {
				%>
				<div id="member_info" align="right"  style="font-family: NanumSquareRound;">

					<button type="button" class="btn btn-primary"
						onclick="kakaoLogout()">카카오 로그아웃</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/uridongne-olympic/member/mypage'">마이페이지</button>
				</div>
				<%
				} else if (member.getLogin_platform().equals("네이버")) {
				%>
				<div id="member_info" align="right"  style="font-family: NanumSquareRound;">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/uridongne-olympic/member/logout'">네이버 로그아웃</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/uridongne-olympic/member/mypage'">마이페이지</button>
				</div>
				<%
				} else {
				%>
				<div id="member_info" align="right"  style="font-family: NanumSquareRound;">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/uridongne-olympic/member/logout'">로그아웃</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/uridongne-olympic/member/mypage'">마이페이지</button>
				</div>
				<%
				}
				}
				%>
			</div>

		</div>


		<!-- 		<nav>
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
		</nav> -->

	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="font-family: NanumSquareRound;">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active"
						href="/uridongne-olympic/main/uridongneMain.jsp">홈 <span
							class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/uridongne-olympic/stadium/stadiumList">경기장정보</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false">예약</a>
						<div class="dropdown-menu">
							<a class="dropdown-item"
								href="/uridongne-olympic/reservation/stadium">경기장 예약</a> <a
								class="dropdown-item" href="/uridongne-olympic/matching/stadium">매칭
								예약</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="/uridongne-olympic/matching/list">매칭참여</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/uridongne-olympic/review/list">리뷰</a></li>
				</ul>

			</div>
		</div>
	</nav>
</body>
</html>