<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
window.addEventListener("load",init);
function init(){
	let writeBtn = document.getElementById('writeBtn');
	writeBtn.addEventListener("click", writeFn);
}
function writeFn(e){
	e.preventDefault();
	console.log(e.target);
	let writeForm = document.getElementById('writeForm');
	//let idcheck = $('#message').val();
	let rpw = document.getElementById('rpw');
	let rtitle = document.getElementById('rtitle');
	let ronoff = document.querySelectorAll("input[name='ronoff']");
	let teamname = document.getElementById('teamname');
	//let rcategory = document.querySelectorAll("rcategory");
	if(rpw.value.trim().length == 0){
		alert('비밀번호를 입력하세요');
		return;
	}
	let ronofflist = Array.from(ronoff);
	if(ronofflist[0].checked != true && ronofflist[1].checked != true){
		alert('온/오프 여부를 입력하세요');
		return;
	}if(rtitle.value.trim().length == 0){
		alert('제목을 입력하세요');
		return;
	}if(teamname.value.trim().length == 0){
		alert('팀이름을 작성해주세요');
		return;
	}
	/*if(rcategory.value.trim() != pwcheck.value.trim()){
		alert("카테고리를 정해주세요.");
		return;
	}*/
	if($("#rcategory").val() == ""){
		alert("카테고리를 정해주세요.");
		return;
	}
	
	writeForm.method="post";
	writeForm.submit();
}
</script>
</head>
<body>
	<form action="/prj/insertR" id="writeForm" name="writeForm" method="post">
		아이디 : <input type="text" id="id" name="id" value="${sessionScope.member.id }" readonly="readonly"><br>
		비밀번호 : <input type="password" id="rpw" name="rpw"><br>
		온/오프 : 
		<input type="radio" name="ronoff" value="on">ON
		<input type="radio" name="ronoff" value="off">OFF<br>
		제목 : <input type="text" name="rtitle" id="rtitle"><br>
		팀이름 : <input type="text" name="teamname" id="teamname"><br>
		카테고리 : 
		<select name="rcategory" id="rcategory">
    		<option value="" selected="selected">카테고리</option>
    		<option value="공모전">공모전</option>
    		<option value="대외활동">대외활동</option>
    		<option value="스터디">스터디</option>
		</select><br>
		내용 : <textarea rows="20" cols="20" id="rcomment" name="rcomment"></textarea><br>
		지역 : <input type="text" name="rregion" id="rregion"><br>
		최대지원가능수 : <input type="text" id="maxApply" name="maxApply" placeholder="최대10명"><br>
		모집인원 : <input type="text" id="recruitcnt" name="recruitcnt" placeholder="최대10명"><br>
		<input type="submit" id="writeBtn" name="writeBtn" value="등록">
	</form>
</body>
</html>