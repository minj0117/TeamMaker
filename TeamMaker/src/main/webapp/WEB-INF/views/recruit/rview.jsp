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
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>카테고리</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${recruitVO.id }</td>
			<td>${recruitVO.rtitle }</td>
			<td>${recruitVO.rcomment }</td>
			<td>${recruitVO.rcategory }</td>
			<td>${recruitVO.rcnt }</td>
		</tr> 
	</table>
	<input type="button" id="applyBtn" name="applyBtn" value="지원하기">
</body>
</html>