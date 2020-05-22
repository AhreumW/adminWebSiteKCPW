<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" type="text/css"
	 href="<%=request.getContextPath()%>/css/style.css">

<style type="text/css">

#table select {
	height: 20px;
	font-size: 10px;
}

</style>

</head>

<body>
	
	<jsp:include page="/Header.jsp" />
	
	<div id='membersTable'>
		<h1 id='pageTitle'>Members</h1>

		<table id='table'>
			<colgroup>
				<col width="12%">
				<col width="13%">
				<col width="25%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입날짜</th>
					<th>정보수정</th>
					<th>등급</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="memberDto" items="${memberList}">
					<tr>
						<td class='tCenter'>${memberDto.no}</td>
						<td class='tCenter'>${memberDto.name}</td>
						<td class='textOFlow'>${memberDto.email}</td>
						<td class='tCenter'>${memberDto.createdDate}</td>
						<td class='tCenter'>
							<a href="<%=request.getContextPath()%>
								/member/update?no=${memberDto.no}">수정</a>
						</td>
						<td class='tCenter'>
							<c:if test="${memberDto.grade == 'admin'}">
								관리자
							</c:if>
							
							<c:if test="${memberDto.grade == 'user'}">
								사용자
							</c:if>
						</td>
						<td class='tCenter'>
							<a href="<%=request.getContextPath()%>
								/member/delete?no=${memberDto.no}">Y</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>