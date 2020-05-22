<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<style type="text/css">
	#wrap {
		width: 250px;
		margin: 100px auto 0px;
	}

	#loginForm label {
		display: block;
		font-size: 13px;
		padding:15px 0px 3px;
	}
	#loginBtn {
		display: block;
		width: 100%;
		line-height: 35px;
		margin-top: 35px;
		border: 1px solid #000;
		box-sizing: border-box;
		background-color: #000;
		font-size: 13px;
		font-weight: bold;
		color: #fff;
		cursor: pointer;
		transition: all 0.3s;
	}
	
	#btnWrap:hover #loginBtn {
		animation: hoverAni 1s;
	}
	@keyframes hoverAni {
		0% {
			background-color: #000;
			color: #fff;
		}
		20% {
			background-color: #fff;
			color: #000;
		}
	}
</style>

<script type="text/javascript">
	function validationChk() {
		var emailInputValue = document.getElementsByName('email')[0].value;
		var pwdInputValue = document.getElementsByName('password')[0].value;
		
		if(emailInputValue ==''){
			alert('이메일을 입력하세요');
		}else if(pwdInputValue == ''){
			alert('패스워드를 입력하세요');
		}
		
	}
	
	function findPageFnc(){
		location.href="../auth/find";
	}
	
</script>

</head>
<body>

	<jsp:include page="/Header.jsp"/>

	<div id='wrap'>
		<h2 id='pageTitle'>Login</h2>
	
		<form action="" method="post" id='loginForm'>
			<label>이메일</label>
			<input type="text" class='inputText' name="email">
			<label>암호</label>
			<input type="password" class='inputText' name="password">
			
			<c:if test="${errorMsg ne null}">
				<span>${errorMsg}</span>
			</c:if>
			
			<div id='btnWrap'>
				<input type="submit" id='loginBtn' value="로그인" onclick="validationChk();">
			</div>
		</form>
		
		
		<input type="button" value="비밀번호 찾기" onclick="findPageFnc()"/>
	</div>

	<jsp:include page="/Tail.jsp"/>
	
</body>
</html>