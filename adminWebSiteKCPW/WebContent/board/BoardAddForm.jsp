<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mainInput {
		width: 500px; 
		margin-bottom: 20px;
		height: 20px;
	}
</style>
</head>
<body>

	<jsp:include page="/Header.jsp"/>
	<h1>새글쓰기</h1>
	<form action="./add" method="post">
		제목: <input type="text" name="title" class="mainInput"><br>
		내용: <input type="text" name="content" class="mainInput"><br>
		이멜: <input type="text" name="email" class="mainInput"><br>
			<input type="submit" value="추가">
			<input type="reset" value="취소">		
	</form>
	<jsp:include page="/Tail.jsp"/>

</body>
</html>