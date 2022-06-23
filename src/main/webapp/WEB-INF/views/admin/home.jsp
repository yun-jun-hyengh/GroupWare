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
    <script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
    <!-- Bootstrap core CSS -->
    <link
      href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <!-- Custom styles for this template -->
    <!-- <link rel="stylesheet" href="/resources/css/admin/admin.css" /> -->
    <link rel="stylesheet" href="/resources/css/include/include.css" />
</head>
<body>
	<%@ include file="../include/header.jsp" %>

    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/nav.jsp" %>

        <main class="col-md-10 ms-sm-auto">
          <h2 class="breack">사원목록</h2>
          <div class="table-responsive">
          <span style="float: right">
          	<input type="button" class="delet btn btn-secondary" id="delet" onclick="deleteValue()" value="삭제" style="margin-bottom: 10px ; border-radius: 100px">
          </span>
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th><input id="allCheck" type="checkbox" name="allCheck"/></th>
                  <th>아이디</th>
                  <th>사원이름</th>
                  <th>성별</th>
                  <th>부서</th>
                  <th>직책</th>
                  <th>입사일</th>
                  <th>권한</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="list">
                <tr>
                  <td><input name="RowCheck" type="checkbox" value="${list.memberId}"/></td>
                  <td><c:out value="${list.memberId}"/></td>
                  <td><c:out value="${list.name}"/></td>
                  <td><c:out value="${list.gender}"/></td>
                  <td><c:out value="${list.dept}"/></td>
                  <td><c:out value="${list.posit}"/></td>
                  <td><fmt:formatDate value="${list.registerdate}" pattern="yyyy-MM-dd"/></td>
                   <td><c:out value="${list.authority}"/></td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
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
    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			}
			else{
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	// ajax 부분 
	function deleteValue() {
		var url = "/admin/delete"; 
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { 
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url, // 전송 URL
				type : 'POST', // GET or POST 방식
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("/admin/home")
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
	
	
</script>
</html>