<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script type="text/javascript">
	function backPageMoveFnc() {
		location.href= "../admin/member/list";
	}
	
	function pageMoveDeleteFnc(no) {
		var result = "";
		
		result = confirm("정말 탈퇴하시겠습니까?");
		
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
	
	<form action='./update' method='post'>
		번호 : <input type='text' name='no' 
			value='${memberDto.no}' readonly='readonly'><br>
		이름 : <input type='text' name='name' 
			value='${memberDto.name}'><br>
		이메일 : <input type='text' name='email' 
			value='${memberDto.email}' readonly='readonly'><br>
		가입일 : '${memberDto.createdDate}'<br>
		수정일 : '${memberDto.modifiedDate}'<br><br>
		
		<input type='submit' value='저장하기'>
		<input type='button' value='탈퇴하기' 
			onclick="pageMoveDeleteFnc(${memberDto.no});">
		<input type='button' value='뒤로가기' 
			onclick="backPageMoveFnc();">
	</form>
	
	<jsp:include page="/Tail.jsp"/>

</body>
</html>