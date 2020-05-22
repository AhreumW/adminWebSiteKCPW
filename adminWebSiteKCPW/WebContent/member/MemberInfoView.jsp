<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	
	function pageMoveListFnc() {
		location.href= "./list";
	}

</script>
</head>

<body>
<!-- 	Dao로 가서 값가져오기 -->
	<jsp:include page="/Header.jsp"/>

	<div id='memberWrap'>
		<h1 id='pageTitle'>Member Info</h1>

		<label>번호</label>
		<input type='text' name='no' class='inputText'
				value='${memberDto.no}' readonly='readonly'>
		<label>이름</label>
		<input type='text' name='name' class='inputText'
				value='${memberDto.name}' readonly='readonly'>
		<label>이메일</label>
		<input type='text' name='email' class='inputText'
				value='${memberDto.email}' readonly='readonly'>
		<label>가입일</label>
		<p class='fixedValue'>${memberDto.createdDate}</p>
	
		<form action='./update' method='get'>
			<input type="hidden" name="no" value="${memberDto.no}">
			
			<div id='btnsWrap'>
				<input type='submit' class='btns' value='수정'>
				<input type="button" class='btns'
					onclick="pageMoveListFnc();" value='뒤로'>
			</div>
		
		</form>
		
	</div>
	
	<jsp:include page="/Tail.jsp"/>

</body>
</html>