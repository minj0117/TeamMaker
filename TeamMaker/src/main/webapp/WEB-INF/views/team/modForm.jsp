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
		let writeBtn = document.getElementById('writeBtn');
		writeBtn.addEventListener("click", writeFn);
	}
	function writeFn(e){
		e.preventDefault();
		let btitle = document.getElementById('btitle');
		if(btitle.value.trim() == 0){
			alert("제목을 입력하세요");
			return;
		}
		writeForm.method="post";
		writeForm.submit();
	}
	
</script>
<body>
	<form action="/prj/tboard/write.do" id="writeForm" name="writrForm">
		작성자 : <input type="text" id="bwriter" name="bwriter" value="${sessionScope.member.id}" readonly="readonly"><br>
		제목 : <input type="text" id="btitle" name="btitle"><br>
		내용 : <textarea rows="10" cols="10" id="bcontent" name="bcontent"></textarea><br>
		비밀번호 : <input type="password" id="bpw" name="bpw"/>
		<input type="hidden" name="tno" value="${tno }" />
		<input type="button" id="writeBtn" name="writeBtn" value="등록">
	</form>
</body>
</html>