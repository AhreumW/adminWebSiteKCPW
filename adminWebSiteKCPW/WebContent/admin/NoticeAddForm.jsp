<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 쓰기</title>

</head>

<body>

	<jsp:include page="/Header.jsp" />

	<h1>게시글 쓰기</h1>
	
	<form action="./add" method="post">
		<table>
			<tbody>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<input type="text" name="content">
					</td>
				</tr>
			</tbody>
		</table>
		
		<input type="submit" value="글쓰기">
		<input type="reset" value="취소">
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>