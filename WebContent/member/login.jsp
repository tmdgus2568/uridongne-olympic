<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../css/contentStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
h5 {
	color: red;
}

@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- 네이버 로그인 스크립트 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

<!-- 카카오 로그인 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	Kakao.init('52f4562963d0af029fb4dd18b6358be9'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	//카카오 로그인
	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						console.log(response);
						console.log("id값: " + response.id);
						console.log("이메일: " + response.kakao_account.email);

						var social_user_id = response.id;
						var social_user_email = response.kakao_account.email;
						var login_platform = "카카오";

						$("#social_user_id").val(social_user_id);
						$("#social_user_email").val(social_user_email);
						$("#login_platform").val(login_platform);
						$("#socialFrmLogin").submit();

					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error)
			},
		})
	}
</script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<div class="content">
		<div class="loginform" align="center">
			<h5 style="font-family: NanumSquareRound;">${message }</h5>
			<form name="frmLogin" action="generallogincheck" method="post"  style="font-family: NanumSquareRound;">
				<table>
					<tr>
						<td>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="user_id"
									name="user_id" placeholder="아이디를 입력해주세요"> <label
									for="floatingInput">ID</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-floating">
								<input type="password" class="form-control" id="user_pw"
									name="user_pw" placeholder="비밀번호를 입력해주세요" style="width: 300pt; height: 40pt;"> <label
									for="floatingPassword">Password</label>
							</div>
						</td>
					</tr>
				</table>
				<button type="submit" style="width: 300pt; height: 40pt; margin: 10pt;"
					class="btn btn-primary" value="로그인">로그인</button>
			</form>

			<br> <a href="joinForm.jsp"><img width="400" src="../image/generallogin.png" /></a> <br><br> 
			<p style="font-size: 20px">OR</p><a
				onclick="kakaoLogin();" href="javascript:void(0)"> <img
				 width="394" src="../image/kakaologin.png" /></a><br>
			<div id="naver_id_login"></div>

			<form name="socialFrmLogin" id="socialFrmLogin"
				action="sociallogincheck" method="post">
				<input type="hidden" id="social_user_id" name="social_user_id">
				<input type="hidden" id="social_user_email" name="social_user_email">
				<input type="hidden" id="login_platform" name="login_platform">
			</form>
		</div>
	</div>


	<!-- //네이버 로그인 버튼 노출 영역 -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("LesoS08CKTFNELCZN_Ia",
				"http://localhost:9090/uridongne-olympic/member/callback.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 85);
		naver_id_login
				.setDomain("http://localhost:9090/uridongne-olympic/member/login.jsp");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>


	<%@ include file="../footer.jsp"%>
</body>
</html>