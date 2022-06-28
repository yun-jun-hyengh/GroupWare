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
          <h2 class="breack">수신함</h2>
          <form id="frm" method="POST">
          <div class="table-responsive">
          <span style="float: right">
          	<a type="button" href="/message/writer" class="btn  btn-outline-primary">편지쓰기</a>
          </span>
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>수신인</th>
                  <th>발신인</th>
                  <th>날짜</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="messageList" items="${messageList}">
                <tr>
                  <td>${messageList.msgnum}</td>
                  <td><a href="/message/msgview?msgnum=${messageList.msgnum}">${messageList.msgtitle}</a></td>
                  <td>${messageList.receiveId}</td>
                  <td>${messageList.sendId}</td>
                  <td>${messageList.regdate}</td>
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
      
        <li class="page-item">
          <a class="page-link" href="#">이전</a>
        </li>
       
        <li class="page-item"><a class="page-link" href="">1</a></li>
       
      
        <li class="page-item">
          <a class="page-link" href="#">다음</a>
        </li>
      
      </ul>
    </nav>
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

</html>