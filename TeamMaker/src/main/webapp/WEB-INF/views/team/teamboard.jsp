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
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.bwriter }</td>
			<td><a href="${contextPath }/prj/tboard/tboarddetail/${row.bno}">${row.btitle }</a></td>
			<td>${row.cnt }</td>
			<td>${row.bcdate }</td>
		</tr> 
		</c:forEach>
	</table>
	<form action="${contextPath }/prj/tboard/writeForm.do" method="post">
		<input type="hidden" name="tno" value="${tno}" />
		<input type="submit" value="글쓰기" />
	</form>

	<% 
		}else{
	%>
		<h1>권한이 없습니다.</h1>
	<%
		}
	%>
</body>
</html>