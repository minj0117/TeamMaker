<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function fn_rmod(){
		var rcontent = document.getElementById("content").innerText;
		console.log(rcontent);
		$.ajax({
			data : {"rcontent" : rcontent},
			url : "http://localhost:8090/prj/teamboard/modifyReply",
			type : "post",
			dataType : "JSON",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				alert(data);
			},
			error : function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		})
	}
</script>
</head>
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
		</tr>
		<tr>
			<td>${teamboardVO.bwriter }</td>
			<td>${teamboardVO.btitle }</td>
			<td>${teamboardVO.bcontent }</td>
			<td>${teamboardVO.cnt }</td>
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
			<c:choose>
				<c:when test="${row.rwriter eq id}">
					<tr>
						<td>${row.rwriter }</td>
						<td id="content"  >${row.rcontent }</td>
						<td>
						<input type="button" id="rreply" name="rreply" value="답글"/>
						<input type="button" id="rdel"  name="rdel" value="삭제"/>
						<input type="button" id="rmod" name="rmod" onClick="fn_rmod()" value="수정"/>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${row.rwriter }</td>
						<td>${row.rcontent }</td>
						<td><input type="button" id="rreply" name="rreply" value="답글"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
	<form action="${contextPath }/prj/writeReply" method="post">
		답글 :
		<textarea rows="10" cols="10" id="rcontent" name="rcontent"></textarea>
		비밀번호 : <input type="password" id="rpw" name="rpw" /> <input
			type="hidden" name="rwriter" value="${sessionScope.member.id }" /> <input
			type="hidden" name="bno" value="${teamboardVO.bno }" /> <input
			type="submit" value="작성">
	</form>
</body>
</html>