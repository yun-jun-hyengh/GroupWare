<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.team.groupware.domain.CalendarVO" %>
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
				<div class="container-fluid breack" >
					<div id='calendar'></div>
					
					<button type="button" class="btn btn-secondary breack float-end" > <a href="" style=" color: #fff">일정 등록</a> </button>
				</div>
			</main>
		</div>
	</div>
	<!--  <script src="../resources/js/fullCal/fullCalendar.js"></script>     -->   
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
/**
 * 
 */
 
 
 
 document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		height: '600px',
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next today',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		
		selectable : true, // 달력 일자 드래그 설정가능 
		droppable : true,
		editable : true,
		nowIndicator: true, // 현재 시간 마크
		locale: 'ko', // 한국어 설정
		events : [
				<%List<CalendarVO> calendarList = (List<CalendarVO>) request.getAttribute("calendarList");%>
				<%if (calendarList != null) {%>
				<%for (CalendarVO vo : calendarList) {%>
				{
					title : '<%=vo.getTitle()%>',
					start : '<%=vo.getCalstart()%>',
					end : '<%=vo.getCalend()%>',
					color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
				},
			<%}
		}%>
			]
	});
	calendar.render();
});
</script>
</html>