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
	<form action="/prj/member/modify" method="post">
		아이디 : <input type="text" id="id" name="id" value='${sessionScope.member.id }' readonly="readonly"><br>
		비밀번호 : <input type="password" id="pw" name="pw" value='${sessionScope.member.pw }' ><br>
		이름 : <input type="text" id="name" name="name" value='${sessionScope.member.name }' readonly="readonly"><br>
		생일 : <input type="date" id="birth" name="birth" value='${sessionScope.member.birth }' readonly="readonly"><br>
		성별 : <input type="radio" name="gender" value="남" ${sessionScope.member.gender == "남" ? 'checked="checked"' : ''} 
				onclick="return(false);"/>남
			 <input type="radio" name="gender" value="여" ${sessionScope.member.gender == "여" ? 'checked="checked"' : ''}
			 	onclick="return(false);"/>여<br>
		전화번호 : <input type="text" id="phone" name="phone" value='${sessionScope.member.phone }'><br>
		이메일 : <input type="text" id="email" name="email" value='${sessionScope.member.email }'><br>
		소개 : <textarea rows="10" cols="10" id="free" name="free" value='${sessionScope.member.free }'></textarea><br>
		<input type="submit" value="가입">
	</form>
</body>
</html>