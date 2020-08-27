<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="700">
		<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>조회수</th>
			<th>카테고리</th>
		</tr>
		<c:forEach var="row" items="${rlist }">
		<tr>
			<td>${row.rno }</td>
			<td>${row.id }</td>
			<td><a href="#" onClick="location.href='http://localhost:8090/prj/rview/${row.rno}'">${row.rtitle }</a></td>
			<td>${row.rcnt }</td>
			<td>${row.rcategory }</td>
		</tr> 
		</c:forEach>
	</table>
</body>
</html>