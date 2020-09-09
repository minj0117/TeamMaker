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
 		const rwriter = document.querySelector('#rwriter').value;
 		const bno = document.getElementById('bno').value;
 		const rlevel = document.getElementById('rlevel').value
 		const rcontent =document.querySelector('#rcontent').value;
 		const rpw = document.getElementById('rpw').value;
 		const rgroup = document.getElementById('rgroup').value;
		const Info = JSON.stringify({rwriter:rwriter, rpw:rpw ,bno:bno, rlevel:rlevel ,rcontent:rcontent, rgroup:rgroup});
		$.ajax({
			data : Info,
			url : "http://localhost:8090/prj/rereply",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("등록되었습니다.");
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
		작성자 : <input type="text" id="rwriter" name="rwriter" value="${sessionScope.member.id}" readonly="readonly"><br>
		내용 : <textarea rows="10" cols="10" id="rcontent" name="rcontent"></textarea><br>
		비밀번호 : <input type="password" id="rpw" name="rpw"><br>		
		<input type="hidden" id=rno name="rno" value="${view.rno }"	/>
		<input type="hidden" id=bno name="bno" value="${view.bno }"	/>
		<input type="hidden" id=rlevel name="rlevel" value="${view.rlevel }"	/>
		<input type="hidden" id=rgroup name="rgroup" value="${view.rgroup }"	/>
		<input type="button" id="writeBtn" value="등록!">
	</form>
</body>
</html>