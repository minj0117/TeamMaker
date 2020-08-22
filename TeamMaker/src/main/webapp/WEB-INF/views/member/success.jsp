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
	<%		
		}else{
	%>
	<h1>로그인 정보 없음</h1>
	<%
		}
	%>
</body>
</html>