<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">

<style type="text/css">
	.mainInput {
		width: 500px; 
		margin-bottom: 20px;
		height: 20px;
	}
</style>
<script type="text/javascript">
	function validationChk() {
		var titleInputValue = document.getElementsByName('title')[0].value;
		var contentInputValue = document.getElementsByName('content')[0].value;

		if (titleInputValue == "") {
			alert('제목을 입력하세요');
		}

		if (contentInputValue == "") {
			alert('내용을 입력하세요');
		}
	}
</script>


</head>
<body>

	<jsp:include page="/Header.jsp"/>
	<h1>새글쓰기</h1>
	<form action="./add" method="post">
		<input type="hidden" name="email" value="${memberDto.email}">
		제목: <input type="text" name="title" class="mainInput"><br>
		내용: <input type="text" name="content" class="mainInput"><br>
		작성자: <input type="text" name="name" value="${memberDto.name}" 
					class="mainInput" readonly="readonly"><br>
			<input type="submit" value="추가" onclick="validationChk();">
			<input type="reset" value="취소">		
	</form>
	<jsp:include page="/Tail.jsp"/>

</body>
</html>