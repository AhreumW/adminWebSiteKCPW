<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 등록</title>

</head>

<body>
	
	<jsp:include page="/Header.jsp" />
	
	<h1>회원등록</h1>
	
	<form action="" method="post">
		<label>이름</label><br>
		<input type="text" name="name"><br>
		<label>이메일</label><br>
		<input type="text" name="email"><br>
		<label>암호</label><br>
		<input type="password" name="password"><br><br>
		<input type='submit' value='추가'>
		<input type='reset' value='취소'>
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>