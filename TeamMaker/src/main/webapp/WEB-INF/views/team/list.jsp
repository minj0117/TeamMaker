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
			<th>번호</th>
			<th>팀장</th>
			<th>팀이름</th>
			<th>팀소개</th>
			<th>지원</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.tno }</td>
			<td>${row.owner }</td>
			<td>${row.title }</td>
			<td>${row.acomment }</td>
			<td><a href="#" onClick="location.href='http://localhost:8090/prj/addapply?applyid=<%=id%>&tno=${row.tno }'">신청</a></td>
		</tr> 
		</c:forEach>
	</table>

	<% 
		}else{
	%>
		<h1>권한이 없습니다.</h1>
	<%
		}
	%>
</body>
</html>