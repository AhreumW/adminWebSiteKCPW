<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 상세보기</title>

</head>

<body>

	<jsp:include page="/Header.jsp" />

	<h1>게시글 상세보기</h1>
	
	<table>
		<tbody>
			<tr>
				<td>제목</td>
				<td>
					${noticeDto.title}
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					${noticeDto.content}
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${requestScope.noticeDto.createdDate}</td>
			</tr>
		</tbody>
	</table>
	
	<c:if test="${memberDto.getGrade() == 'admin'}">
		<a href="./update?noticeNo=${noticeDto.noticeNo}">수정</a>
	</c:if>
	<a href="./list">목록</a>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>