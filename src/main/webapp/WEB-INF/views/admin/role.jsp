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
          <h2 style="margin-top: 20px;">임직원권한관리</h2>
          <form method="post" id="checkForm">
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>아이디</th>
                  <th>사원이름</th>
                  <th>성별</th>
                  <th>부서</th>
                  <th>직책</th>
                  <th>입사일</th>
                  <th>권한</th>
                  <th>권한부여</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="list">
                  <td><c:out value="${list.memberId}"/></td>
                  <td><c:out value="${list.name}"/></td>
                  <td><c:out value="${list.gender}"/></td>
                  <td id="dept"><c:out value="${list.dept}"/></td>
                  <td id="posit"><c:out value="${list.posit}"/></td>
                  <td><fmt:formatDate value="${list.registerdate}" pattern="yyyy-MM-dd"/></td>
                  <td id="authority"><c:out value="${list.authority}"/></td>
				  <td>
				  	<a type="button" href="/admin/userModify?memberId=${list.memberId}" class="delet btn btn-secondary" style="margin-bottom: 10px ; border-radius: 100px">수정</a>
				  </td>
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
        <li class="page-item disabled">
          <a class="page-link">Previous</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </nav>
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>