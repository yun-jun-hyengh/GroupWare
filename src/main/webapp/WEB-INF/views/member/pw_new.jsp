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
	<form action="/member/pw_new" method="POST" class="content">
		<div class="textbox">
			<input id="pwd" name="pwd" type="password"><label>새비밀번호</label>
			<div class="error">
				Invalid password
			</div>
		</div>
		
		<div class="textbox">
			<input id="pwd2" type="password" onchange="isSame();"><label>새비밀번호 확인</label>
			<div class="error">
				Invalid password
			</div>
		</div>
		<span id="same"></span>
		<br><br>
		<input type="submit" id="check" value="비밀번호 변경">
		<input type="hidden" name="email" value="${email}">
	</form>
</body>
</html>