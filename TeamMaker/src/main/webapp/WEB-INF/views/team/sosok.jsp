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
			<th>팀원보기</th>
			<th>이동</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.tno }</td>
			<td>${row.owner }</td>
			<td>${row.title }</td>
			<td>${row.acomment }</td>
			<td><a href="${contextPath }/prj/mymember/${row.tno }?tno=${row.tno}">팀원 보기</a></td>
			<td><a href="${contextPath }/prj/tboard/tboardlist/${row.tno}">게시판이동</a></td>
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