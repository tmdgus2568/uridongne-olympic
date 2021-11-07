<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- Trigger the modal with a button -->

		<button type="modalBtn" class="btn btn-info btn-lg"
		data-bs-toggle="modal" data-bs-target="#myModal" style="float: right;">로그인</button>

		
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg">
			
				<!-- Modal content-->
				<div class="modal-content modal-fullsize">
					<div class="modal-header">
						<h5 class="modal-title">예약시 로그인이 필요합니다.</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<jsp:include page="../reservation/login.jsp"></jsp:include> 
					</div>
				</div>
			</div>
		</div>
		
</body>
































</body>
</html>