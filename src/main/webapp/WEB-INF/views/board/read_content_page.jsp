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
	
	제목 : ${readContent.boardVo.board_title }<br>
	글쓴이 : ${readContent.memberVo.member_nick }<br>
	조회수 : ${readContent.boardVo.board_readcount }<br>
	내용 : <br>
	${readContent.boardVo.board_content }
	
	<c:forEach items="${readContent.uploadFileVoList }" var="uploadFile">
		<img alt="" src="/upload/${uploadFile.file_link_path }">
	</c:forEach>
	
	<br><br><br><br>
	<a href="${pageContext.request.contextPath }/board/main_page.do">목록</a>
	
	<c:if test="${!empty sessionUser && sessionUser.member_no == readContent.memberVo.member_no }">
	<a href="${pageContext.request.contextPath }/board/delete_content_process.do?board_no=${readContent.boardVo.board_no}">삭제</a>
	<a href="${pageContext.request.contextPath }/board/update_content_page.do?board_no=${readContent.boardVo.board_no}">수정</a>
	</c:if>
	
</body>
</html>