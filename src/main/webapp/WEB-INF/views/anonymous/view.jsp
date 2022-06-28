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
        	
        	
        	<main class="col-md-10 ms-sm-auto row">
        	  	<form class="col d-block" role="form" method="post" autocomplete="off">
                	<input type="hidden" id="bno" name="bno" value="${read.bno}">
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum"
						value="${scri.perPageNum}"> 
					<input type="hidden"
						id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword"
						value="${scri.keyword}">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
                </form>
                	<div class="row ">
                   		
	                    <div class="col-md-12 breack ">
	                        <table class="table table-condensed">
	                            <thead>
	                                <tr >
	                                    <th width="10%">제목</th>
	                                    <th width="60%">${read.title}</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>작성일
	                                    </td>
	                                    <td>
	                                         <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${read.regdate}"/>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td>글쓴이
	                                    </td>
	                                    <td>
	                                    ${read.writer} <span style='float:right'>조회 : ${read.cnt}</span>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td colspan="2" >
	                                        <p >
	                                        	<font size="5em">
	                                        		<div class="text-break">${read.content}</div>
												</font>
	                                        </p>
	                           				<c:forEach var="file" items="${anonymousfile}">
	                                			<img src="/img/${file.STORED_FILE_NAME}"><br>
	                                			
	                                		</c:forEach> 
	                                		
	                                    </td>
	                                </tr>
	                                
	                            </tbody>
	                        </table>
	                        <table id="commentTable" class="table table-condensed"></table>
	                        
	                        <table class="table table-condensed">
	                            <thead>
	                                <tr>
	                                    <td>
	                                        <span style='float:right'>
	                                           <button type="submit" id="list_btn" class="btn btn-default">목록</button>
									<!--		<button type="submit" id="update_btn" class="btn btn-default">수정</button>
												<button type="submit" id="delete_btn" class="btn btn-default">삭제</button>
									-->
												<a type="button" class="btn btn-default" href="/anonymous/writer">글쓰기</a>
                                    	    </span>
                                	    </td>
                            	    </tr>
                        	    </thead>
                    	    </table>
                	   		<div class="col-md-12 ">
 	   	<%-- 업데이트 --%>
								
					<!-- 			<c:forEach items="${freereplyList}" var="freereplyList" >
									<div class="border-top border-bottom">
										<div style="margin-top: 10px"></div>
										<button type="button" id="deleteReply-${freereplyList.rno}" class="btn float-end btn-secondary opacity-75 deleteReply" style="margin-left: 10px">삭제</button> 
										
					
										
										<div><p class="fw-bold">작성자 : ${freereplyList.replyer}</p></div>
										
										<div class="text-break"><p>내용 : ${freereplyList.recontent}</p></div>
										
										<div><p class="fw-light">작성날짜 : <fmt:formatDate value="${freereplyList.replydate}" pattern="yyyy-MM-dd"/></p></div>
		
									</div>	
								</c:forEach>
					-->
								<div style="margin-bottom: 50px"></div>
							<form name="replyForm" method="post" class="form-horizontal">
								<input type="hidden" id="bno" name="bno" value="${read.bno}">
								<input type="hidden" id="page" name="page" value="${scri.page}">
								<input type="hidden" id="perPageNum" name="perPageNum"
									value="${scri.perPageNum}"> <input type="hidden"
									id="searchType" name="searchType" value="${scri.searchType}">
								<input type="hidden" id="keyword" name="keyword"
									value="${scri.keyword}">
			
						<!-- 		<div class="form-floating mb-3">
									<input type="text" id="recontent" name="recontent" class="form-control">
									<label for="recontent  " class="col-sm-2 control-label"><input type="text" id="replyer" name="replyer" value="${member.name}"
											class=""></label>
				
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 float-end">
										<button type="button" class="replyWriteBtn btn btn-light">작성</button>
									</div>
								</div>
						-->
							</form>
							<div style="margin-bottom: 150px"></div>
						</div>
                    </div>
               </div>
			<%-- 업데이트 --%>
			</main>
		</div>
	</div>
  

</body>
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
			formObj.attr("action", "/anonymous/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		// 수정
		$("#update_btn").click(function(){
			formObj.attr("action", "/anonymous/updateView");
			formObj.attr("method", "GET");
			formObj.submit();
		})
		
		// 목록
		$("#list_btn").click(function(){
			location.href = "/anonymous/anonymouslist?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		})
		
		$(".replyWriteBtn").on("click", function(){
			var formObj1 = $("form[name='replyForm']");
			formObj1.attr("action", "/anonymous/replyWrite");
			formObj1.submit();
		});
		
	})
	
	const deleteReplyBtns = document.querySelectorAll('.deleteReply');
	
	deleteReplyBtns.forEach( (element) => {	// 모든 댓글 삭제버튼에 대해서
		element.onclick = (event) => {	// 버튼을 클릭하면 실행할 이벤트 함수를 부여한다
			const rno = event.target.id.split('-')[1];	// 클릭한 버튼의 댓글번호를 가져와서
			const answer = confirm('댓글을 삭제하시겠습니까?');	// 물어보고
			if(answer === true) {	// 확인을 받으면
				location.href = '${cpath}/anonymous/deleteReply/' + rno;	// 해당 주소로 이동
				// 해당 주소는 컨트롤러로 연결되어서 삭제 쿼리를 수행하고 현재 읽기 페이지로 리다이렉트
				// 이전 읽기 페이지를 확인하려면
				// @RequestHeader("referer") 를 확인하기
			}
		}
	});
	
	
	
</script>
</body>
</html>