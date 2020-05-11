<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${pageContext.request.contextPath }/board/update_content_process.do" method="post">
		닉네임 : ${readContent.memberVo.member_nick }<br>
		제목 : <input type="text" name="board_title" value="${readContent.boardVo.board_title }"><br>
		내용 : <br>
		<textarea rows="10" cols="40" name="board_content">${readContent.boardVo.board_content }</textarea>
		
		<br><br><br><br><br><br>
		
		<input type="submit" value="수정"> 
		<input type="hidden" name="board_no" value="${readContent.boardVo.board_no }">
		<a href="${pageContext.request.contextPath }/board/main_page.do">목록</a>
	</form>

</body>
</html>