<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<style type="text/css">
	#addLink {
		border: 1px solid #a3a3c2;
		padding: 5px 20px; 
		font-weight: bold;
		font-size: 12px;
		color: #333;
		transition: all 0.3s;
	}
	#addLink:hover {
		background-color: #a3a3c2;
		color: #fff;
	}
	
	#table {
		table-layout: fixed;
		width: 100%;
		border-collapse: collapse;
		font-size: 12px;
	}
	#table th, #table td {
		border: 1px solid #e0e0eb;
		padding: 5px 10px;
	}
	#table th {
		background-color: #f0f0f5;
		padding: 7px 0px;
	}
	#table a:hover {
		text-decoration: underline;
	}
	.manageBtn {
		display: inline-block;
		position: relative;
	}
	.manageBtn:hover {
		font-weight: bold;
	}
</style>

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
			<p style="font-size: 13px; color: #333;">관리자 로그인 되었습니다.</p>
			<p style="margin: 10px 0px 30px">
				<a href="./add" id='addLink'>글쓰기</a>
			</p>
		</c:if>
		
		<c:if test="${memberDto.getGrade() == 'user'}">
			<p>${memberDto.name}님은 일반회원입니다.</p>
		</c:if>
		
		<c:if test="${memberDto.getGrade() != 'user' && memberDto.getGrade() != 'admin'}">
			<p>로그인해주세요.</p>
		</c:if>
	
		<table id='table'>
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="20%">
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
						<td>
							<a href="./detail?noticeNo=${noticeDto.noticeNo}">
								${noticeDto.title}
							</a>
						</td>
						<td>${noticeDto.myName}</td>
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
	</div>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>