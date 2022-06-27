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
          <h2 style="margin-top: 20px;">임직원근태관리</h2>
          <form method="post" id="checkForm" action="/admin/excelDown">
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>아이디</th>
                  <th>사원이름</th>
                  <th>출근시간</th>
                  <th>퇴근시간</th>
                  <th>근무일자</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="list">
              <tr>
              	  <td>${list.memberId}</td>
              	  <td>${list.name}</td>
              	  <td>${list.workTime}</td>
              	  <td>${list.endTime}</td>
              	  <td>${list.regdate}</td>
              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="row">
        	<div class="col-12">
<<<<<<< Updated upstream
        		<input type="submit" class="btn btn-info" value="Excel">
=======
<<<<<<< HEAD
        		<input type="submit" class="btn btn-info float-end breack" style="color: #fff" value="Excel" >
=======
        		<input type="submit" class="btn btn-info" value="Excel">
>>>>>>> e311d27ce1c1c5918dffe11071eec93da029024a
>>>>>>> Stashed changes
        	</div>
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