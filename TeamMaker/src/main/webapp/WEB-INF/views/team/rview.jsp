<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	//원글 삭제
	function fn_originalDel(bno,bpw){
		let bpwcheck = prompt("비밀번호를 입력하세요");
		if(bpwcheck == bpw){
			const Info = JSON.stringify({bno:bno});
			$.ajax({
				data : Info,
				url : "http://localhost:8090/prj/tboard/delete.do",
				type : "post",
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data == 1){
						alert("게시글을 삭제했습니다.");
						location.href="http://localhost:8090/prj";
					}else{
						alert("오류가 발생했습니다.");
					}
				},
				error : function(data,textStatus){
					alert(data);
					alert("에러가 발생했습니다.");
				}
			})
		}else{

		}
	}

	//댓글 삭제
	function fn_del(rno,rpw){
		let rpwcheck = prompt("비밀번호를 입력하세요");
		if(rpwcheck == rpw){
			const Info = JSON.stringify({rno:rno});
			$.ajax({
				data : Info,
				url : "http://localhost:8090/prj/deleteReply",
				type : "post",
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data == 1){
						alert("댓글을 삭제했습니다.");
						location.reload();
					}else{
						alert("오류가 발생했습니다.");
					}
				},
				error : function(data,textStatus){
					alert(data);
					alert("에러가 발생했습니다.");
				}
			})
		}else{
			alert("비밀번호 틀림");
		}
	}

	//댓글 수정
	function fn_mod(rno,rpw){
		let rpwcheck = prompt("비밀번호를 입력하세요");
		if(rpwcheck == rpw){
			console.log("맞음");
			(function(){
				var popUrl = "http://localhost:8090/prj/modForm";	//팝업창에 출력될 페이지 URL
				var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl,"",popOption);
				//console.log(document.getElementById('content').innerText.)
			})();
		}else{
			console.log("틀림");
		}
		
	}
</script>
<body>
	<h3>원글</h3>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<table border="1" width="700">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
			<th>기능</th>
		</tr>
		<tr>
			<td>${teamboardVO.bwriter }</td>
			<td>${teamboardVO.btitle }</td>
			<td>${teamboardVO.bcontent }</td>
			<td>${teamboardVO.cnt }</td>
			<c:if test="${teamboardVO.bwriter eq id }">
			<td>
				<input type="button" value="수정">
				<input type="button" onClick="fn_originalDel('${teamboardVO.bno}','${teamboardVO.bpw }')" value="삭제">				
			</td>
			</c:if>
		</tr>
	</table>
	<h3>답글</h3>
	<table border="1" width="700">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>기능</th>
		</tr>
		<c:forEach var="row" items="${reply }">
			<tr>
				<td>${row.rwriter }</td>
				<td id="content">${row.rcontent }</td>
				<td><a href="#">답글</a> <c:choose>
						<c:when test="${row.rwriter eq id}">
							<input type="button" onClick="fn_del('${row.rno}','${row.rpw }')" value="삭제">
							<input type="button" onClick="fn_mod('${row.rno}','${row.rpw }')" value="수정">
			</tr>
			</c:when>
			</c:choose>
		</c:forEach>
	</table>
	<form action="${contextPath }/prj/writeReply" method="post">
		답글 :
		<textarea rows="10" cols="10" id="rcontent" name="rcontent"></textarea>
		비밀번호 : <input type="password" id="rpw" name="rpw" /> 
		<input type="hidden" name="rwriter" value="${sessionScope.member.id }" /> 
			<input type="hidden" name="bno" value="${teamboardVO.bno }" /> 
			<input type="submit" value="작성">
	</form>
</body>
</html>