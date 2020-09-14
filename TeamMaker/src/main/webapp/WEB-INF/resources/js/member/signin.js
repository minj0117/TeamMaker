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

// -------------------------------------------------------------

window.addEventListener("load", init);

function init() {
  let loginBtn = document.querySelector("#loginBtn");
  let findIDTag = document.querySelector("#findID");
  let findPWTag = document.querySelector("#findPW");

  loginBtn.addEventListener("click", loginF);
}

function loginF(e) {
  e.preventDefault();
  let loginForm = document.querySelector("#loginForm");
  let idTag = document.querySelector("#id");
  let pwTag = document.querySelector("#pw");
  let errmsg_id = document.querySelector("#errmsg_id");
  let errmsg_pw = document.querySelector("#errmsg_pw");

  //아이디 체크
  if (!idTag.value.trim()) {
    errmsg_id.textContent = "아이디를 입력해 주세요.";
    idTag.select();
    return false;
  }
  errmsg_id.textContent = "";

  //비밀번호 체크
  if (!pwTag.value.trim()) {
    errmsg_pw.textContent = "비밀번호를 입력해 주세요.";
    pwTag.select();
    return false;
  }
  errmsg_pw.textContent = "";

  //서버 전송
  loginForm.submit();
}

// header 부분
//   <!-- data-interval: 시간 간격 -->
$(function () {
  //현재 문서가 로딩되면 = 현재 문서가 dom 구축되면
  $(".carousel").carousel({
    interval: 3000,
  });

  $("#btn1").on("click", function () {
    console.log("btn1");
    $(".carousel-item").carousel("cycle");
  });
  $("#btn2").on("click", function () {
    console.log("btn2");
    $(".carousel-item").carousel("pause");
  });
  $("#btn3").on("click", function () {
    console.log("btn3");
    $(".carousel").carousel("prev");
  });
  $("#btn4").on("click", function () {
    console.log("btn4");
    $(".carousel").carousel("next");
  });
});