<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://localhost:8090/prj/css/include/main.css" />
<!-- header -->
     <!-- header -->
    <header>
      <div class="container">
        <div
          id="carouselExampleCaptions"
          class="carousel slide"
          data-ride="carousel"
        >
          <ol class="carousel-indicators">
            <li
              data-target="#carouselExampleCaptions"
              data-slide-to="0"
              class="active"
            ></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="${contextPath }/prj/img/banner1.jpg" class="d-block w-100" alt="..." />
              <div class="carousel-caption d-none d-md-block">
                <h5>TEAM MAKER</h5>
                <p>TEAM MAKER와 함께 여러분의 Portfolio를 채워 보세요</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="${contextPath }/prj/img/banner2.jpg" class="d-block w-100" alt="..." />
              <div class="carousel-caption d-none d-md-block">
                <h5>팀 매칭</h5>
                <p>당신에게 맞는 팀원을 TEAM MAKER와 함께</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="${contextPath }/prj/img/banner3.jpg" class="d-block w-100" alt="..." />
              <div class="carousel-caption d-none d-md-block">
                <h5>다양한 정보</h5>
                <p>당신에게 필요한 정보를 쉽게 찾을 수 있습니다.</p>
              </div>
            </div>
          </div>
          <a
            class="carousel-control-prev"
            href="#carouselExampleCaptions"
            role="button"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a
            class="carousel-control-next"
            href="#carouselExampleCaptions"
            role="button"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </header>
