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
	href="http://localhost:8090/prj/css/member/adminmain.css" />
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
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function okFn(num){
		let id = document.getElementById('id'.concat(num)).innerText;
		let no = document.getElementById('no'.concat(num)).innerText;
		let r_comment = document.getElementById('r_comment'.concat(num)).innerText;
		let bno = document.getElementById('bno'.concat(num)).innerText;
		const Info = JSON.stringify({id:id,no:no,r_comment:r_comment,bno:bno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/member/reportok",
			type : "put",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data == 1){
					alert("처리되었습니다.");
				}else{
					alert("다시시도해주세요.");
				}
			},
			error : function(data,textStatus){
				alert("에러가 발생했습니다.");
			}
		})
	}
</script>
<body>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	
	    <!-- main -->
    <main>
      <div class="container">
        <div class="content">
          <!-- aside -->
           <aside>
            <div>
              <div class="atitle">관리자 페이지</div>
              <ul>
                <li class="astitle">신고</li>
                <ul>
                  <li><a href="${contextPath }/prj/member/rreport">팀원 모집 게시판 신고</a></li>
                  <li><a href="${contextPath }/prj/member/freport">자유 게시판 신고</a></li>
                </ul>
              </ul>
              <ul>
                <li class="astitle">고객센터</li>
                <ul>
                  <li><a href="#">1:1 문의</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </ul>
            </div>
          </aside>
          <!-- section -->
          <section>
            <div class="stitle"><span>관리자</span>님 반갑습니다</div>
            <form action="">
              <div class="formTitle">공지사항</div>
              <div class="notice">
                <div class="noticeTitle">
                  <div>2020 추석연휴 고객센터 운영 안내</div>
                  <div>2020.09.20</div>
                </div>
                <div class="noticeTitle">
                  <div>개인정보처리방침 개정 안내</div>
                  <div>2020.09.15</div>
                </div>
                <div class="noticeTitle">
                  <div>회원이용약관 개정 안내</div>
                  <div>2020.08.30</div>
                </div>
                <div class="noticeTitle">
                  <div>
                    서비스 일시 점검 안내 (2020년 9월 01일 새벽 0시 ~ 7시)
                  </div>
                  <div>2020.09.01</div>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
      <div class="clearfix"></div>
    </main>
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