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
	href="http://localhost:8090/prj/css/recruit/rview.css" />
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function report(){
		let id = document.getElementById('rid').innerText;
		let bno = document.getElementById('rno').value
		let r_comment = document.getElementById('rcomment').innerText;
		const Info = JSON.stringify({id:id, bno:bno, r_comment:r_comment});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/member/rreportinsert",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data == 1){
					alert("신고되었습니다.");
				}else{
					alert("이미 신고되어 있는 게시글입니다.");
				}
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}

	function apply(){
		let id = "<%=session.getAttribute("id") %>"
		let tno = document.getElementById('tno').value;
		const Info = JSON.stringify({id:id,tno:tno});
		$.ajax({
			data : Info,
			url : "${contextPath}/prj/addapply",
			type : "post",
			dataType : "text",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data == -1){
					alert("이미 팀에 신청하였습니다.");
				}else if(data == -2){
					alert("이미 소속되어 있는 팀입니다.");
				}else{
					alert("신청했습니다.");
				}
			},
			error : function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
</script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
	%>
	<!-- uppermost -->
	<%@ include file="/WEB-INF/views/include/uppermost.jsp"%>

	<!-- nav -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- main -->
	<main>
		<div class="container">
			<form action="" id="makeTeamPostView">
				<!-- 글 내용 -->
				<div class="articleContentBox">
					<!-- article header 부분 -->
					<div class="article_header">
						<div class="articleTitle">
							<div class="rcategory" id="rcategory">${recruitVO.rcategory }</div>
							<div class="rtitle" id="rtitle">${recruitVO.rtitle }</div>
							<input type="hidden" id="rno" value="${recruitVO.rno }">
							<input type="hidden" id="tno" value="${recruitVO.tno }">
							<div class="writerInfo">
								<div class="profile_area">
									<div class="profile_info">
										<div class="rid" id="rid">${recruitVO.id }</div>
									</div>
									<div class="article_info">
										<span class="rdate" id="rdate">${recruitVO.rcdate }</span> <span>조회수</span>
										<span class="rcnt">${recruitVO.rcnt }</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- article content 부분 -->
					<div class="article_content">
						<div class="article_content1" id="rcomment">${recruitVO.rcomment }</div>
						<div class="article_content2">
							 <c:if test="${!empty sessionScope.member && vo.title ne '블라인드 처리' }">
							<a href="#" class="report" id="report" onClick="report()">신고</a>
							</c:if>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${recruitVO.id eq id}">
						<!-- article_btns 부분 -->
						<div class="article_btns">
							<input type="button" class="modifyBtn" value="수정">
							<input type="button" class="deleteBtn" value="삭제">
							<input type="button" class="listBtn" value="목록">
						</div>
					</c:when>
					<c:when test="${recruitVO.id ne id }">
						<div class="article_btns">
							<input type="button" class="listBtn" onClick="location.href='${contextPath}/prj/rlist.do'" value="목록">
							<!-- <a href="#" onClick="location.href='http://localhost:8090/prj/addapply?applyid=<%=id%>&tno=${recruitVO.tno }'" class="submitBtn" >신청</a>-->
							<c:if test='${!empty sessionScope.id }'>
							<a href="#" onClick="apply()" class="submitBtn" >신청</a>
							</c:if>
						</div>
					</c:when>
				</c:choose>
			</form>
		</div>

	</main>
	<!-- footer --> 
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
