<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>일반게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	
	window.onload = function(){
		<% int pageNum = (Integer) request.getAttribute("pageNum");%>
		<% int startNum = (Integer) request.getAttribute("startNum");%>
		<% int endNum = (Integer) request.getAttribute("endNum");%>
		<% int current = (Integer) request.getAttribute("currentNo");%>
		
		<% String orderBy = request.getParameter("orderBy"); %>
		
		var pageDiv = document.getElementById("pageNumDiv");
		
		var totalPage = <%=pageNum%>;
		var currentNo = <%=current%>;
		var startNum = <%=startNum%>;
		var endNum = <%=endNum%>;
		
		for(var i=startNum; i<=endNum; i++){
			var aTag = document.createElement("a");
			aTag.innerHTML = i;
			aTag.setAttribute("style", "margin: 0 10px;");
			
			if(i == currentNo){
				aTag.style.backgroundColor = "#a3a3c2";
			}
			
			var url = "./list?currentNo="+i;
			aTag.setAttribute("href", url);
			pageDiv.appendChild(aTag);
		}
		
		
		if(currentNo == 1){
			var firstMoveBtnObj = document.getElementById("firstMoveBtn");
			firstMoveBtnObj.style.color = "#fff";
			var leftBtnObj = document.getElementById("pageleftBtn");
			leftBtnObj.style.color = "#fff";
		}
		
		if(currentNo == totalPage){
			var lastMoveBtnObj = document.getElementById("lastMoveBtn");
			lastMoveBtnObj.style.color="#fff";
			var rightBtnObj = document.getElementById("pageRightBtn");
			rightBtnObj.style.color="#fff";
		}
		
	}
	
	
	
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
	      var endNo = <%=pageNum%>;
	      if(currentNo <= endNo){
	         location.href="./list?currentNo="+currentNo;
	      }else{
	         location.href="./list?currentNo="+endNo;
	      }
	}
	   
	function firstMoveFnc(){
	    location.href="./list";
	}
	function lastMoveFnc(){
	    location.href="./list?currentNo="+<%=pageNum%>;
	}
	
	function boardAddFnc(){
		location.href="./add";
	}
	
	function moveLoginFnc(){
		location.href="../auth/login";
	}
</script>
</head>

<body>

	<jsp:include page="/Header.jsp" />

	<h1>일반 게시판</h1>
	
	<c:if test="${memberDto ne null}">
		<button onclick="boardAddFnc();">글쓰기</button>
	</c:if>
	<c:if test="${memberDto == null}">
		<button onclick="moveLoginFnc();">글쓰기</button>
	</c:if>
	
	
	
	<c:set var="orderBy" value='<%=orderBy%>'/>
	${orderBy}
	<c:if test="${orderBy == null}">
		<a href="./list?orderBy=latest">최신순으로 보기</a>
	</c:if>
	<c:if test="${orderBy == 'boardNo'}">
		<a href="./list?orderBy=latest">최신순으로 보기</a>
	</c:if>
	<c:if test="${orderBy == 'latest'}">
		<a href="./list?orderBy=boardNo">등록순으로 보기</a>
	</c:if>
	
	
	<table>
		<thead>
			<tr>
				<th>게시글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<c:if test="${memberDto.getGrade() == 'admin'}">
					<th>관리</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardDto" items="${boardList}">
				<tr>
					<td>${boardDto.boardNo}</td>
					<td>
						<a href='./detail?no=${boardDto.boardNo}'>${boardDto.title}</a>
						<c:if test="${memberDto.getGrade() == 'admin'}">
							<a href='./update?no=${boardDto.boardNo}'> 수정</a>
						</c:if>
					</td>
					<td>${boardDto.myName}</td>
					<td>${boardDto.createdDate}</td>
					<c:if test="${memberDto.getGrade() == 'admin'}">
						<td>
							<a href="./delete?no=${boardDto.boardNo}"> 삭제</a> 
						</td>
					</c:if> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<div id="firstMoveBtn" onclick="firstMoveFnc();" 
			style="display: inline-block;">
			&lt;&lt;
		</div>
		<div id="pageleftBtn" onclick="pageLeftFnc();" 
			style="display: inline-block;">
			&lt;
		</div>
		<div id="pageNumDiv" style="display: inline-block;"></div>
		<div id="pageRightBtn" onclick="pageRightFnc();" 
			style="display: inline-block;">
			&gt;
		</div>
		<div id="lastMoveBtn" onclick="lastMoveFnc();" 
			style="display: inline-block;">
			&gt;&gt;
		</div>
	</div>
	
	<jsp:include page="/Tail.jsp" />

</body>

</html>