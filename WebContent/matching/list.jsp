<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#matching_list tr").click(function(){
		
		var tr = $(this);
		var td = tr.children();
		var td_arr = new Array();
		
		// td_arr에 한 행의 컬럼값들을 저장 
		td.each(function(i){
			td_arr.push(td.eq(i).text());
		});
		
		/* console.log(td_arr[0]); */
		if(td_arr[0] != "id"){
			location.href='detail?res_number='+td_arr[0];
		}
		
	});
});
</script>
</head>
<body>
<h1>매칭 리스트</h1>
<table border="1" id="matching_list">
	<tr>
		<td hidden=true>id</td>
		<td>장소</td>
		<td>매칭날짜</td>
		<td>몇대몇</td>
	</tr>
<%-- 	<c:forEach var="i" begin="0" end="2" step="1" >	
   		<tr align="center">
      		<td>1</td>
      		<td>2</td>
      		<td>3</td>
   		</tr>
 	</c:forEach> --%>
 	<tr>
 		<td hidden=true>1</td>
 		<td>dfdf</td>
 		<td>fdfdf</td>
 		<td>dhwgwgw</td>
 	</tr>
 	<tr>
 		<td hidden=true>2</td>
 		<td>dfdf</td>
 		<td>fdfdf</td>
 		<td>dhwgwgw</td>
 	</tr>
</table>
</body>
</html>