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
           <!--  <h2 class="breack">월별보고</h2> -->
           <c:choose>
           	<c:when test="${scri.bgno == 1}">
           		<h2 class="breack">일일보고</h2>
           	</c:when>
           	<c:when test="${scri.bgno == 2}">
           		<h2 class="breack">주간보고</h2>
           	</c:when>
           	<c:when test="${scri.bgno == 3}">
           		<h2 class="breack">월별보고</h2>
           	</c:when>
           	<c:when test="${scri.bgno == 4}">
           		<h2 class="breack">년간보고</h2>
           	</c:when>
           </c:choose>
          
          <form id="frm" method="POST">
          <div class="table-responsive">
          <span style="float: right">
          	<a type="button" href="/work/write">업무보고</a>
          </span>
          
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>부서</th>
                  <th>보고일자</th>
                </tr>
              </thead>
             
              <c:forEach items="${list}" var="list">
              <tbody>
                <tr>
                  <td>${list.bno}</td>
                  <td><a href="/work/workview?bno=${list.bno}&bgno=${scri.bgno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">${list.title}</a></td>
                  <td>${list.writer}</td>
                  <td>${list.dept}</td>
                  <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                </tr>
              </tbody>
              
              </c:forEach>
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
          <a class="page-link" href="/work/worklist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
        </li>
     	</c:if>
      	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li class="page-item"><a class="page-link" href="/work/worklist${pageMaker.makeSearch(idx)}">${idx}</a></li>
    	</c:forEach>
       	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        <li class="page-item">
          <a class="page-link" href="/work/worklist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
        </li>
        </c:if>
      </ul>
    </nav>
    <div class="input-group justify-content-center">
        <select name="searchType">
        	 <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      		 <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      		 <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>부서</option>
      		 <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+부서</option>
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
      self.location = "/work/worklist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   
</script>
</html>