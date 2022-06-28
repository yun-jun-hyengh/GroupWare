<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath}</c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "<br>"); %>
<header
      class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow"
    >
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="main"
        >(주)점프하는 껍데기</a
      >
      <button
        class="navbar-toggler position-absolute d-md-none collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#sidebarMenu"
        aria-controls="sidebarMenu"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
	  
      <div class="dropdown text-end col-1">
		<c:if test="${member != null}">      
        <a
          href="#"
          class="d-block link-dark text-decoration-none dropdown-toggle"
          id="dropdownUser1"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
        <!-- 프로필 사진 -->
        <c:if test="${empty member.image}">
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" style="background-color: white; border-radius: 100px;">
          <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
        </svg>
        </c:if>
       	<c:if test="${not empty member.image}">
					<img class="img-profile rounded-circle" style="width: 32px; height: 32px"
						src="<c:url value="/img/${member.image}"/>">
				</c:if>
			</a>
        <ul
          class="dropdown-menu text-small"
          aria-labelledby="dropdownUser1"
        >
          <li><a class="dropdown-item" href="/member/profile">내정보</a></li>
          <li><a class="dropdown-item" href="/member/commute">근태관리</a></li>
          <li><a class="dropdown-item" href="/member/rule">회사규칙</a></li>
          <li><hr class="dropdown-divider" /></li>
          <li><a class="dropdown-item" type="button" id="logoutBtn">로그아웃</a></li>
        </ul>
         </c:if>
      </div>
      
    </header>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href = "/";
		})
	})
</script>
</html>