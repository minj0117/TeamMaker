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
			<th>아이디</th>
			<th>내용</th>
		</tr>
		<c:forEach var="row" items="${rlist }">
		<tr>
			<td>${row.id }</td>
			<td>${row.comment }</td>
		</tr> 
		</c:forEach>
	</table>
</body>
</html>