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
	href="http://localhost:8090/prj/css/dae/dview.css" />
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
	function modFn(){
		window.location="${contextPath}/prj/dae/daeModForm/${daeVO.dno}";	
	}
	function delFn(){
		let dno = ${daeVO.dno};
		let check = confirm("정말로 삭제하시겠습니까?");
		if(check == 1){
		const dnoInfo = JSON.stringify({dno:dno});
		$.ajax({
			data : dnoInfo,
			url : "${contextPath}/prj/dae/del",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("삭제되었습니다.");
					window.location="${contextPath}/prj/dae/dlist"
				}else{
					alert("삭제에 실패했습니다.");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
		}else{
			return;	
		}
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
	 <div class="container">
        <div class="header">대외활동 상세보기</div>
        <div class="content">
          <!-- 제목 부분 -->
          <div class="content_title">
            <div>
              <span><i class="fas fa-atom"></i></span>
              <span>${daeVO.title }</span>
            </div>
            <div>
              <span>조회수</span>
              <span>:</span>
              <span class="views">${daeVO.cnt }</span>
            </div>
          </div>

          <!-- 개요 부분 -->
          <div class="content_overview">
            <div><img src="#" alt="" /></div>
            <table>
              <colgroup>
                <col style="width: 150px" />
              </colgroup>
              <tbody>
                <tr>
                  <th>주최</th>
                  <td>${daeVO.host }</td>
                </tr>
                <tr>
                  <th>분야</th>
                  <td>
                    <span>${daeVO.category }</span>
                  </td>
                </tr>
                <tr>
                  <th>접수 기간</th>
                  <td>${daeVO.applystart } ~ ${daeVO.applyend }</td>
                </tr>
                <tr>
                  <th>접수 방법</th>
                  <td>${daeVO.way }</td>
                </tr>
                <tr>
                  <th>참가비</th>
                  <td>${daeVO.applymoney }</td>
                </tr>
                <tr>
                  <th>총 상금</th>
                  <td>${daeVO.award }</td>
                </tr>
                <tr>
                  <th>홈페이지</th>
                  <td><a href="#">${daeVO.homepage }</a></td>
                </tr>
              </tbody>
            </table>
          </div>

          <!-- 세부사항 부분 -->
          <div class="content_detail">
            <div class="detail_title">○ 공모요강</div>
            <div class="info">
              <div class="info_title1">
                ${daeVO.title }
              </div>
              <div class="info_title2">
                <span>●</span><span>&nbsp;</span>응모 주제
              </div>
              <div class="info_content">
                ${daeVO.category }
              </div>
              <div class="info_title2">
                <span>●</span><span>&nbsp;</span>주요 내용
              </div>
              <div class="info_content">
                ${daeVO.d_comment }
              </div>
              <div class="info_title2">
                <span>●</span><span>&nbsp;</span>시작 일정
              </div>
              <div class="info_content">
                ${daeVO.startday }
              </div>
              <div class="info_title2">
                <span>●</span><span>&nbsp;</span>접수 방법
              </div>
              <div class="info_content">
                ${daeVO.way }
              </div>
            </div>
            <div class="detail_notice">
              <div>
                <span>TEAM</span>
                <span>MAKER</span>
              </div>
              <div>
                <span>
                  ⊙ 이 공모전의 내용은 주최사의 사정에 따라 변경될 수 있습니다.
                  반드시 주최사 공모요강을 확인하시기 바랍니다.</span
                >
                <span
                  >⊙ TEAM MAKER의 출처 표기에 따라서 전재 및 재배포를 할 수
                  있습니다.</span
                >
              </div>
            </div>
          </div>

          <!-- 버튼 -->
          <div class="btnGrp">
          <c:if test="${sessionScope.member.id eq 'admin' }">
            <button id="modifyBtn" onClick="modFn()">수정</button>
            <button id="deleteBtn" onClick="delFn()">삭제</button>
          </c:if>
            <button id="listBtn">목록</button>
          </div>
        </div>
      </div>
	 
	</main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
