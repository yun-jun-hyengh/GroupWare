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
				<form class="col d-block" name="updateForm" method="POST" action="/work/update" enctype="multipart/form-data">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly">
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="bgno" name="bgno" value="${scri.bgno}">
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
  					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
  					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
  					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<div class="row ms-sm-auto">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<h2 class="text-center breack">게시글 쓰기</h2>
							<%-- 업데이트 --%>
                        <table class="table table-striped">
                        	
                           <tr>
                              <td class="align-middle text-center">제목</td>
                              <td><input type="text"  class="form-control" name="title" value="${update.title}"></td>
                           </tr>
                           <tr>
                              <td class="align-middle text-center">보고자</td>
                              <td><input type="text"  class="form-control" name="writer" value="${update.writer}" readonly="readonly"></td>
                           </tr>  
                           <tr>
                              <td class="align-middle text-center">부서</td>
                              <td><input type="text"  class="form-control" name="dept" value="${update.dept}"></td>
                           </tr>                 
                           <tr>
                              <td class="align-middle text-center">글내용</td>
                              <td><textarea rows="10" cols="50" name="content" class="form-control"><c:out value="${update.content}"/></textarea></td>
                           </tr>
                           <tr>
                              <td class="align-middle text-center">파일업로드</td>
                              <td id="fileIndex">
                              	<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
								</c:forEach>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="2"  class="text-center">
                                 <input type="submit" value="수정" class="btn " style="background-color:rgb(210,244,234) ;">
                                 <input type="submit" value="취소" class="btn" id="cancel_btn" style="background-color:rgb(210,244,234) ;" > 
                                 <button type="button" id="fileAdd_btn" class="btn" style="background-color:rgb(210,244,234) ;">파일추가</button>
                              </td>
                           </tr>
                        </table>
                        <%-- 업데이트 --%>
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
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click","#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
		$("#cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/work/worklist?bno=${update.bno}"
					+"&page=${scri.page}"
					+"&bgno=${scri.bgno}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}"
					+"&keyword=${scri.keyword}";
		})
	})
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
	
 	function fn_addFile(){
		var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$("#fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
				
		});
	}
 	
 	var fileNoArry = new Array();
 	var fileNameArry = new Array();
 	function fn_del(value, name){
 			
 		fileNoArry.push(value);
 		fileNameArry.push(name);
 		$("#fileNoDel").attr("value", fileNoArry);
 		$("#fileNameDel").attr("value", fileNameArry);
 	}
</script>
</html>