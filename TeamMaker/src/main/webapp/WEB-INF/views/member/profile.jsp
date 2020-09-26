<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/prj/css/member/profile.css" />
</head>
<body>
	  <form action="" class="profileForm">
      <div class="profileTitle"><span>${vo.id }</span> 님의 프로필</div>
      <ul>
        <li>
          <label for="name">이름</label>
          <div>${vo.name }</div>
        </li>
        <li>
          <label for="birth">생년월일</label>
          <div>${vo.birth }</div>
        </li>
        <li>
          <label for="gender">성별</label>
          <div>${vo.gender }</div>
        </li>
        <li>
          <label for="phone">휴대폰 번호</label>
          <div>${vo.phone }</div>
        </li>
        <li>
          <label for="email">이메일</label>
          <div>${vo.email }</div>
        </li>

        <li>
          <label for="free">자기소개서</label>
          <textarea name="free" id="free" cols="10" rows="15" readonly="readonly">${vo.free }</textarea>
        </li>
      </ul>
      <div>
        <input type="button" class="closeBtn" value="닫기" />
      </div>
    </form>
</body>
</html>