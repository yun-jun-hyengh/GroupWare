<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <nav
          id="sidebarMenu"
          class="col-md-3 col-lg-2 d-md-block bg-light sidebar"
        >
          <div class="flex-shrink-0 p-3">
            <a
              href="../main/main.html"
              class="d-flex align-items-center link-dark text-decoration-none border-bottom"
            >
              <svg class="bi me-2" width="30" height="24">
                <use xlink:href="#bootstrap" />
              </svg>
              <span class="fs-5 fw-semibold">MAIN</span>
            </a>
            <ul class="list-unstyled ps-0 navbar-nav-scroll">
              <li class="mb-1">
                <button
                  class="btn btn-toggle align-items-center rounded collapsed"
                  data-bs-toggle="collapse"
                  data-bs-target="#home-collapse"
                  aria-expanded="fails"
                >
                  게시판
                </button>
                <div class="collapse" id="home-collapse">
                  <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/goji/gojilist" class="link-dark rounded">공지 게시판</a></li>
                    <li><a href="/free/freelist" class="link-dark rounded">자유 게시판</a></li>
                    <li><a href="/anonymous/anonymouslist" class="link-dark rounded">익명 게시판</a></li>
                  </ul>
                </div>
              </li>
              <li class="mb-1">
                <button
                  class="btn btn-toggle align-items-center rounded collapsed"
                  data-bs-toggle="collapse"
                  data-bs-target="#dashboard-collapse"
                  aria-expanded="false"
                >
                  업무보고
                </button>
                <div class="collapse" id="dashboard-collapse">
                  <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/work/worklist?bgno=1" class="link-dark rounded">일일보고</a></li>
                    <li><a href="/work/worklist?bgno=2" class="link-dark rounded">주간보고</a></li>
                    <li><a href="/work/worklist?bgno=3" class="link-dark rounded">월간보고</a></li>
                    <li><a href="/work/worklist?bgno=4" class="link-dark rounded">년간보고</a></li>
                  </ul>
                </div>
              </li>
              <li class="mb-1">
                <button
                  class="btn btn-toggle align-items-center rounded collapsed"
                  data-bs-toggle="collapse"
                  data-bs-target="#orders-collapse"
                  aria-expanded="false"
                >
                  전자메일
                </button>
                <div class="collapse" id="orders-collapse">
                  <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/message/relist" class="link-dark rounded">받은메일함</a></li>
                    <li><a href="/message/sendList" class="link-dark rounded">보낸메일함</a></li>
                  </ul>
                </div>
              </li>
              <li class="mb-1">
                <button
                  class="btn btn-toggle align-items-center rounded collapsed"
                  data-bs-toggle="collapse"
                  data-bs-target="#calendar-collapse"
                  aria-expanded="false"
                >
                  일정관리
                </button>
                <div class="collapse" id="calendar-collapse">
                  <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="/fullCal/calendar" class="link-dark rounded">캘린더</a></li>
                    <li><a href="/fullCal/list" class="link-dark rounded">일정목록</a></li>
                  </ul>
                </div>
              </li>
             
              <li class="border-top my-3"></li>
              <li class="mb-1">
                <button
                  class="btn btn-toggle align-items-center rounded collapsed"
                  data-bs-toggle="collapse"
                  data-bs-target="#account-collapse"
                  aria-expanded="false"
                >
                  관리자
                </button>
                <div class="collapse" id="account-collapse">
                  <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  	<li><a href="/admin/home" class="link-dark rounded">관리자페이지</a></li>
                    <li><a href="/admin/join" class="link-dark rounded">사원등록</a></li>
                    <li><a href="/admin/role" class="link-dark rounded">직원권한관리</a></li>
                    <li><a href="/admin/admin_commute" class="link-dark rounded">사원근태관리</a></li>
                    
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </nav>
</body>
</html>