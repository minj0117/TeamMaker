<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.addEventListener("load",init);
	function init(){
		let writeBtn = document.getElementById('writeBtn');
		writeBtn.addEventListener("click", writeFn);
	}
	//function writeFn(btitle,bno,bcontent,e){
	function writeFn(e){
		console.log("들어옴"+e);
 		e.preventDefault();
 		const bno = document.querySelector('input[type="hidden"]').value;
 		const btitle =document.querySelector('#btitle').value;
 		const bcontent =document.querySelector('#bcontent').value;
 		
		let btitlecheck = document.getElementById('btitle');
		if(btitlecheck.value.trim() == 0){
			alert("제목을 입력하세요");
			return;
		}
		console.log(btitle + " " + bno + " " + bcontent);
		const Info = JSON.stringify({btitle:btitle, bno:bno, bcontent:bcontent});
		$.ajax({
			data : Info,
			url : "http://localhost:8090/prj/tboard/modify",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("수정되었습니다.");
					window.open("about:blank","_self").close();
				}else{
					alert("오류가 발생했습니다.");
				}
			},
			error : function(data,textStatus){
				alert(data);
				alert("에러가 발생했습니다.");
			}
		}) 
		/*
		writeForm.method="post";
		writeForm.submit();
		setTimeout(function(){
		},3000)();
		window.open("about:blank","_self").close();*/
	}
	
</script>
<body>
	<form action="/prj/tboard/modify" id="writeForm" name="writrForm" method="post">
		작성자 : <input type="text" id="bwriter" name="bwriter" value="${sessionScope.member.id}" readonly="readonly"><br>
		제목 : <input type="text" id="btitle" value="${view.btitle }" name="btitle"><br>
		내용 : <textarea rows="10" cols="10" id="bcontent" name="bcontent">${view.bcontent }</textarea><br>
		<input type="hidden" name="bno" value="${view.bno }"	/>
<%-- 		<input type="button" id="writeBtn" name="writeBtn" onClick="writeFn('${view.btitle}','${view.bno }','${view.bcontent }')" value="등록!"> --%>
		<input type="button" id="writeBtn" value="등록!">
	</form>
</body>
</html>