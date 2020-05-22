<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
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
	
	<c:if test="${memberDto.email == null}">
		<a href="./auth/login">로그인</a>
	</c:if>
	
	<c:if test="${memberDto.email ne null}">
		<a href="./auth/logout">로그아웃</a>
		
		<c:if test="${memberDto.grade == 'admin'}">
			<a href="./member/list">회원리스트</a>
			<a href="./member/add">회원추가</a>
		</c:if>
		
		<a href="./member/info?no=${memberDto.no} ">마이페이지</a>
	</c:if>	
	
	<a href="./board/list">게시판</a>
	
	<a href="./admin/list">공지 게시판</a>

</body>

</html>