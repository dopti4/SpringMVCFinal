<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:choose>
		<c:when test="${!empty sessionUser }">
			${sessionUser.member_nick }님 환영합니다!
			<a href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>	<!-- 앞에 .. 넣어주면 상위로부터 시작 -->
		</c:when>
		<c:otherwise>
									<!-- jsp쪽 절대경로 설정법. -->
			비회원 입장. <a href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
		</c:otherwise>
	</c:choose>
	<br>
	
	
	<!-- 게시글 목록 -->
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${dataList }" var="aaa">
			<tr>
				<td>${aaa.boardVo.board_no }</td>
				<td>${aaa.boardVo.board_title }</td>
				<td>${aaa.memberVo.member_nick }</td>
				<td>${aaa.boardVo.board_writedate }</td>
				<td>${aaa.boardVo.board_readcount }</td>
			</tr>
		</c:forEach>
	</table>
	
	<br><br><br><br><br><br><br>
	
	<c:if test="${!empty sessionUser }">
		<a href="${pageContext.request.contextPath }/board/write_content_page.do">글쓰기</a>
	</c:if>
	
</body>
</html>