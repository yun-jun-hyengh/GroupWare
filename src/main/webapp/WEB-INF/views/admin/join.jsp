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

<link rel="stylesheet"
	href="/resources/css/registration/registration.css" />

<title>Insert title here</title>
<style>
	.id_input_re_1{
		color : green;
		display : none;
	}
	.id_input_re_2{
		color : red;
		display : none;
	}
</style>
</head>
<body>
	<div class="container myform">
		<form class="form-horizontal" action="/admin/join" role="form" method="post" name="sub" autocomplete="off">

			<div class="form-group">
				<label for="memberId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" class="form-control"
						id="memberId" name="memberId" placeholder="아이디를 입력하세요" />
					<div class="id_input_re_1">사용 가능한 아이디 입니다</div>
					<div class="id_input_re_2">아이디가 이미 존재합니다</div>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="pwd" class="col-lg-2 control-label">패스워드</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="pwd"
						name="pwd" placeholder="패스워드"
						placeholder="비밀번호를 입력하세요"/>
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
					확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwordCheck" name="passwordCheck"
						data-rule-required="true" placeholder="패스워드 확인"/>
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="name" name="name"
						data-rule-required="true" placeholder="한글만 입력 가능합니다."/>
				</div>
			</div>

			<div class="form-group" id="divEmail">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" class="form-control" id="email" name="email"
						data-rule-required="true" placeholder="이메일" />
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="phone" name="phone"
						data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."/>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<select class="form-control" id="gender" name="gender">
						<option value="none">-----</option>
						<option value="남">남</option>
						<option value="여">여</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-10">
					<select class="form-control" id="dept" name="dept">
						<option value="none">-----</option>
						<option value="대표자">대표이사</option>
						<option value="인사팀">인사팀</option>
						<option value="개발팀">개발팀</option>
						<option value="영업팀">영업팀</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">직책</label>
				<div class="col-lg-10">
					<select class="form-control" id="posit" name="posit">
						<option value="none">-----</option>
						<option value="대표">대표</option>
						<option value="부장">부장</option>
						<option value="차장">차장</option>
						<option value="차장">과장</option>
						<option value="차장">대리</option>
						<option value="차장">사원</option>
					</select>
				</div>
			</div>

			<div class="form-group  ">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">
					주소 </label>
				<div class="col-lg-10">
					<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호" /> <input
						type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" /><br/>
					<input type="text" id="sample4_roadAddress" name="roadAddress" class="past"
						placeholder="도로명주소" size="60" /><br /> <input
						type="text" id="sample4_jibunAddress" name="jibunAddress" class="past"
						placeholder="지번주소" size="60" /> <span id="guide"
						style="color: #999; display: none"></span> <input type="text"
						id="sample4_detailAddress" name="detailAddress" class="past" placeholder="상세주소"
						size="60" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-primary" onclick="joinform_check()">사원등록</button>
				</div>
			</div>

		</form>
	</div>
</body>
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
<script src="/resource/js/registration/registration.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName;
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById('sample4_roadAddress').value = roadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						document.getElementById('sample4_engAddress').value = data.addressEnglish;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById('sample4_extraAddress').value = extraRoadAddr;
						} else {
							document.getElementById('sample4_extraAddress').value = '';
						}

						var guideTextBox = document.getElementById('guide');
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					},
				}).open();
	}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	function joinform_check() {
		var memberId = document.getElementById("memberId");
		var pwd = document.getElementById("pwd");
		var passwordCheck = document.getElementById("passwordCheck");
		var name = document.getElementById("name");
		var email = document.getElementById("email");
		var phone = document.getElementById("phone");
		var gender = document.getElementById("gender");
		var dept = document.getElementById("dept");
		var posit = document.getElementById("posit");

		if (memberId.value == "") {
			alert("아이디를 입력하세요");
			memberId.focus();
			return false;
		}

		if (pwd.value == "") {
			alert("비밀번호를 입력하세요");
			pwd.focus();
			return false;
		}

		if (passwordCheck.value !== pwd.value) {
			alert("비밀번호가 일치하지 않습니다");
			passwordCheck.focus();
			return false;
		}
		
		if(name.value == ""){
			alert("이름을 입력하세요");
			name.focus();
			return false;
		}
		
		if(email.value == ""){
			alert("이메일을 입력하세요");
			email.focus();
			return false;
		}
		
		if(phone.value == ""){
			alert("전화번호를 입력해 주세요");
			phone.focus();
			return false;
		}
		
		if(gender.value == "none"){
			alert("성별을 선택하세요");
			gender.focus();
			return false;
		}
		
		if(dept.value == "none"){
			alert("부서를 선택해 주세요");
			dept.focus();
			return false;
		}
		
		if(posit.value == "none"){
			alert("직책을 선택해 주세요");
			posit.focus();
			return false;
		}
		document.sub.submit();
	}
	// 아이디 중복검사 
	$("#memberId").on("propertychange change keyup paste input", function() {
		//console.log("keyup 테스트");
		var memberId = $("#memberId").val();
		var data = {
			memberId : memberId
		};

		$.ajax({
			type : "post",
			url : "/admin/idChk",
			data : data,
			success : function(result) {
				if (result != 'fail') {
					$('.id_input_re_1').css("display", "inline-block");
					$('.id_input_re_2').css("display", "none");
				} else {
					$('.id_input_re_2').css("display", "inline-block");
					$('.id_input_re_1').css("display", "none");
				}
			}
		});
	});
</script>
</html>