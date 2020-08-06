<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 한사람 정보 표시</h1>
	<hr>
	<h5>${sessionScope.member.name}</h5>
	<h5>${sessionScope.member.id}</h5>
	<h5>${sessionScope.member.birth}</h5>
	<h5>${sessionScope.member.free}</h5>
</body>
</html>