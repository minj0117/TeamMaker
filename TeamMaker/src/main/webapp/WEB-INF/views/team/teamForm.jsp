<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	window.addEventListener("load",init);
	function init(){
		let createBtn = document.getElementById('createBtn');
		createBtn.addEventListener("click", createFn);
	}
	function createFn(e){
		e.preventDefault();
		let title = document.getElementById('title');
		let createForm = document.getElementById('createForm');
		if(title.value.trim() == 0){
			alert("팀명을 입력하세요");
			return;
		}
		createForm.method="post";
		createForm.submit();
	}
	
</script>
<body>
	<form action="/prj/maketeam" id="createForm" name="createForm">
		팀장 : <input type="text" id="owner" name="owner" value="${sessionScope.member.id}" readonly="readonly"><br>
		팀명 : <input type="text" id="title" name="title"><br>
		팀설명 : <textarea rows="10" cols="10" id="acomment" name="acomment"></textarea><br>
		<input type="button" id="createBtn" name="createBtn" value="생성">
	</form>
</body>
</html>