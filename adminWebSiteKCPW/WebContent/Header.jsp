<%@page import="spms.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:useBean id="member" --%>
<%-- 	scope="session" --%>
<%-- 	class="spms.dto.MemberDto" --%>
<%-- /> --%>


<%-- <% --%>
<!--  	MemberDto memberDto = (MemberDto)session.getAttribute("memberDto"); -->
<!-- %> -->

<div style="background-color:#ddd; height:20px; padding: 5px;">
	<span>KCPW</span>
	<a href="<%=request.getContextPath()%>/auth/login">로그인</a>
	
	<a href="<%=request.getContextPath()%>/member/list">회원리스트</a>
	
	<a href="<%=request.getContextPath()%>/member/add">회원추가</a>
	
	<a href="<%=request.getContextPath()%>/board/list">게시판</a>
	
	<a href="<%=request.getContextPath()%>/admin/list">공지 게시판</a>
	
	<c:if test="${memberDto.email ne null}">
		<span style="float:right;">
			${memberDto.name}
			<a style="color:white;" href="<%=request.getContextPath()%>/auth/logout">로그아웃</a>
		</span>
	</c:if>

</div>

