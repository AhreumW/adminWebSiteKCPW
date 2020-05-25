<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 전용 페이지</title>
<link rel="stylesheet" type="text/css"
	 href="<%=request.getContextPath()%>/css/style.css">

<style type="text/css">
.subTitle{
	display:inline-block;
	position: relative;
	padding: 0px 5px;
	font-size: 18px;
	letter-spacing: -0.1em;
}
.subTitle:after{
	display: block;
	content: '';
	position: absolute;
	left: 0px;
	bottom: -3px;
	width: 100%;
	height: 1px;
	border-bottom: 1px dotted #000;
}
.listUl li{
	display: inline-block;
	width: 150px;
}
.listText{
	display: block;
	font-size: 13px;
}
</style>
</head>

<body>
	
	<jsp:include page="/Header.jsp" />
	
		<div id='wrap' class='tCenter'>
			<h1 id='pageTitle' style="text-align: left;">Administration Page</h1>
		
			<h2 class='subTitle' style="margin-top: 40px;">회원 관리</h2>
			
			<ul class="listUl tCenter">
				<li>
					<a href="./member/list">
						<img alt="회원리스트 아이콘" src="../img/admin_icon2.jpg">
						<span class='listText'>회원리스트</span>
					</a>
				</li>
				<li>
					<a href="../member/add">
						<img alt="회원리스트 아이콘" src="../img/admin_icon1.jpg">
						<span class='listText'>회원추가</span>
					</a>
				</li>
			</ul>
			
			<h2 class='subTitle tCenter' style="margin-top: 60px;">게시판 관리</h2>
			
			<ul class="listUl tCenter">
				<li>
					<a href="../board/list">
						<img alt="회원리스트 아이콘" src="../img/admin_icon3.jpg">
						<span class='listText'>일반 게시판</span>
					</a>
				</li>
				<li>
					<a href="./list">
						<img alt="회원리스트 아이콘" src="../img/admin_icon4.jpg">
						<span class='listText'>공지 게시판</span>
					</a>
				</li>
			</ul>
	
	</div>
	
	<jsp:include page="/Tail.jsp" />
	
</body>

</html>