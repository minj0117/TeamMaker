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

	function writeFn(e){
		console.log("들어옴"+e);
 		e.preventDefault();
 		const rno = document.querySelector('input[type="hidden"]').value;
 		const rcontent =document.querySelector('#rcontent').value;
		const Info = JSON.stringify({rno:rno, rcontent:rcontent});
		$.ajax({
			data : Info,
			url : "http://localhost:8090/prj/replymod",
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
	} 
</script>
<body>
	<form action="/prj/tboard/modify" id="writeForm" name="writrForm" method="post">
		작성자 : <input type="text" id="bwriter" name="bwriter" value="${sessionScope.member.id}" readonly="readonly"><br>
		내용 : <textarea rows="10" cols="10" id="rcontent" name="rcontent">${view.rcontent }</textarea><br>
		<input type="hidden" name="rno" value="${view.rno }"	/>
		<input type="button" id="writeBtn" value="등록!">
	</form>
</body>
</html>