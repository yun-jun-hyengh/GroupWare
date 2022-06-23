<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        	<form class="col d-block" role="form" method="post" autocomplete="off">
                	<input type="hidden" id="bno" name="bno" value="${read.bno}">
                	<input type="hidden" id="bgno" name="bgno" value="${scri.bgno}">
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum"
						value="${scri.perPageNum}"> 
					<input type="hidden"
						id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword"
						value="${scri.keyword}">
            </form>
            <div class="container-fluid">
                <table class="table">
                    <td class="align-middle"><h2 class="text-center ">보고서</h2></td>
                    
                </table>
                <table class="table table-bordered border-dark">
                    <thead></thead>
                    <tr>
                        <td class="table-active">작성자명</td>
                        <td><input class="form-control" type="text" name="writer" id="writer" value="${read.writer}" readonly="readonly"></td>
                        <td class="table-active">작성일자</td>
                        <td><input class="form-control" type="text" name="regdate" id="regdate" value="<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
                    </tr>
                    <tr>
                    	<td class="table-active">보고종류</td>
                    	<td>
                    		<c:if test="${scri.bgno == 1}">
                    			<input class="form-control" type="text" name="writer" id="writer" value="일일보고" readonly="readonly">
                    		</c:if>
                    		<c:if test="${scri.bgno == 2}">
                    			<input class="form-control" type="text" name="writer" id="writer" value="주간보고" readonly="readonly">
                    		</c:if>
                    		<c:if test="${scri.bgno == 3}">
                    			<input class="form-control" type="text" name="writer" id="writer" value="월간보고" readonly="readonly">
                    		</c:if>
                    		<c:if test="${scri.bgno == 4}">
                    			<input class="form-control" type="text" name="writer" id="writer" value="년간보고" readonly="readonly">
                    		</c:if>
                    		
                    	</td>
                        <td class="table-active">부서명</td>
                        <td><input class="form-control" type="text" name="dept" id="dept" value="${read.dept}" readonly="readonly"></td>
                    </tr>
                </table>
                <table class="table table-bordered border-dark">
                    <thead></thead>
                    <tr>
                        <td class="table-active col-1">제목</td>
                        <td><input class="form-control" type="text" name="title" id="title" value="${read.title}" readonly="readonly"></td>
                        
                    </tr>
                    <tr>
                        <td class="table-active" style="height: 150px;">내용</td>
                        <td><textarea class="form-control" readonly="readonly" name="content" id="content" cols="30" rows="10">${read.content}</textarea></td>
                       
                    </tr>
                    <tr>
                        <td class="table-active">첨부파일</td>
                        <td><input class="form-control" type="file" name="" id=""></td>
                       
                    </tr>
                    <!--  <tr>
                        <td class="table-active">결제의견</td>
                        <td><input class="form-control" type="text" name="" id=""></td>
                       
                    </tr>
                    <tr>
                        <td class="table-active">후처리</td>
                        <td><input class="form-control" type="text" name="" id=""></td> -->
                       
                    </tr>
                </table>
                <!-- <input class="btn btn-secondary" type="submit" value="수정">
                <input class="btn btn-secondary" type="reset" value="삭제"> -->
                <div class="container">
                	<div class="row">
                		<div class="col text-center">
                			<button type="submit" id="update_btn" class="btn btn-secondary">수정</button>
							<button type="submit" id="delete_btn" class="btn btn-secondary">삭제</button>
                		</div>
                	</div>
                </div>
                
            </div>
       </main>
        	
        </div>
    </div>
<script
      src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script> <!-- 꼭 포함하세요 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		// 삭제
		$("#delete_btn").click(function(){
			formObj.attr("action", "/work/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		// 수정뷰
		$("#update_btn").click(function(){
			formObj.attr("action", "/work/updateView");
			formObj.attr("method", "GET");
			formObj.submit();
		})
	})
</script>