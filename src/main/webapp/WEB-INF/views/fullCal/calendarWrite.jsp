<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<link
      href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />

    <!-- Custom styles for this template -->
    
    <link rel="stylesheet" href="../resources/css/include/include.css" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
   	
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="container-fluid">
		<div class="row">
		<%@ include file="../include/nav.jsp" %>
			<main class="col-md-10 ms-sm-auto">
				<div class="container-fluid breack " >
					<form action="/fullCal/calendarWrite" method="POST">
                    <div class="row ">
                    	<div class="col-2"></div>
                        <div class="col " style=" border: 2px solid rgb(161, 161, 161); border-radius: 30px">
                        	<div style="padding: 10px">
                            <h3 class="text-center fw-bold breack"> 일정 추가</h3>
                      		
                            <h5 class="breack">제목</h5>
                            <input class="form-control" type="text" name="title" placeholder="사유">
                            <h5 class="breack">내용</h5>
                            <input class="form-control" type="text" name="content" placeholder="내용" > 
                            <h5 class="breack">시작</h5>
                            <input class="form-control" type="date" name="calstart">
                            <h5 class="breack">끝</h5>
                            <input class="form-control" type="date" name="calend">
                            
                            <button type="button" class="btn btn-secondary breack" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary breack">일정 등록</button>
                            <div class="breack"></div>
                            </div>
                        </div>
                        <div class="col-2"></div>
                    </div>
                    </form>
                   </div>
            		
			</main>
		</div>
	</div>
	<script src="../resources/js/fullCal/fullCalendar.js"></script>       
</body>
</html>