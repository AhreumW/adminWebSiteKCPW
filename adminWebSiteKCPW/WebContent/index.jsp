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
	
	<a href="./auth/login">로그인</a>
	
	<a href="./member/list">회원리스트</a>
	
	<a href="./member/add">회원추가</a>
	
	<a href="./board/list">게시판</a>
	
	<a href="./admin/list">공지 게시판</a>

</body>

</html>