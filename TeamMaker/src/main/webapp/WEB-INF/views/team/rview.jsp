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
	<h3>원글</h3>
	<table border="1" width="700">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${teamboardVO.bwriter }</td>
			<td>${teamboardVO.btitle }</td>
			<td>${teamboardVO.bcontent }</td>
			<td>${teamboardVO.cnt }</td>
		</tr> 
	</table>
	<h3>답글</h3>
	<!-- foreach 추가해야함 -->
	<table border="1" width="700">
		<tr>
			<th>내용</th>
			<th>작성자</th>
		</tr>
		<tr>
			<td>1</td>
			<td>2</td>
		</tr>
	</table>
	<form action="">
		답글 : <textarea rows="10" cols="10"></textarea>
		<input type="submit" value="작성">
	</form>
</body>
</html>