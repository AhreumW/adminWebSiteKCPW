<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>일반게시판 리스트</title>

</head>

<body>

	<jsp:include page="/Header.jsp" />
	
	<h1>일반 게시판</h1>
	
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardDto" items="${boardList}">
				<tr>
					<td>${boardDto.boardNo}</td>
					<td>
						<a href="./update?no=${boardDto.boardNo}">${boardDto.title}</a>
					</td>
					<td>${boardDto.email}</td>
					<td>${boardDto.createdDate}</td>
					<td>
						<a href="./delete?no=${boardDto.boardNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>