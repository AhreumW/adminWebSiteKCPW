<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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