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
    <link rel="stylesheet" href="/resources/css/main/main.css" />
    <link rel="stylesheet" href="/resources/css/include/include.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
   
    
    
        
</head>
<body>
<%@ include file="include/header.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <%@ include file="include/nav.jsp" %>

        <main class="col-md-10 ms-sm-auto">
          <div class="container-fluid breack">
            <div class="col-md-3 col-lg-2 d-md-block bg-light " style="height:100%; float: left;" >

              <div class="col-sm3">
                <div class="profile">
                  <div class="profile_img">
                  	<c:if test="${empty member.image}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16" >
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                    </svg> 
                    </c:if>
                    <c:if test="${not empty member.image}">
					<img class="img-profile rounded-circle" style="width: 100px; height: 100px"
						src="<c:url value="/img/${member.image}"/>">
				</c:if>
                  </div>
                  <c:if test="${member != null}">
                  <div class="mb-3 row profile_name">
                    <label for="staticEmail" class="col-sm-5 col-form-label fw-bold">이름</label>
                    <div class="col-sm-8">
                      <input type="text" readonly class="form-control-plaintext" id="name" value="${member.name}">
                    </div>
                    <label for="staticEmail" class="col-sm-5 col-form-label fw-bold">직책</label>
                    <div class="col-sm-8">
                      <input type="text" readonly class="form-control-plaintext" id="posit" value="${member.posit}">
                    </div>
                  </div>
                  
                   
	                  <div class="col">
	                  	<form action="/getToWork" method="POST" style="padding: 10px">
	                  			<input type="hidden" name="memberId" id="memberId" value="${member.memberId}" >
	                  			<input type="hidden" name="name" id="name" value="${member.name}" >
	                       		<h5 > 출퇴근 관리</h5>
	                          	출근
	                           	<input class="form-control" type="time" name="workTime" id="workTime">
	                       
	                          	퇴근
	                          	<input class="form-control" type="time" name="endTime" id="endTime">


	                          	<input type="submit" class="btn btn-secondary breack" value="상태저장">


	                      </form>
	                   	</div>
	                  
                  </c:if>
                </div>
              </div>

              
            </div>
            
          </div>
    		 <div class="container-fluid breack">
				<div class="row gy-3">
					<div class=" col-6 col-sm-5  profile_freeboard "  style="height: 600px">
		              <div class="table-responsive">
		              <h4> 전자메일 게시판</h4>
		                <table class="table table-striped table-sm">
		                  <thead>
		                    <tr>
		                      <th class="col-1">번호</th>
		                      <th class="col-4">제목</th>
		                      <th class="col-2">작성자</th>
		                      <th class="col-3">날짜</th>
		                      <th class="col-2">조회수</th>
		                    </tr>
		                  </thead>
		                  <tbody>
		                   <tr>
		                      <td>1,001</td>
		                      <td>random</td>
		                      <td>data</td>
		                      <td>placeholder</td>
		                      <td>text</td>
		                    </tr>
		                  </tbody>
		                  
		                  
		                </table>
		              </div>
		
		            </div>

			            <div class=" col-6 col-sm-5 profile_freeboard">
			              <div class="table-responsive">
			              <h4> 공지사항게시판 </h4>
			                <table class="table table-striped table-sm">
			                  <thead>
			                    <tr>
			                      <th class="col-1">번호</th>
			                      <th class="col-4">제목</th>
			                      <th class="col-2">작성자</th>
			                      <th class="col-3">날짜</th>
			                      <th class="col-2">조회수</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                    <c:forEach var="list" items="${list}">
			                    <tr>
			                      <td>${list.bno}</td>
			                      <td>${list.title}</td>
			                      <td>${list.writer}</td>
			                      <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
			                      <td>${list.cnt}</td>
			                    </tr>
			                   </c:forEach>
			                   
			                  </tbody>
			                </table>
			              </div>
			
			            </div>
			                <div class="w-100 d-none d-md-block"></div>
			            <div class="col-6 col-sm-5 profile_freeboard " style="padding: 10px">
			
			
			     			 <div id='calendar'></div>
			
			
			
			            </div>
			
			            <div class=" col-6 col-sm-5 profile_freeboard">
			              <div class=" table-responsive">
			              <h4> 자유게시판 </h4>
			                <table class="table table-striped table-sm">
			                  <thead>
			                    <tr>
			                      <th class="col-1">번호</th>
			                      <th class="col-4">제목</th>
			                      <th class="col-2">작성자</th>
			                      <th class="col-3">날짜</th>
			                      <th class="col-2">조회수</th>
			                    </tr>
			                  </thead>
			                  <tbody>
			                    <tr>
			                      <td>1,001</td>
			                      <td>random</td>
			                      <td>data</td>
			                      <td>placeholder</td>
			                      <td>text</td>
			                    </tr>
			                   
			                  </tbody>
			                </table>
			              </div>
            		
        		  </div>				
				
				</div>          	
          


         
            
        	</div>
          	<div class="breack"></div>
        </main>
      </div>
    </div>
    <script src="/resources/js/fullCal/fullCalendar.js"></script>
		
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    
</body>
</html>