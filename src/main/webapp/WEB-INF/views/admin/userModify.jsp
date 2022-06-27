<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../resources/css/include/include.css" />
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <div class="container-fluid">
      <div class="row">
        <%@ include file="../include/nav.jsp" %>
        <main class="col-md-10 ms-sm-auto">
        	<h2 class="breack">임직원권한수정</h2>
        	<form name="updateForm" role="form" method="post" action="/admin/update">
	        	<input type="hidden" name="memberId" value="${vo.memberId}" readonly="readonly">
	        	<div class="table-responsive">
	        		<table class="table">
	        			<tr>
	        				<th class="success">사원아이디</th>
	        				<td colspan="5">
	        					${vo.memberId}
	        				</td>
	        			</tr>
	        			<tr>
	        				<th class="success">사원이름</th>
	        				<td colspan="5">${vo.name}</td>
	        			</tr>
	        			<tr>
	        				<th>입사일</th><td><fmt:formatDate value="${vo.registerdate}" pattern="yyyy-MM-dd"/></td>
	        				<th>부서</th>
	        				<td>
	        					<select id="dept" name="dept">
									<option value="${vo.dept}">${vo.dept}</option>
									<option value="none">-----</option>
									<option value="대표자">대표이사</option>
									<option value="인사팀">인사팀</option>
									<option value="개발팀">개발팀</option>
									<option value="영업팀">영업팀</option>
							</select>
							</td>
	        				<th>직책</th>
	        				<td>
	        					<select id="posit" name="posit">
									<option value="${vo.posit}">${vo.posit}</option>
									<option value="none">-----</option>
									<option value="대표">대표</option>
									<option value="부장">부장</option>
									<option value="차장">차장</option>
									<option value="차장">과장</option>
									<option value="차장">대리</option>
									<option value="차장">사원</option>
							</select>
							</td>
	        			</tr>
	        			<tr>
	        				<th>권한</th>
	        				<td>
	        					<select id="authority" name="authority">
									<option value="${vo.authority}">${vo.authority}</option>
									<option value="none">-----</option>
									<option value="관리자">관리자</option>
									<option value="일반사용자">일반사용자</option>
							</select>
							</td>
	        			</tr>
	        		</table>
	        	</div>
				<table class="table table-condensed">
					<thead>
						<tr>
							<td><span style='float: right'>
									<button type="submit" id="role_btn" class="btn btn-default">목록</button>
									<button type="submit" id="update_btn" class="btn btn-default">수정</button>
									<button type="submit" class="btn btn-default">세부정보입력</button>
							</span></td>
						</tr>
					</thead>
				</table>
				</form>
			</main>
      </div>
    </div>
</body>
<script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script> <!-- 꼭 포함하세요 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#role_btn").on("click", function(){
			event.preventDefault();
			location.href = "/admin/role";
		})
	})
</script>
</html>