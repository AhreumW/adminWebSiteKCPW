<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	function moveListFnc() {
		location.href="./list";
	}
</script>

</head>

<body>

	<jsp:include page="/Header.jsp"/>
	
	<h1>게시판 상세보기 페이지</h1>
	<!--  상세페이지에 제목 작성자 내용 등록일 수정일  -->
	
	<form action="./detail" method="post">
		<input type="hidden" name="no" value="${boardDto.getBoardNo()}">
		<table>
			<tr>
				<th>제목</th>
				<th colspan='3'>${boardDto.getTitle()}</th>
			</tr>
			<tr>
				<th>작성자</th>
				<th>${boardDto.getMyName()}</th>
			</tr>
			<tr>
				<th>등록일</th>
				<th>${boardDto.getCreatedDate()}</th>
				<th>수정일</th>
				<th>${boardDto.getModifiedDate()}</th>
			</tr>
			<tr>
				<th>내용</th>
				<th colspan='3'>${boardDto.getContent()}</th>
			</tr>
		</table>
		<c:if test='${memberDto.email == boardDto.email || memberDto.grade == "admin"}'>
			<input type="submit" value="수정">
		</c:if>	
		<input onclick="moveListFnc();" type="button" value="게시판목록">		
	</form>
	
	<jsp:include page="/Tail.jsp"/>

</body>

</html>