<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function fn_overlapped(){
		var id = $('#id').val();
		if(id==''){
			alert("ID를 입력하세요");
		}
		$.ajax({
			type:"post",
			async:false,
			url:"${contextPath}/member/overlapped",
			dataType:"text",
			data:{id:id},
			success:function (data){
				if(data=='false'){
					alert("사용할 수 있는 아이디입니다.");
				}else{
					alert("사용 불가");
				}
			},
		});
	}
</script>
</head>
<body>
	<h1>회원가입 대기창</h1>
	<form action="/prj/member/join" method="post">
		<p>아이디 : <input type="text" id="id" name="id"> <input type="button" onClick="fn_overlapped()" value="중복체크" id="btnOverlapped"><br></p>
		<p><span class="errmsg" id="errmsg_id"></span></p>
		비밀번호 : <input type="password" id="pw" name="pw"><br>
		이름 : <input type="text" id="name" name="name"><br>
		생일 : <input type="date" id="birth" name="birth"><br>
		성별 : <input type="radio" name="gender" value="남">남
			 <input type="radio" name="gender" value="여">여<br>
		전화번호 : <input type="text" id="phone" name="phone"><br>
		이메일 : <input type="text" id="email" name="email"><br>
		소개 : <textarea rows="10" cols="10" id="free" name="free"></textarea><br>
		<input type="submit" id="submit" value="가입">
	</form>
</script>
</body>
</html>