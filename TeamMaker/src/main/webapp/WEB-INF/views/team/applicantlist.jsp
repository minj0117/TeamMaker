<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function fn_send(e){
		let 
	}
</script>
<body>
	<h1>팀 목록</h1>
	${sessionScope.member.id}
	<%
		String id = (String) session.getAttribute("id");
	%>
	<h1><%=id%></h1>
	<%
		if (id != null) {
	%>
	<form id="frmApply" action="${contextPath }/prj/addteamuser" method="post">
		<table border="1" width="700">
			<tr>
				<th>지원자</th>
				<th>선택</th>
			</tr>
			<c:forEach var="row" items="${list }">
				<tr>
					<td>${row.applyid }</td>
					<td><input type="checkbox" name="applycant"
						value="${row.applyid }" /></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden"  name="tno" value="<%=request.getAttribute("tno") %>"/>
		<input type="submit"  value="팀 생성">
	</form>
	<%
		} else {
	%>
	<h1>권한이 없습니다.</h1>
	<%
		}
	%>
</body>
</html>