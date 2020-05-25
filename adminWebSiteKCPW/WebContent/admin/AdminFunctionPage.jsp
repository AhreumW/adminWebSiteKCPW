<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 전용 페이지</title>
<link rel="stylesheet" type="text/css"
	 href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>
	
	<jsp:include page="/Header.jsp" />
	
		<h2>회원관리</h2>
		
		<ul>
			<li onclick="location.href='./member/list'">회원리스트</li>
			<li onclick="location.href='../member/add'">회원추가</li>
		</ul>
		
		<h2>게시판관리</h2>
		<ul>
			<li onclick="location.href='../board/list'">일반 게시판</li>
			<li onclick="location.href='./list'">공지 게시판</li>
		</ul>
	
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>