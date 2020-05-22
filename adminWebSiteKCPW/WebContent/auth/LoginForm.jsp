<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<script type="text/javascript">
/* 	
	var emailInput = document.getElementsByName('email');
	var pwdInput = document.getElementsByName('password');
	
		window.onload = function() {
			emailInput.setAttribute('onclick','emailChkFnc();');
			pwdInput.setAttribute('onclick','pwdChkFnc();');
		}
	
		function emailChkFnc() {
			if(emailInput.value == "") {
				alert("이메일을 입력해주세요");
				emailInput.value.focus();
			}
		}
	
		function pwdChkFnc() {
			if(pwdInput =="") {
				alert("패스워드를 입력해주세요");
				pwdInput.value.focus();
			}
			
		} */
	
	</script>

</head>
<body>

<jsp:include page="/Header.jsp"/>

	<h2>사용자 로그인</h2>
	
	<form action="" method="post">
		이메일 : 		<input type="email" name="email"><br/>
		패스워드 :		<input type="password" name="password"><br/> 
					<input type="submit" value="로그인">
	</form>

<jsp:include page="/Tail.jsp"/>
	
</body>
</html>