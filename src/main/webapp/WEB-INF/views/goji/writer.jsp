<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../resources/css/include/include.css" /> <!-- 꼭 포함하세요 -->
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>

	<div class="container-fluid">
    	<div class="row">
        	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
			<main class="col-md-10 ms-sm-auto row">
				<form class="col d-block" method="POST" enctype="multipart/form-data">
					<div class="row ms-sm-auto">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<h2 class="text-center">게시글 쓰기</h2>
							
								<table class="table table-striped">
									<tr>
										<td>제목</td>
										<td><input type="text"  class="form-control" name="title"></td>
									</tr>
									<tr>
										<td>작성자</td>
										<td><input type="text"  class="form-control" name="writer" value="${member.name}"></td>
									</tr>                 
									<tr>
										<td>글내용</td>
										<td><textarea rows="10" cols="50" name="content" class="form-control"></textarea></td>
									</tr>
									<tr>
										<td>파일업로드</td>
										<!--  <td><input type="file" class="form-control" name="file" multiple="multiple"></td> -->
										<td><button class="fileAdd_btn" type="button" onclick="fn_addFile()">파일추가</button></td>
									</tr>
									<tr>
										<td>
											<td id="fileIndex">
											</td>
										</td>
									</tr>
									<tr>
										<td colspan="2"  class="text-center">
											<input type="submit" value="글쓰기" class="btn " style="background-color:rgb(210,244,234) ;">
											<input type="reset" value="다시작성" class="btn" style="background-color:rgb(210,244,234) ;" > 
											
										</td>
									</tr>
								</table>
						</div>
					</div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
function fn_addFile(){
	var fileIndex = 1;
	//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		fileIndex++;
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}
</script>
</html>