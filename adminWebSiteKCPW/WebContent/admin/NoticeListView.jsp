<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지 게시판</title>

</head>

<body>

	<jsp:include page="/Header.jsp" />

	<h1>공지 게시판</h1>
	
	<c:if test="${memberDto.getGrade() == 'admin'}">
		<p>관리자 로그인 되었습니다.</p>
		<p>
			<a href="./add">글쓰기</a>
		</p>
	</c:if>
	
	<c:if test="${memberDto.getGrade() == 'user'}">
		<p>${memberDto.name}님의 등급은 ${memberDto.getGrade()}입니다.</p>
	</c:if>
	
	<c:if test="${memberDto.getGrade() != 'user' && memberDto.getGrade() != 'admin'}">
		<p>로그인해주세요.</p>
	</c:if>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>이메일</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="noticeDto" items="${noticeList}">
				<tr>
					<td>${noticeDto.noticeNo}</td>
					<td>
						<a href="./detail?noticeNo=${noticeDto.noticeNo}">${noticeDto.title}</a>
					</td>
					<td>${noticeDto.content}</td>
					<td>${noticeDto.email}</td>
					<td>${noticeDto.createdDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>