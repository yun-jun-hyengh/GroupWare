<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
crossorigin="anonymous"
/>
<link rel="stylesheet" href="../resources/css/include/include.css" /> 
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class="container-fluid">
	 	<div class="row">
	  	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
		  	 <main class="col-md-10 ms-sm-auto">
            <h3>프로필 수정</h3>
            <div class="container-fluid">
            	<form name="form1" method="post" action="/member/updatemember" enctype="multipart/form-data">
                <table class="table border-secondary">
                    <tbody>
                      <tr >
                        <th class=" table-active">이미지</th>
                        <c:if test="${not empty member.image}">
                        	<td><img class="img-profile rounded-circle" style="width: 100px ; height: 100px" src="/img/${member.image}"> </td>
                        </c:if>
                          <!--  <button class="btn btn-secondary ">이미지 수정</button> -->
                          <td><input type="file" class="btn btn-secondary" id="img" name="img" data-icon="false"></td>
                      </tr>
                      <tr >
                        <th class="table-active">아이디</th>
                        <td><input type="text" name="memberId" value="${member.memberId}"></td>
                      </tr>
                      <tr >
                        <th class="table-active">이름</th>
                        <td><input type="text" name="name" value="${member.name}"></td>
                      </tr>
                      <tr >
                        <th class="table-active">이메일</th>
                        <td><input type="text" name="email" value="${member.email}"></td>
                      </tr>
                      <tr >
                        <th class="table-active">직책</th>
                        <td><input type="text" name="dept" value="${member.dept}" readonly="readonly"></td>
                 
                      </tr>
                      <tr >
                        <th class="table-active">부서</th>
                        <td><input type="text" name="posit" value="${member.posit}" readonly="readonly"></td>
                 
                      </tr>
                      <tr >
                        <th class="table-active">권한</th>
                        <td><input type="text" value="${member.authority}" readonly="readonly"></td>
                 
                      </tr>
                      <tr >
                        <th class="table-active">휴대폰번호</th>
                        <td><input type="text" name="phone" value="${member.phone}"></td>
                 
                      </tr>
                      <tr >
                        <th class="table-active">회사명</th>
                        <td><input type="text" value="${member.company}" readonly="readonly"></td>
                 
                      </tr>
                    </tbody>
                  </table>
                  <div class="container">
            	<div class="row">
            		<div class="col text-center">
            			<button class="btn btn-secondary ">정보수정</button>
						<button class="btn btn-secondary ">비밀번호변경</button>
            		</div>
            	</div>
            </div>
                 </form>
            </div>
            
			
		
        </main>
  		</div>
	</div>
	<script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
        	
</body>
</html>