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
	<h1>회원 목록</h1>
	${sessionScope.member.id}
	<%
		String id = (String) session.getAttribute("id");
	%>
		<h1><%=id %></h1>
	<%
		if(id != null && id.equals("admin")){
	%>	
	<table border="1" width="700">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>자기소개</th>
			<th>신고받은 횟수</th>
			<th>신고</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.id }</td>
			<td>${row.name }</td>
			<td>${row.birth }</td>
			<td>${row.gender }</td>
			<td>${row.phone }</td>
			<td>${row.email }</td>
			<td>${row.free }</td>
			<td>${row.dancntnumber }</td>
			<td><a href="#" onClick="location.href='http://localhost:8090/prj/member/dancnt?id=${row.id}'">신고</a></td>
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