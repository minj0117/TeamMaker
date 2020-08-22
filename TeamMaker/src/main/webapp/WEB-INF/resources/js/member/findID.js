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

