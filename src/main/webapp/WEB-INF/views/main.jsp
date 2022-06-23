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
    <style type="text/css">
        .calendar{
            
            width:100%;
            text-align: center;
            font-size: 20px;
            
        }
    </style>
    
        
</head>
<body>
<%@ include file="include/header.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <%@ include file="include/nav.jsp" %>

        <main class="col-md-10 ms-sm-auto">
          <div class="container-fluid">
            <div class="row " style="margin-top: 20px;">

              <div class="col-2">
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
                    <label for="staticEmail" class="col-sm-5 col-form-label">이름</label>
                    <div class="col-sm-8">
                      <input type="text" readonly class="form-control-plaintext" id="name" value="${member.name}">
                    </div>
                    <label for="staticEmail" class="col-sm-5 col-form-label">직책</label>
                    <div class="col-sm-8">
                      <input type="text" readonly class="form-control-plaintext" id="posit" value="${member.posit}">
                    </div>
                  </div>
                   <div class="row justify-content-around profile_button " style="padding-bottom: 20px">
                    <input class="btn btn-outline-secondary col-4 " id="goin" type="button" value="출근" onclick="btnActive1()">
                    <input class="btn btn-outline-secondary col-4 "  id="leave" type="button" value="퇴근" onclick="btnActive2()" disabled>
                  </div>
                  </c:if>
                </div>
              </div>

              <div class="col profile_freeboard">
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

              <div class="col profile_freeboard">
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
            </div>
            <div class="row " style="margin-top: 20px;">

              <div class="col-2">
                <div class="profile"  style="height: 300px">
                   <div class="col">
                       <h5 > 출퇴근 관리</h5>
                       <form action="" >
                          출근
                           <input class="form-control" type="text" value="출근시간" readonly id="intime">
                        </form>
                        <form action="">
                          퇴근
                          <input class="form-control" type="text" value="퇴근시간" readonly id="outtime">
                   </form>
                   </div>
                </div>
              </div>

   			  <div class="col profile_freeboard ">

 
				<table id="calendar" class="calendar border-secondary">
				    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
				        <td><label onclick="prevCalendar()"><</label></td>
				        <td align="center" id="tbCalendarYM" colspan="5">
				        yyyy년 m월</td>
				        <td><label onclick="nextCalendar()">>
				            
				        </label></td>
				    </tr>
				    <tr>
				        <td align="center"><font color ="#F79DC2">일</td>
				        <td align="center">월</td>
				        <td align="center">화</td>
				        <td align="center">수</td>
				        <td align="center">목</td>
				        <td align="center">금</td>
				        <td align="center"><font color ="skyblue">토</td>
				    </tr> 
				</table>
 


              </div>

              <div class="col profile_freeboard">
                <div class="table-responsive">
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
        </main>
      </div>
    </div>
    <script type="text/javascript">

    function btnActive1()  {
         document.getElementById('goin').click;
         if(goin.disabled == false){
            goin.disabled = true;
            leave.disabled = false;
           
           }
         
       }

       function btnActive2()  {
       document.getElementById('leave').click;
         if(leave.disabled == false){
            leave.disabled = true;
            goin.disabled = false;
           
         }
       }
       </script>
	<script type="text/javascript">
        var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();//today의 Date를 세어주는 역할
        function prevCalendar() {//이전 달
        // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
        //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
        //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
         buildCalendar(); //달력 cell 만들어 출력 
        }
 
        function nextCalendar() {//다음 달
            // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
            //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
            //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
             buildCalendar();//달력 cell 만들어 출력
        }
        function buildCalendar(){//현재 달 달력 만들기
            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
            //이번 달의 첫째 날,
            //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
            //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
            //왜냐면 getMonth()는 0~11을 반환하기 때문
            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
            //이번 달의 마지막 날
            //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
            //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
            //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
            var tbCalendar = document.getElementById("calendar");
            //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
            var tbCalendarYM = document.getElementById("tbCalendarYM");
            //테이블에 정확한 날짜 찍는 변수
            //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
            //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
             tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
 
             /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
            while (tbCalendar.rows.length > 2) {
            //열을 지워줌
            //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
                  //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
             }
             var row = null;
             row = tbCalendar.insertRow();
             //테이블에 새로운 열 삽입//즉, 초기화
             var cnt = 0;// count, 셀의 갯수를 세어주는 역할
            // 1일이 시작되는 칸을 맞추어 줌
             for (i=0; i<doMonth.getDay(); i++) {
             /*이번달의 day만큼 돌림*/
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
             }
            /*달력 출력*/
             for (i=1; i<=lastDate.getDate(); i++) { 
             //1일부터 마지막 일까지 돌림
                  cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
                  cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                  cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
              if (cnt % 7 == 1) {/*일요일 계산*/
                  //1주일이 7일 이므로 일요일 구하기
                  //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                cell.innerHTML = "<font color=#F79DC2>" + i
                //1번째의 cell에만 색칠
            }    
              if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
                  //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                  cell.innerHTML = "<font color=skyblue>" + i
                  //7번째의 cell에만 색칠
                   row = calendar.insertRow();
                   //토요일 다음에 올 셀을 추가
              }
              /*오늘의 날짜에 노란색 칠하기*/
              if (today.getFullYear() == date.getFullYear()
                 && today.getMonth() == date.getMonth()
                 && i == date.getDate()) {
                  //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
               }
             }
        }
    </script>


<script language="javascript" type="text/javascript">
    buildCalendar();//
</script>
    
	<script>
        var chi = document.getElementById("merong");
        var chet = chi.getContext("2d");
        chet.beginPath();
        chet.strokeStyle="#f00";
        chet.lineWidth=20;
        chet.arc(130,150,100,0,(1.6)*Math.PI,false);
        chet.stroke();

    </script>
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
</body>
</html>