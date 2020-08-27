<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	window.addEventListener("load",init);
	function init(){
		let applyBtn = document.getElementById('applyBtn');
		joinBtn.addEventListener("click", applyFn);
	}
	function applyfn(){
		
	}
</script>
<body>
	<table border="1" width="700">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>카테고리</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>${recruitVO.id }</td>
			<td>${recruitVO.rtitle }</td>
			<td>${recruitVO.rcomment }</td>
			<td>${recruitVO.rcategory }</td>
			<td>${recruitVO.rcnt }</td>
		</tr> 
	</table>
</body>
</html>