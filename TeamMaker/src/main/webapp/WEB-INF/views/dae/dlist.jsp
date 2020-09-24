<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
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
	href="http://localhost:8090/prj/css/dae/dlist.css" />
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
function checkbox(){
	  console.log("들어옴");
	  var checkedValue = [];
	  $("input[name='d1']:checked").each(function(index, item){
			checkedValue.push($(item).val());
	  });
	  /*$.get("${contextPath}/prj/dae/checklist",
	            {val:checkedValue},
	             function(data){},
	             "json"
	   )*/
	  location.href="${contextPath}/prj/dae/checklist?value=checkedValue";
	
}
</script>
</head>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
        <form action="${contextPath }/prj/dae/checklist" method="get">
		<div class="container">
        <div id="main_title">대외활동</div>
        <div class="menu">
          <ul class="dae_menu">
            <li>
              <input type="checkbox" name="d1" id="d1" value="인턴십" />
              <label for="d1">인턴십</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d2" value="교육/멘토링"/>
              <label for="d2">교육/멘토링</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d3" value="서포터즈"/>
              <label for="d3">서포터즈</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d4" value="해외탐방"/>
              <label for="d4">해외탐방</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d5" value="국내봉사"/>
              <label for="d5">국내봉사</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d6" value="해외봉사"/>
              <label for="d6">해외봉사</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d7" value="강연"/>
              <label for="d1">강연</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d8" value="마케터"/>
              <label for="d8">마케터</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d9" value="홍보대사"/>
              <label for="d9">홍보대사</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d10" value="기자단"/>
              <label for="d10">기자단</label>
            </li>
            <li>
              <input type="checkbox" name="d1" id="d11" value="기타"/>
              <label for="d11">기타</label>
            </li>
          </ul>
          <ul class="menuBtn">
            <li>
              <button class="findBtn" onClick="checkbox()"><i class="fas fa-search"></i>검색</button>
              <button class="resetBtn">
                <i class="fas fa-redo"></i>초기화
              </button>
            </li>
          </ul>
        </div>
          </form>

        <!-- main : 내용 부분 -->
        <div class="content">
          <ul>
          	<c:forEach var="row" items="${list }">
            <li>
              <a href="${contextPath }/prj/dae/dview/${row.dno}">
                <img src="${contextPath }/imgs/${row.pic }" alt="" />
                <div class="title">${row.title }</div>
              </a>  
                <div class="info">
                  <p>접수 : ${row.applystart }  ~ ${row.applyend } </p>
                  <p>주최 : ${row.host }</p>
                </div>
            </li>
            </c:forEach>
          </ul>
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
					<form id="pagingFrm" name="pagingForm" action="dlist"
						method="get">
						<input type="hidden" id="pageNum" name="pageNum"
							value="${paging.cri.pageNum }"> <input type="hidden"
							id="amount" name="amount" value="${paging.cri.amount }">
					</form>
				</div>
				<c:if test="${sessionScope.member.id eq 'admin' }">
				<input type="button" onClick="location.href='${contextPath}/prj/dae/daeForm'" value="글쓰기">
				</c:if>
	</main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
						});
	</script>
</body>
</html>
