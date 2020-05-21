<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script type="text/javascript">
	function backPageMoveFnc() {
		location.href= "./MemberMyPage.jsp";
	}
	
	function pageMoveDeleteFnc(no) {
		String result = "";
		
		result = prompt("정말 탈퇴하시겠습니까?");
		document.write(result);
		
		if (result) {
			var url = "./delete?no=" + no;
			location.href = url;
		} else {
			return;
		}
		
	}
</script>
</head>

<body>
<!-- 	Dao로 가서 값가져오기 -->
	<jsp:include page="/Header.jsp"/>

	<h1>회원정보 수정</h1>
	
	<form action='' method='post'>
		번호 : <input type='text' name='no' value='${sessionScope.memberDto.no}' readonly='readonly'><br>
		이름 : <input type='text' name='name' value='${sessionScope.memberDto.name}'><br>
		이메일 : <input type='text' name='email' value='${sessionScope.memberDto.email}'><br>
		가입일 : '${sessionScope.memberDto.createdDate}'<br>
		수정일 : '${sessionScope.memberDto.modifiedDate}'<br>
		
		<input type='submit' value='저장하기'>
		<input type='button' value='탈퇴하기' onclick="pageMoveDeleteFnc(${memberDto.no});">
		<input type='button' value='뒤로가기' onclick="backPageMoveFnc();">
	</form>
	
	<jsp:include page="/Tail.jsp"/>

</body>
</html>