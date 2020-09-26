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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function pwCheck(){
		let pw = prompt("비밀번호를 입력하세요");
		let fno = document.getElementById('fno').value;
		const Info = JSON.stringify({fno:fno,pw:pw});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/fboard/pwcheck",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					window.location="${contextPath}/prj/fboard/fboardModForm?fno="+fno;
				}else{
					alert("비밀번호가 틀렷습니다.");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}

	function delFn(){
		let pw = prompt("비밀번호를 입력하세요");
		let fno = document.getElementById('fno').value;
		const Info = JSON.stringify({fno:fno,pw:pw});
		$.ajax({
				data : Info,
				url : "${contextPath}/prj/fboard/fboarddel",
				type : "delete",
				dataType : "text",
				contentType : "application/json; charset=UTF-8",
				success : function(data){
					if(data == 1){
						window.location="${contextPath}/prj/fboard/fboardList";
					}else{
						alert("비밀번호가 틀렷습니다.");
					}
				},
				error : function(data){
					alert("에러발생")
				}
			})
	}

	function replyFn(){
		let f_comment = document.getElementById('f_comment').value;
		let fno = document.getElementById('fno').value;
		const Info = JSON.stringify({fno:fno,f_comment:f_comment});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/fboard/replyinsert",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("댓글등록 완료");
					location.reload();
				}else{
					alert("댓글 등록에 실패했습니다.");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}

	function replydel(num) {
		let fno = document.getElementById('replyfno'.concat(num)).value;
		const Info = JSON.stringify({fno:fno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/fboard/replydelete",
			type : "delete",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("댓글삭제 완료");
					location.reload();
				}else{
					alert("댓글 삭제에 실패했습니다.");
				}
			},
			error : function(data){
				alert("에러발생")
			}
		})
	}

	function report(){
		let id = document.getElementById('writer').innerText;
		let bno = document.getElementById('fno').value;
		let r_comment = document.getElementById('f_comment').innerText;
		const Info = JSON.stringify({id:id, bno:bno, r_comment:r_comment});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/member/reportinsert",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data == 1){
					alert("신고되었습니다.")
				}else{
					alert("이미 신고되어 있는 게시글입니다.");
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
              <div class="comm_content1" id="f_comment">
              	${vo.f_comment }
              </div>
            </div>
            <!-- 신고 버튼 부분 -->
            <c:if test='${!empty sessionScope.member }'>
            <div class="comm_content2">
              <a href="#" class="report" id="report" onClick="report()">신고</a>
            </div>
            </c:if>
          <!-- comm_btns 부분 -->
          <div class="comm_btns">
          	<c:if test='${sessionScope.member.id eq vo.writer }'>
            <button class="modifyBtn" onClick="pwCheck()">수정</button>
            <button class="deleteBtn" onClick="delFn()">삭제</button>
            </c:if>
            <button class="replyBtn">답글</button>
            <button class="listBtn">목록</button>
          </div>
          <input type="hidden" id="fno" value="${vo.fno }"> 
        </form>
        <div>
        	<c:forEach var="row" items="${list }" varStatus="status">
        		<div>${row.f_comment } | ${row.writer }
        		<c:if test='${row.writer == sessionScope.member.id }'>
        		<input type="hidden" id="replyfno${status.index }" value="${row.fno }"/>
        		<input type="button" onClick="replydel('${status.index }')" value="삭제">
        		</c:if>
        		</div>
        	</c:forEach>
        </div>
        <c:if test='${!empty sessionScope.member }'>
        <form>
        <textarea rows="5" cols="50" id="f_comment" name="f_comment"></textarea>
        <input type="button" onClick="replyFn()" value="등록">
        </form>
        </c:if>
      </div>
    </main>
	<!-- footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
