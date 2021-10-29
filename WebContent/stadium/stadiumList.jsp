<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장정보</title>
</script>
</head>
<body>

</script>
</head>
<body>
		<div>
			<form>
				<fieldset>
                    <legend>경기장 정보 검색</legend>                    
                    <label>검색분류</label>
                        <select name = "f">
                            <option ${(param.f == "stadium_id")? "selected" : ""} value = "stadium_id">경기장번호</option>
                            <option ${(param.f == "stadium_name")? "selected" : ""} value = "stadium_name">경기장명</option>
                            <option ${(param.f == "sports_name")? "selected" : ""} value = "sports_name">경기종목</option>
                            <option ${(param.f == "stadium_address")? "selected" : ""} value = "stadium_address">지역</option>
                        </select>
                    <label>검색어</label>
                        <input type = "text" name = "q" value = "${param.q}"/>
                        <input type = "submit" value = "검색">                
                </fieldset>        
			
				
			</form>	
		</div>	
	
		<div>
			<h3 >경기장 목록</h3>
			<table >
				<thead>
					<td>
						<td>경기장번호</td>
						<td>경기장명</td>
						<td>경기종목</td>
					</td>
				</thead>							
				<tbody>	
							
				<c:forEach var = "n" items = "${list }">
					<tr>
						<td>${n.id }</td>
						<td><a href="detail?id=${n.id }">${n.stadium_id }</a></td>
						<td>${n.stadium_name}</td>
						<td>	${n.sports_name}</td>					
						</td>
						<td>
							<fmt:formatNumber pattern = "####,###" value="${n.hit}" />							
						</td>
					</tr>
				</c:forEach>				
					
				</tbody>
			</table>
		</div>
		
		<div>
			<c:set var = "page" value = "${(empty param.p)? 1 : param.p}"/>
			<c:set var = "startNum" value = "${page-(page-1)%5}" />
			<c:set var = "lastNum" value = "23" />
			
			<c:if test="${startNum > 1}">
				<span><a href = "?p=${startNum - 1}&f=&q=">이전</a> </span>
			</c:if>
			<c:if test="${startNum <= 1}">
				<span onclick = "alert('이전 페이지가 없습니다.');">이전</span>
			</c:if>
			
			<span>
				<c:forEach var = "i" begin = "0" end = "4">
					<a href = "?p=${startNum + i}&f=&q=">${startNum + i}</a>
				</c:forEach>		
			</span>
			
			<c:if test="${startNum < lastNum }">
				<span><a href = "?p=${startNum + 5}&f=&q=">다음</a> </span>
			</c:if>
			<c:if test="${startNum >= lastNum }">
				<span onclick = "alert('다음 페이지가 없습니다.');">다음</span>
			</c:if>		
		</div>

</body>
</html>