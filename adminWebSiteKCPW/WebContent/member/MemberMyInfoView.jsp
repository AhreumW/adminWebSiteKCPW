<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script type="text/javascript">
	
	function pageMoveListFnc() {
		location.href= "./list";
	}

</script>
</head>

<body>
<!-- 	Dao로 가서 값가져오기 -->
	<jsp:include page="/Header.jsp"/>

	<h1>회원정보</h1>
	
	<form action='./update1' method='get'>
		회원번호 : ${memberDto.no}<br>
		이름 : ${memberDto.name}<br>
		이메일 : ${memberDto.email}<br>
		가입일 : ${requestScope.memberDto.createdDate}<br><br>
	
		<input type='submit' value='수정하기'>
		<input type="button" onclick="pageMoveListFnc();" value='뒤로가기'>
	
	</form>
	
	<jsp:include page="/Tail.jsp"/>

</body>
</html>