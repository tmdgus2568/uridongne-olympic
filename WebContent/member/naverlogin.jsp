<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>네이버로그인</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "LesoS08CKTFNELCZN_Ia",
			callbackUrl: "http://localhost:9090/uridongne-olympic/member/callback.jsp",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>
  </head>
  <body>
  
  <div id="naverIdLogin"></div>
  
  </body>
</html>