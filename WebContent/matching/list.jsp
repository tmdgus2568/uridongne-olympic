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
			location.href='detail?mat_id='+td_arr[0];
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
		<td>순서</td>
		<td>방이름</td>
		<td>인원</td>
		<td>경기날짜</td>
		<td>작성날짜</td>
	</tr>
 	<c:forEach var="item" items="${createList}" varStatus="list">
   		<tr align="center">
   			<td hidden=true>${item.mat_id}</td>
        	<td>${list.count}</td>
         	<td>${item.mat_title}</td>
         	<td>${item.nowjoin_people}/${item.mat_people}</td>
        </tr>
 	</c:forEach>

</table>
</body>
</html>