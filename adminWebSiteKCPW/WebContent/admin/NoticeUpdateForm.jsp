<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 상세보기</title>

<script type="text/javascript">

// 	function deletePostFnc(noticeNo) {
// 		if(confirm("삭제하시겠습니까?")){
// 			location.href = "./delete?noticeNo=" + noticeNo;
// 		}
		
// 	}

</script>
</head>

<body>

	<jsp:include page="/Header.jsp" />

	<h1>게시글 상세보기</h1>
	
	<form action="./update" method="post">
		<table>
			<tbody>
				<tr>
					<td>번호</td>
					<td>
						<input type="text" name="noticeNo" 
							value="${noticeDto.noticeNo}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" 
							value="${noticeDto.title}">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="30" name="content">
							${noticeDto.content}
						</textarea>
					</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${requestScope.noticeDto.createdDate}</td>
				</tr>
			</tbody>
		</table>
		
		<input type="submit" value="적용">
		<input type="reset" value="초기화">
		<input type="button" value="삭제" onclick="location.href='./delete?noticeNo=${noticeDto.noticeNo}'">
		<a href="./list">목록</a>
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>