<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />

<link rel="stylesheet" href="/resources/css/login/login.css" />
<title>Insert title here</title>
<style type="text/css">
	.find_wrap{
		padding: 20px 0 35px;
		text-align: center;
	}
	.find_wrap li{
		position: relative;
		display: inline-block;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Login</h1>
							</div>
						</div>
						<form action="/login" method="post" name="login">
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label> <input type="text"
									name="memberId" class="form-control" id="memberId"
									placeholder="Enter userid" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">비밀번호</label> <input
									type="password" name="pwd" id="pwd"
									class="form-control"
									placeholder="Enter Password" />
							</div>

							<div class="col-md-12 text-center">
								<button type="submit" onclick="loginChk()"
									class="btn btn-block mybtn btn-primary tx-tfm">
									Login</button>
							</div>
							<div class="col-md-12">
								<div class="login-or">
									<hr class="hr-or" />
									<span class="span-or">or</span>
								</div>
							</div>
						</form>
						<div class="form-group">
								<ul class="find_wrap" id="find_wrap">
									<li><a href="/member/findidView">아이디찾기</a></li>&nbsp;&nbsp;
									<li><a href="/member/findpwView">비밀번호찾기</a></li>
								</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script src="/resources/js/login/login.js"></script>
</body>
<script type="text/javascript">
	function loginChk(){
		var form = document.login;
		if(!form.memberId.value && !form.pwd.value){
			alert("아이디와 비밀번호 모두 입력해 주세요");
			form.memberId.focus();
			return;
		}
		if(!form.memberId.value){
			alert("아이디를 입력해 주세요");
			form.memberId.focus();
			return;
		}
		
		if(!form.pwd.value){
			alert("비밀번호를 입력해 주세요");
			form.passwd.focus();
			return;
		}
		//form.action = "/login";
		//form.submit();
	}
</script>
</html>