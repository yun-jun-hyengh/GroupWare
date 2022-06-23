<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/pw_set" method="post">
	<input type="hidden" name="num" value="${num}">
	<div class="container">
		<div class="textbox">
			<input type="text" name="email_injeung" placeholder="인증번호를 입력하세요"><label>인증번호 </label>
			<div class="error"></div>
		</div><br><br>
		<input type="submit" id="check" value="확인">
	</div>
</form>
</body>
</html>