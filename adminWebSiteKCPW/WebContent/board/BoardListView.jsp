<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>일반게시판 리스트</title>

<script type="text/javascript">
	
	window.onload = function(){
		<% int pageNum = (Integer) request.getAttribute("pageNum");%>
		
		var pageDiv = document.getElementById("pageNumDiv");
		
		for(var i=1; i<=<%=pageNum%>; i++){
			var aTag = document.createElement("a");
			aTag.innerHTML = i;
			aTag.setAttribute("style", "margin: 0 10px;");
			var url = "./list?currentNo="+i;
			aTag.setAttribute("href", url);
			pageDiv.appendChild(aTag);
		}
		
	}
	
	function boardAddFnc(){
		location.href="./add";
	}
	
</script>
</head>

<body>

	<jsp:include page="/Header.jsp" />
	
	<h1>일반 게시판</h1>
	<button onclick="boardAddFnc();">글쓰기</button>
	
	<table>
		<thead>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>이메일</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardDto" items="${boardList}">
				<tr>
					<td>${boardDto.boardNo}</td>
					<td>
						<a href="#">${boardDto.title}</a>
						<a href='./update?no=${boardDto.boardNo}'> 수정</a>
					</td>
					<td>${boardDto.email}</td>
					<td>${boardDto.createdDate}</td>
					<td>
						<a href="#">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<a id="pageLeftBtn">&lt;</a>
		<div id="pageNumDiv" style="display: inline-block;"></div>
		<a id="pageRightBtn">&gt;</a>	
	</div>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>