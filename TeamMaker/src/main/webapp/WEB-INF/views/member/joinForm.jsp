<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 대기창</h1>
	<form action="/prj/member/join" method="post">
		아이디 : <input type="text" id="id" name="id"><br>
		비밀번호 : <input type="password" id="pw" name="pw"><br>
		이름 : <input type="text" id="name" name="name"><br>
		생일 : <input type="date" id="birth" name="birth"><br>
		성별 : <input type="radio" name="gender" value="남">남
			 <input type="radio" name="gender" value="여">여<br>
		전화번호 : <input type="text" id="phone" name="phone"><br>
		이메일 : <input type="text" id="email" name="email"><br>
		소개 : <textarea rows="10" cols="10" id="free" name="free"></textarea><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>