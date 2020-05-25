<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">

	function boardDeleteFnc(no){
		location.href = "./delete=no?"+no;
	}
	
	function boardListFnc(){
		location.href = "./list";
	}
	
</script>

</head>

<body>

	<jsp:include page="/Header.jsp" />
	
	<div id='viewWrap'>
		<h1 id='pageTitle'>Edit Post</h1>
	
		<form action='./update' method='post'>
			<table id='viewTable'>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td class='th'>번호</td>
					<td class='td'>
						<input type='text' name='no' value='${boardDto.boardNo}' 
							readonly='readonly'>
					</td>
				</tr>
				<tr>
					<td class='th'>제목</td>
					<td class='td'>
						<input type="text" name="title" 
							value="${boardDto.title}">
					</td>
				</tr>
				<tr>
					<td class='th'>내용</td>
					<td class='td'>
						<textarea rows="10" cols="30" name="content">${boardDto.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class='th'>작성일</td>
					<td class='td'>${boardDto.getCreatedDate()}</td>
					
				</tr>
				<tr>
					<td class='th'>수정일</td>
					<td class='td'>${boardDto.getModifiedDate()}</td>
				</tr>
			</table>
			
			<div id='btnsWrap'>
				<input type='submit' value='저장' class='btns'>
				<input type='button' value='삭제' class='btns' 
					onclick="boardDeleteFnc(${boardDto.getBoardNo()});">
				<input type='button' value='취소' class='btns' 
					onclick="boardListFnc();">
			</div>
		</form>
	
	</div>
	
	<jsp:include page="/Tail.jsp" />
	

</body>

</html>