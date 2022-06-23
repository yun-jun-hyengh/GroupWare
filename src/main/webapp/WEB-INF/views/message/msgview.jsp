<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="../resources/css/include/include.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<%@ include file="/WEB-INF/views/include/nav.jsp"%>


			<main class="col-md-10 ms-sm-auto row">
				<form class="col d-block" role="form" method="post" name="readForm"
					autocomplete="off">
					<input type="hidden" id="msgnum" name="msgnum" value="${read.msgnum}">
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
				<div class="row ">

					<div class="col-md-12  ">
						<table class="table table-condensed">
							<thead>
								<tr>
									<th width="10%">발신인</th>
									<th width="60%">${read.sendId}</th>
								</tr>
								<tr>
									<th width="10%">수신인</th>
									<th width="60%">${read.receiveId}</th>
								</tr>
								
							</thead>
							<tbody>
								<tr>
									<td>제목</td>
									<td>${read.msgtitle}</td>
								</tr>
								<tr>
									<td>작성일</td>
									<td>${read.regdate}</td>
								</tr>
								
								<tr>
									<td colspan="2">
										<p>
											<font size="5em">
												<div class="text-break">${read.content}</div>
											</font>
										</p> 
										<c:forEach var="file" items="${file}">
											<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
										</c:forEach>
										
									</td>
								</tr>
								
								

							</tbody>
						</table>
						<table id="commentTable" class="table table-condensed"></table>

						<table class="table table-condensed">
							<thead>
								<tr>
									<td><span style='float: right'>
											<button type="submit" id="list_btn" class="btn btn-default">목록</button>
											
									</span></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>



</body>
<script
	src="https://getbootstrap.kr/docs/5.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 꼭 포함하세요 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	function fn_fileDown(fileNo){
		var formObj = $("form[name='readForm']");
		$("#FILE_NO").attr("value", fileNo);
		formObj.attr("action", "/message/fileDown");
		formObj.submit();
	}
</script>
</body>
</html>