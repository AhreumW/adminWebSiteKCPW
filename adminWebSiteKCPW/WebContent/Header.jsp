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

<div id='header'>
	<span id='logo'>KCPW</span>
	<a href="<%=request.getContextPath()%>/auth/login" class='depth1'>로그인</a>
	
	<c:if test="${memberDto.email ne null}">
		<c:if test="${memberDto.grade == 'admin'}">
			<a href="<%=request.getContextPath()%>/member/list" class='depth1'>회원리스트</a>
			<a href="<%=request.getContextPath()%>/member/add" class='depth1'>회원추가</a>
		</c:if>
	</c:if>
	
	<a href="<%=request.getContextPath()%>/board/list" class='depth1'>게시판</a>
	
	<a href="<%=request.getContextPath()%>/admin/list" class='depth1'>공지 게시판</a>
	
	<c:if test="${memberDto.email ne null}">
		<c:if test="${memberDto.grade == 'user'}">
			<span style="float:right;">
				<a style="color:white; text-decoration: none;"
					 href="<%=request.getContextPath()%>/member/info?no=${memberDto.no}">
					 	${memberDto.name}</a>
				<a style="color:white;"
					 href="<%=request.getContextPath()%>/auth/logout">
					 	로그아웃</a>
			</span>
		</c:if>
		
		<c:if test="${memberDto.grade == 'admin'}">
			<span style="float:right;">
				<a style="color:white; text-decoration: none;"
					 href="<%=request.getContextPath()%>/member/info?no=${memberDto.no}">
					 	관리자</a>
				<a style="color:white;"
					 href="<%=request.getContextPath()%>/auth/logout">
					 	로그아웃</a>
			</span>
		</c:if>
	</c:if>

</div>

