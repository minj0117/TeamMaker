//유형 오프라인 버튼 클릭 시, 지역 나오기
const offline = document.querySelector("#offline");
const area = document.querySelector(".wrapper-area");
const online = document.querySelector("#online");

online.addEventListener("click", () => {
  console.log("온라인 클릭");
  area.style.display = "none";
});

offline.addEventListener("click", () => {
  console.log("오프라인 클릭");
  area.style.display = "flex";
});