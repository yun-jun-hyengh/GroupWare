<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
    <link
      href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="../resources/css/admin/admin.css" />
    <link rel="stylesheet" href="../resources/css/include/include.css" />
</head>
<body>
<%@ include file="../include/header.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/nav.jsp" %>
        <main class="col-md-10 ms-sm-auto">
          <h2 class="breack">익명게시판</h2>
          <form id="frm" method="POST">
          <div class="table-responsive">
          <span style="float: right">
          	<a type="button" href="/anonymous/writer" class="btn  btn-outline-primary">글작성</a>
          </span>
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일자</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="list" items="${anonymouslist}">
                <tr>
                  <td class="col-1">${list.bno}</td>
                  <td class="col-5"><a href="/anonymous/view?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">${list.title}</a></td>
                  <td class="col-1">익명</td>
                  <td class="col-2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.regdate}"/></td>
                  <td class="col-1">${list.cnt}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          </form>
        </main>
      </div>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
      <c:if test="${pageMaker.prev}">
        <li class="page-item">
          <a class="page-link" href="/anonymous/anonymouslist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
        </li>
       </c:if>
       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        <li class="page-item"><a class="page-link" href="/anonymous/anonymouslist${pageMaker.makeSearch(idx)}">${idx}</a></li>
       </c:forEach>
       <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        <li class="page-item">
          <a class="page-link" href="/anonymous/anonymouslist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
        </li>
       </c:if>
      </ul>
    </nav>
    <div class="input-group justify-content-center">
        <select name="searchType">
        	 <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      		 <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      	<!--  
      		 <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>작성자</option>
      		 <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+작성자</option>
        -->
        </select>
        <input type="text" name="keyword" id="keywordInput" class="col-3" placeholder="검색어를 입력해주세요" value="${scri.keyword}">
        <button id="searchBtn" class="btn btn-outline-secondary" type="button">검색</button>
      </div>
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $('#searchBtn').click(function() {
      self.location = "/anonymous/anonymouslist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   
</script>
</html>