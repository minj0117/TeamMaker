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
	<h1>팀 목록</h1>
	${sessionScope.member.id}
	<%
		String id = (String) session.getAttribute("id");
	%>
		<h1><%=id %></h1>
	<%
		if(id != null ){
	%>	
	<table border="1" width="700">
		<tr>
			<th>지원자</th>
			<th>선택</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.applyid }</td>
			<td><input type="checkbox" name="${applyid }" /></td>
		</tr> 
		</c:forEach>
	</table>
	<input type="button" value="팀 생성">

	<% 	
		}else{
	%>
		<h1>권한이 없습니다.</h1>
	<%
		}
	%>
</body>
</html>