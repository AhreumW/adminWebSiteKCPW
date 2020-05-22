<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	tr {
		text-align: center;
	}
</style>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" type="text/css"
	 href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>
	
	<jsp:include page="/Header.jsp" />
	
	<h1>회원목록</h1>
	<p>
		<a href='./add'>신규 회원</a>
	</p>
	
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>등급</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="memberDto" items="${memberList}">
				<tr>
					<td>${memberDto.no}</td>
					<td>
						<a href="./update?no=${memberDto.no}">${memberDto.name}</a>
					</td>
					<td>${memberDto.email}</td>
					<td>${memberDto.createdDate}</td>
					<td>${memberDto.grade}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>