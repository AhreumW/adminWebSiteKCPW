<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 등록</title>
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath()%>/css/style.css">

<script type="text/javascript">
	function toListFnc() {
		location.href='../admin/member/list';
	}
</script>
</head>

<body>

	<jsp:include page="/Header.jsp" />
	
	<div id='memberWrap'>
		<h1 id='pageTitle' id='addForm'>Add Member</h1>
		
		<form action='./add' method='post'>
			<label>이름</label>
			<input type='text' name='name' class='inputText'>
			<label>이메일</label>
			<input type='text' name='email' class='inputText'>
			<label>암호</label>
			<input type='password' name='password' class='inputText'>
			<div id='btnsWrap'>
				<input type='submit' value='추가' class='btns'>
				<input type='reset' value='초기화' class='btns'>
				<input type='button' onclick="toListFnc();" 
					value='뒤로' class='btns'>
			</div>
		</form>
	</div>
	
	<jsp:include page="/Tail.jsp" />
	
</body>
</html>