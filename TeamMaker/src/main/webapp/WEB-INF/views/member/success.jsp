<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/*function fn_idsend(){
	var id = "${sessionScope.member.id}";
	const memberInfo = JSON.stringify({owner:id});
	$.ajax({
		data : memberInfo,
		url : "http://localhost:8090/prj/mylist/${id}",
		type : "post",
		dataType : "text",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			
		},
		error : function(data,textStatus){
			alert("에러가 발생했습니다.");
		}
	});
}*/
</script>
<body>
	<%
		if(id != null){
	%>
	<h1>성공</h1>
	<h2>${sessionScope.member.name}님 접속</h2>
	<a href="/prj/logout">로그아웃</a>
	<a href="/prj/test">세션 확인</a>
	<a href="/prj/member/modifyForm">회원수정</a>	
	<a href="/prj/member/list">리스트보기</a>
	<a href="/prj/member/delMemberForm">회원탈퇴</a>
	<a href="/prj/teamForm">팀만들기</a>
	<!-- <a href="#" onClick="fn_idsend()">내팀 보기</a> 
	<input type="button" onClick="fn_idsend()" value="내팀보기"> -->
	<a href="#" onClick="location.href='http://localhost:8090/prj/mylist/${sessionScope.member.id}?owner=${sessionScope.member.id }'">내가 만든 팀</a>
	<a href="#" onClick="location.href='http://localhost:8090/prj/affiliation/${sessionScope.member.id}?userid=${sessionScope.member.id }'">내가 소속된 팀 </a>
	<!-- /mylist/{id} -->
	<%		
		}else{
	%>
	<h1>로그인 정보 없음</h1>
	<%
		}
	%>
</body>
</html>