"use strict";

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