<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.prj.member.dao.MemberDAOImpl" %> 
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장작성을 위해 사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8로 -->
<jsp:useBean id="member" class="com.kh.prj.member.vo.MemberVO" scope="page" /> <!-- 자바빈즈사용, 현재페이지 안에서만 빈즈 사용 -->
<jsp:setProperty name="member" property="id" /> <!-- 로그인 페이지에서 넘겨준 USERID를 받아 한명의 사용자의 USERID에 넣어줌 -->
<jsp:setProperty name="member" property="pw" />
<jsp:setProperty name="member" property="name" />
<jsp:setProperty name="member" property="birth" />
<jsp:setProperty name="member" property="gender" />
<jsp:setProperty name="member" property="phone" />
<jsp:setProperty name="member" property="email" />
<jsp:setProperty name="member" property="free" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		if(id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href='member/loginForm.jsp'");
			script.println("</script>");
		}
		if(member.getId() == null || member.getPw() == null || member.getName() == null 
				|| member.getBirth() == null || member.getGender() == null || member.getEmail() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('필수사항을 입력해주세요!!')");
			script.println("history.back()");
			script.println("</script>");
		}
			
	%>
</body>
</html>