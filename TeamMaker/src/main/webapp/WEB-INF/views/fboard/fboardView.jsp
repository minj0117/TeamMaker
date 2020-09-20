<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scalnume=1.0" />
<title>main</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="http://localhost:8090/prj/css/fboard/fboardView.css" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<!-- 폰트 : 로고 -->
<link href="https://fonts.googleapis.com/css2?family=Kalam&display=swap"
	rel="stylesheet" />
<!-- 폰트 : 메뉴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap"
	rel="stylesheet" />
<!-- 폰트 : 메인 -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Sunflower:wght@300&display=swap"
	rel="stylesheet" />
<style type="text/css">
/* main : 페이징 */
main .paging {
  padding-left: 0px;
  display: flex;
  justify-content: center;
  font-size: 16px;
}

main .paging li {
  padding: 3px 8px;
  border: 1px solid var(--border-color);
  font-family: "Sunflower";
}

main .paging li a {
  font-family: "Sunflower";
  text-decoration: none;
  color: var(--text-color);
}

main .paging li:hover {
  background-color: var(--linen-color);
}
</style>
</head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	  <!-- main -->
    <main>
      <div class="container">
        <form action="" id="commPostView">
          <!-- 글 내용 -->
          <div class="commContentBox">
            <!-- article header 부분 -->
            <div class="comm_header">
              <div class="commTitle">
                <div class="title" id="title">${vo.title }</div>
                <div class="writerInfo">
                  <div class="image">
                    <img src="../img/defaultImg.jpg" alt="" />
                  </div>
                  <div class="profile_area">
                    <div class="profile_info">
                      <div class="rid" id="writer">${vo.writer }</div>
                    </div>
                    <div class="comm_info">
                      <span class="rdate" id="cdate">${vo.cdate }</span>
                      <span>조회수</span>
                      <span class="rcnt">${vo.cnt }</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- article content 부분 -->
            <div class="comm_content">
              <div class="comm_content1">
              	${vo.f_comment }
              </div>
            </div>
            <!-- 신고 버튼 부분 -->
            <div class="comm_content2">
              <a href="./reportForm.html" class="report" id="report">신고</a>
            </div>
          <!-- comm_btns 부분 -->
          <div class="comm_btns">
            <button class="modifyBtn">수정</button>
            <button class="deleteBtn">삭제</button>
            <button class="replyBtn">답글</button>
            <button class="listBtn">목록</button>
          </div>
        </form>
      </div>
    </main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
