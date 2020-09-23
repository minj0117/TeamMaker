<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
    <title>main</title>
    <!-- bootstrap -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
	    <link rel="stylesheet" href="http://localhost:8090/prj/css/team/teamboard.css" />
    <!-- font awesome -->
    <script
      src="https://kit.fontawesome.com/2d323a629b.js"
      crossorigin="anonymous"
    ></script>
    <!-- 폰트 -->
    <!-- 폰트 : 로고 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Kalam&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 : 메뉴 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap"
      rel="stylesheet"
    />
    <!-- 폰트 : 메인 -->
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function delFn(){
		let bno = document.getElementById('bno').value;
		
		const Info = JSON.stringify({bno:bno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/tboard/fileDelete",
			type : "delete",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("삭제성공");
					window.location="${contextPath}/prj/tboard/boardList?tno=${fvo.tno}"
				}else{
					alert("삭제실패");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}
	</script>
  </head>
<body>
   	<!-- uppermost -->
    <%@ include file="/WEB-INF/views/include/uppermost.jsp" %>
    <!-- nav -->
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<main>
		<h1>글 상세</h1>
	<hr>
		<input name="bno" type="hidden" id="bno" value="${fvo.bno}" />
		<table border="1">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><div name="title">${fvo.title }</div></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${fvo.writer }</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><div name="f_comment" cols="40" rows="10">${fvo.f_comment }</div></td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left"><div type="text">${fvo.cdate }</div></td>
			</tr>
			
			<c:if test="${fvo.name ne null}">
			<tr>
				<td bgcolor="orange">첨부파일</td>
				<td align="left"><a href="${contextPath }/prj/fileDownload?name=${fvo.name}">${fvo.name }</a></td>
			</tr>
			</c:if>
		</table>
	<hr>
	<input type="button" onClick="location.href='${contextPath}/prj/tboard/fileModForm?bno=${fvo.bno }'" value="수정">
	<input type="button" onClick="delFn()" value="삭제">
	<a href="#">글 목록</a>
	</main>
	<!-- footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>