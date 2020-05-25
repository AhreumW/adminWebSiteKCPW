<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	function validationChk() {
		var titleInputValue = document.getElementsByName('title')[0].value;
		var contentInputValue = document.getElementsByName('content')[0].value;

		if (titleInputValue == "") {
			alert('제목을 입력하세요');	
		}

		else if (contentInputValue == "") {
			alert('내용을 입력하세요');
			
		}
	}
	
	function toListFnc() {
		location.href="./list";
	}
</script>
</head>
<body>

	<jsp:include page="/Header.jsp"/>
	
	<div id='viewWrap'>
		<h1 id='pageTitle'>Write Post</h1>
			
		<form action="./add" method="post">
			<input type="hidden" name="email" value="${memberDto.email}">
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
					<tr>
						<td class='th'>작성자</td>
						<td class='td'>
							<input type="text" name="name" class="readonly"
								value="${memberDto.name}" readonly="readonly">
						</td>
					</tr>
				</tbody>
			</table>
			
			<div id='btnsWrap'>
				<input type="submit" value="글쓰기" class='btns'
					 onclick="validationChk();">
				<input type="reset" value="초기화" class='btns'>
				<input type="button" class='btns' 
					value="뒤로" onclick='toListFnc();'>
			</div>		
		</form>
	</div>
	
	<jsp:include page="/Tail.jsp"/>

</body>
</html>