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
  findIDTag.addEventListener("click", findID_F);
  findPWTag.addEventListener("click", findPW_F);
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
