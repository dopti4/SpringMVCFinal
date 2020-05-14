<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
																								<!-- 파일업로드시 인코딩타입 필요 -->
	<form action="${pageContext.request.contextPath }/board/write_content_process.do" method="post" enctype="multipart/form-data">
		닉네임 : ${sessionUser.member_nick }<br>
		제목 : <input type="text" name="board_title"><br>
		내용 : <br>
		<textarea rows="10" cols="40" name="board_content"></textarea><br>
		
		<!-- 파일 업로드 -->
		<input type="file" name="upload_files" multiple="multiple" accept="image/*"><br>
		<input type="submit" value="확인">
	</form>


</body>
</html>