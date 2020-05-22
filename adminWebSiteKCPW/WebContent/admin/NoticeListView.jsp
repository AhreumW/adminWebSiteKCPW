<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	
	window.onload = function(){
		<% int pageNum = (Integer) request.getAttribute("pageNum");%>
		
		var pageDiv = document.getElementById("pageNumDiv");
		
		for(var i=1; i<=<%=pageNum%>; i++){
			var aTag = document.createElement("a");
			aTag.innerHTML = i;
			aTag.setAttribute("style", "margin: 0 3px;");
			
			var url = "./list?currentNo="+i;
			aTag.setAttribute("href", url);
			pageDiv.appendChild(aTag);
		}
		
	}
	
	<% int current = (Integer) request.getAttribute("currentNo");%>
	
	function pageLeftFnc(){
		var currentNo = <%=current%> -1;
		if(currentNo >= 1){
			location.href="./list?currentNo="+currentNo;
		}else{
			location.href="./list?currentNo=1";
		}
	}
	
	function pageRightFnc(){
		var currentNo = <%=current%> +1;
		if(currentNo <= <%=pageNum%>){
			location.href="./list?currentNo="+currentNo;
		}else{
			location.href="./list?currentNo="+pageNum;
		}
	}
	
</script>

</head>

<body>

	<jsp:include page="/Header.jsp" />

	<div id='wrap'>
		<h1 id='pageTitle'>Notice Board</h1>
		
		<c:if test="${memberDto.getGrade() == 'admin'}">
			<p style="margin: 10px 0px 30px">
				<a href="./add" id='addLink'>글쓰기</a>
			</p>
		</c:if>
		
		<c:if test="${memberDto.getGrade() != 'user' && memberDto.getGrade() != 'admin'}">
			<p style="font-size: 13px; color: #333; margin: 10px 0px 30px">
				로그인해주세요.
			</p>
		</c:if>
	
		<c:if test="${memberDto.getGrade() == 'user' || memberDto.getGrade() == 'admin'}">
			<table id='table'>
				<colgroup>
					<col width="10%">
					<col width="45%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="noticeDto" items="${noticeList}">
						<tr>
							<td class='tCenter'>${noticeDto.noticeNo}</td>
							<td class='textOFlow'>
								<a href="./detail?noticeNo=${noticeDto.noticeNo}">
									${noticeDto.title}
								</a>
							</td>
							<td class='tCenter'>${noticeDto.myName}</td>
							<td class='tCenter'>${noticeDto.createdDate}</td>
							<td class='tCenter'>${noticeDto.modifiedDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div id='pagingWrap'>
				<div id="pageleftBtn" onclick="pageLeftFnc();">
					&lt;
				</div>
				<div id="pageNumDiv" ></div>
				<div id="pageRightBtn" onclick="pageRightFnc();">
					&gt;
				</div>
			</div>
		</c:if>
	</div>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>