<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 쓰기</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/style.css">

</head>

<body>

	<jsp:include page="/Header.jsp" />

	<div id='viewWrap'>
		<h1 id='pageTitle'>Write Post</h1>
	
		<form action="./add" method="post">
			<table id='viewTable'>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<td class='th'>제목</td>
						<td class='td'>
							<input type="text" name="title">
						</td>
					</tr>
					<tr>
						<td class='th'>내용</td>
						<td class='td'>
							<textarea rows="10" cols="30" name="content"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div id='btnsWrap'>
				<input type="submit" class='btns' value="글쓰기">
				<input type="reset" class='btns' value="취소">
			</div>
		</form>
	</div>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>