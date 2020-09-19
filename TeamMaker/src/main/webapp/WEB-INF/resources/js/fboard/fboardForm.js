"use strict";

//모바일 토글 버튼
const toggleBtn = document.querySelector(".toggleBtn");
const uplog = document.querySelectorAll(".uplog");
const navbar_upper = document.querySelector(".navbar_upper");

toggleBtn.addEventListener("click", () => {
  console.log("토글 버튼 클릭");
  Array.from(uplog).forEach((element) => {
    element.classList.toggle("active");
  });
  navbar_upper.classList.toggle("active");
});

//신고하기
window.addEventListener("load", init);
function init() {
  let reportTag = document.querySelector("#report");

  reportTag.addEventListener("click", report_F);
}

function report_F(event) {
  event.preventDefault();
  console.log("report");
  const url = event.target.href;
  const fname = event.target.id;
  const top =
    document.getElementById("commPostView").getBoundingClientRect().top + 200;
  const left =
    document.getElementById("commPostView").getBoundingClientRect().left + 300;
  console.log(top, left);
  const option =
    "width=550, height=350, top=" +
    top +
    ", left=" +
    left +
    ", location=no, resizable=no";
  console.log(option);
  window.open(url, fname, option);
}

//댓글 작성 상위 요소
const comment = document.querySelector(".comment");
//댓글 목록 상위 요소
const comments = document.querySelector(".comments");
//모달의 최상위 요소
const modal = document.querySelector(".modal");

//모달
const modalCancelBtn = modal.querySelector(".modal__cancel");
const modalDeleteBtn = modal.querySelector(".modal__delete");
const modalOverlay = modal.querySelector(".modal__overlay");

//댓글 작성 이벤트 발생 시 버튼 활성화
comment.querySelector(".rcontent").addEventListener("click", (e) => {
  e.target.nextElementSibling.style.display = "block";
});

//댓글 작성 이벤트 등록
comment.addEventListener("click", (e) => {
  const rcontent = comment.querySelector(".rcontent");
  //댓글 입력 시
  rcontent.addEventListener("keyup", function (e) {
    console.log(e.target.textContent.trim().length);
    const writeBtn = document.querySelector(".writeBtn");
    if (rcontent.textContent.trim().length > 0) {
      writeBtn.style.backgroundColor = "linen";
    } else {
      writeBtn.style.backgroundColor = "white";
    }
  });

  //취소
  if (e.target.classList.contains("cancelBtn")) {
    console.log("취소");
    comment.querySelector(".btngrp").style.display = "none";
    comment.querySelector(".rcontent").textContent = "";
  }

  //등록
  if (e.target.classList.contains("writeBtn")) {
    console.log("등록");
  }
});

//댓글 목록 이벤트 등록
comments.addEventListener("click", (e) => {
  console.log(e.target);
  //대댓글
  if (e.target.classList.contains("mybtn-rereply")) {
    console.log("대댓글");

    const parentComment = e.target.closest("[data-rnum]");
    const comment_clone = comment.cloneNode(true);
    const rcontent = comment_clone.querySelector(".rcontent");

    //대댓글 작성 요소가 없으면 추가
    if (parentComment.nextElementSibling) {
      if (parentComment.nextElementSibling.classList.contains("comment")) {
        return;
      }
    }

    //대댓글 들여쓰기(부모댓글, 자식댓글 판단)
    if (parentComment.classList.contains("parent")) {
      comment_clone.classList.add("rereply-depth1");
    } else {
      comment_clone.classList.add("rereply-depth2");
    }
    //복제한 노드의 댓글 내용 비우기
    comment_clone.querySelector(".rcontent").textContent = "";

    //버튼 보이기
    comment_clone.querySelector(".btngrp").style.display = "block";

    //답글 바탕색 초기화
    comment_clone.querySelector(".writeBtn").style.backgroundColor = "white";

    //버튼명 => 답글
    comment_clone.querySelector(".writeBtn").textContent = "등록";

    //클래스명 변경
    comment_clone
      .querySelector(".writeBtn")
      .classList.replace("writeBtn", "replyWriteBtn");

    //댓글 입력 시
    rcontent.addEventListener("keyup", (e) => {
      console.log(e.target.textContent.trim().length);
      const writeBtn = document.querySelector(".replyWriteBtn");
      if (rcontent.textContent.trim().length > 0) {
        writeBtn.style.backgroundColor = "linen";
      } else {
        writeBtn.style.backgroundColor = "white";
      }
    });

    //부모노드의 형제노드로 댓글 작성 추가
    parentComment.after(comment_clone);
    //커서 지정
    // comment_clone;
  }
  //대댓글 처리
  else if (e.target.classList.contains("replyWriteBtn")) {
    console.log("대댓글 처리");
  }

  //삭제
  else if (e.target.classList.contains("mybtn-delete")) {
    console.log("삭제");

    modal.classList.remove("hidden");

    //모달에 삭제 대상 rnum값 전달
    const rnum = e.target.closest("div[data-rnum]").getAttribute("data-rnum");
    modal.setAttribute("data-rnum", rnum);
  }

  //숨김아이템
  else if (e.target.classList.contains("mybtn-ellipsis")) {
    console.log("숨김 아이템");
    const hiddenMenu = e.target.parentElement.querySelector("ul.hiddenMenu");
    const ellipsis = e.target;

    //댓글 목록의 숨김 아이템을 모두 숨김
    Array.from(comments.querySelectorAll(".mybtn-ellipsis")).forEach(
      (element) => {
        if (element.isEqualNode(ellipsis)) return;
        element.style.display = "";
      }
    );
    Array.from(comments.querySelectorAll(".hiddenMenu")).forEach((element) => {
      if (element.isEqualNode(hiddenMenu)) return;
      element.style.display = "";
    });

    //댓글 목록의 숨김 아이템을 토글 처리
    if (hiddenMenu.style.display === "block") {
      hiddenMenu.style.display = "none";
    } else {
      hiddenMenu.style.display = "block";
      ellipsis.style.display = "block";
    }
  }
  //취소
  else if (e.target.classList.contains("cancelBtn")) {
    console.log("취소");
    e.target.closest(".comment").previousElementSibling.style.display = "grid";
    e.target.closest(".comment").remove();
  }
});

// 모달 이벤트 등록 시작
modalOverlay.addEventListener("click", (e) => {
  modal.classList.add("hidden");
});

//취소
modalCancelBtn.addEventListener("click", (e) => {
  modal.classList.add("hidden");
});
//삭제
modalDeleteBtn.addEventListener("click", (e) => {
  modal.classList.add("hidden");
  console.log("삭제진행");
  // deleteComment(e);
});
// 모달 이벤트 등록 종료

//수정버튼 클릭 시
window.addEventListener("load", init);
function init() {
  const modifyTag = document.querySelectorAll(".mybtn.mybtn-modify");

  Array.from(modifyTag).forEach((modi) => {
    modi.addEventListener("click", modifyBtn_F);
  });
}

function modifyBtn_F(event) {
  event.preventDefault();
  const url = event.target.getAttribute("data-url");
  const fname = event.target.id;
  const top =
    document.getElementById("commPostView").getBoundingClientRect().top + 200;
  const left =
    document.getElementById("commPostView").getBoundingClientRect().left + 300;
  console.log(top, left);
  const option =
    "width=400, height=400, top=" +
    top +
    ", left=" +
    left +
    ", location=no, resizable=no";
  console.log(option);
  window.open(url, fname, option);
}