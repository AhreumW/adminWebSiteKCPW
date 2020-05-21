<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판 수정</title>

<script type="text/javascript">

	function boardDeleteFnc(no){
		location.href = "#";
	}
	
	function boardListFnc(){
		location.href = "./list";
	}
	
</script>

</head>

<body>

	<jsp:include page="/Header.jsp" />
	
	<h1>일반 게시판 수정</h1>
	
	<form action='./update' method='post'>
		번호 : <input type='text' name='no' value='${boardDto.boardNo}' readonly='readonly'><br>
		이메일 : <input type='text' name='email' value='${boardDto.email}' readonly='readonly'><br>
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" 
						value="${boardDto.title}">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="30" name="content">${boardDto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${boardDto.getCreatedDate()}</td>
			</tr>
		</table>
		
		<input type='submit' value='저장'>
		<input type='button' value='삭제' onclick="boardDeleteFnc(${boardDto.getBoardNo()});">
		<input type='button' value='취소' onclick="boardListFnc();">
	</form>
	
	
	
	<jsp:include page="/Tail.jsp" />
	

</body>

</html>