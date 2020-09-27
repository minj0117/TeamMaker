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
	href="http://localhost:8090/prj/css/recruit/rlist.css" />
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
</head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
		<div class="container">
			<div class="mtitle">팀원모집 검색</div>
			<div class="content">
				<!-- 사용자 선택 -->
				<form class="content content_up" action="${contextPath}/prj/checklist" method="get">
					<!-- 유형 -->
					<ul class="type">
						<li class="type title">유형</li>
						<ul class="type content">
							<li><input type="radio" name="onoff" id="online"
								value="on" /> <label for="online">온라인</label></li>
							<li><input type="radio" name="onoff" id="offline"
								value="off" /> <label for="offline">오프라인</label></li>
						</ul>
					</ul>
					<!-- 오프라인 클릭 시 지역 세분화 -->
					<ul class="area">
						<li class="area title">지역</li>
						<ul class="area content">
							<li><input type="radio" name="region" id="a1" value="서울" />
								<label for="a1">서울</label></li>
							<li><input type="radio" name="region" id="a2" value="경기" />
								<label for="a2">경기</label></li>
							<li><input type="radio" name="region" id="a3" value="인천" />
								<label for="a3">인천</label></li>
							<li><input type="radio" name="region" id="a4" value="대전" />
								<label for="a4">대전</label></li>
							<li><input type="radio" name="region" id="a5" value="대구" />
								<label for="a5">대구</label></li>
							<li><input type="radio" name="region" id="a6" value="부산" />
								<label for="a6">부산</label></li>
							<li><input type="radio" name="region" id="a7" value="울산" />
								<label for="a7">울산</label></li>
							<li><input type="radio" name="region" id="a8" value="광주" />
								<label for="a8">광주</label></li>
							<li><input type="radio" name="region" id="a9" value="강원" />
								<label for="a9">강원</label></li>
							<li><input type="radio" name="region" id="a10" value="세종" />
								<label for="a10">세종</label></li>
							<li><input type="radio" name="region" id="a11" value="충북" />
								<label for="a11">충북</label></li>
							<li><input type="radio" name="region" id="a12" value="충남" />
								<label for="a12">충남</label></li>
							<li><input type="radio" name="region" id="a13" value="경북" />
								<label for="a13">경북</label></li>
							<li><input type="radio" name="region" id="a14" value="경남" />
								<label for="a14">경남</label></li>
							<li><input type="radio" name="region" id="a15" value="전북" />
								<label for="a15">전북</label></li>
							<li><input type="radio" name="region" id="a16" value="전남" />
								<label for="a16">전남</label></li>
							<li><input type="radio" name="region" id="a17" value="제주" />
								<label for="a17">제주</label></li>
							<li><input type="radio" name="region" id="a18" value="전국" />
								<label for="a18">전국</label></li>
						</ul>
					</ul>

					<!-- 분야 -->
					<ul class="field">
						<li class="field title">분야</li>
						<ul class="field content">
							<li><input type="radio" name="category" id="gong" value="공모전" />
								<label for="gong">공모전</label></li>
							<li><input type="radio" name="category" id="dae" value="대외활동" />
								<label for="dae">대외활동</label></li>
							<li><input type="radio" name="category" id="study"
								value="스터디" /> <label for="study">스터디</label></li>
						</ul>
					</ul>

					<!-- 버튼 -->
            <div class="btnGrp">
              <div>
                <button type="submit" ><i class="fas fa-search"></i>검색</button>
              </div>
              <div>
                <i class="fas fa-redo"></i>
                <input type="button" value="초기화" />
              </div>
            </div>
				</form>

				<!-- 팀원모집 글보기 -->
				<div class="content content_down">
					<div class="content_down title">
						<div>글번호</div>
						<div>카테고리</div>
						<div>제목</div>
						<div>아이디</div>
						<div>조회수</div>
					</div>
					<div class="content_down list">
						<c:forEach var="row" items="${rlist }">
							<!-- list1 -->
							<div class="rnum">${row.rno }</div>
							<div class="rcategory">${row.rcategory }</div>
							<div class="rtitle">
								<a href="#"
									onClick="location.href='http://localhost:8090/prj/rview/${row.rno}'">${row.rtitle }</a>
							</div>
							<div class="id">${row.id }</div>
							<div class="rcnt">${row.rcnt }</div>
						</c:forEach>
					</div>
					<!-- 글쓰기 버튼 -->
					<c:if test='${!empty sessionScope.member}'>
					<div class="writeBtn">
							<i class="fas fa-pen"></i>
						<input type="button" value="글쓰기" onClick="location.href='${contextPath}/prj/recruitForm'">
					</div>
					</c:if>
				</div>

				<!-- 페이징 -->
				<div class="paging">
					<div id="pagingDiv">
						<c:if test="${paging.prev}">
							<a href="${paging.startPage - 1 }">이전</a>
						</c:if>
						<c:forEach var="num" begin="${paging.startPage}"
							end="${paging.endPage }">
						&nbsp;<a href="${num }">${num }</a>&nbsp;
					</c:forEach>
						<c:if test="${paging.next}">
							<a id="next" href="${paging.endPage + 1 }">다음</a>
						</c:if>
					</div>
					<form id="pagingFrm" name="pagingForm" action="rlist.do"
						method="get">
						<input type="hidden" id="pageNum" name="pageNum"
							value="${paging.cri.pageNum }"> <input type="hidden"
							id="amount" name="amount" value="${paging.cri.amount }">
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							//페이지 번호 이동
							$('#pagingDiv a').click(function(e) {
								e.preventDefault();
								$('#pageNum').val($(this).attr("href"));
								pagingForm.submit();

							});

							//게시글에 pageNum넘기기
							/*$('table a')
									.click(
											function(e) {
												e.preventDefault();
												var html = "<input type='hidden' name='idx' value='"
														+ $(this).attr("href")
														+ "'>";
												$('#pagingFrm').append(html);
												$('#pagingFrm').attr("action",
														"getContent.do");
												$('#pagingFrm').submit();
											});*/
						});
	</script>
</body>
</html>
