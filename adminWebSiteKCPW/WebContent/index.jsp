<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function listPageMoveFnc() {
		location.href = '<%=request.getContextPath()%>/auth/login';
	}
</script>

</head>

<body>

	<p onclick="listPageMoveFnc();">adminWebSite</p>
	
	<a href="./member/login">로그인</a>
	
	<a href="./member/list">회원리스트</a>
	
	<a href="./member/add">회원추가</a>

</body>

</html>