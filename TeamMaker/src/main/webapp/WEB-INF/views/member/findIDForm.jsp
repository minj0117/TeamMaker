<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function fn_findid(){
	var result = "";
	var name = $('#name').val();
	var email = $('#email').val();
	console.log(name);
	console.log(email);
	const memberInfo = JSON.stringify({name:name,email:email});
	console.log(memberInfo);
	$.ajax({
		data : memberInfo,
		url : "http://localhost:8090/prj/member/findid",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			console.log(data);
			if(data == null){
				$('#message').text("아이디가 없습니다");
			}else{
				$('#message').text("아이디 : " + data);
			}
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
	})
}
</script>
<body>
	<h1>아이디 찾기</h1>
	<form action="/prj/member/findid" method="post">
		아이디 : <input type="text" id="name" name="name"><br>
		이메일 : <input type="text" id="email" name="email"><br>
		<div id="message"></div>
		<input type="button" onClick="fn_findid()" value="아이디 찾기">
	</form>
</body>
</html>