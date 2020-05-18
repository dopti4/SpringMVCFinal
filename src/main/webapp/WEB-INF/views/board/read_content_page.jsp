<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function refreshReplyList(){
		
		var boardNo = ${readContent.boardVo.board_no};
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);	//테스트용
				var resultData = JSON.parse(xmlhttp.responseText);	//자바스크립트용으로 변환
				
				//자바스크립로 동적 UI 꾸미기
				var replyBox = document.getElementById("reply_box")
				
				//박스 안에 내용 지우기(새로 붙일라구)
				var length = replyBox.childNodes.length;
				for(var i = 0; i < length; i++){
					replyBox.removeChild(replyBox.childNodes[0]);
				}
				
				for(var data of resultData){
					//닉네임
					var boxRow1 = document.createElement("div");
					boxRow1.setAttribute("class", "row");			//div 클래스 붙여줌
					
					var boxRow1_col1 = document.createElement("div");
					boxRow1_col1.setAttribute("class", "col-8");
					
					var boxNick = document.createElement("div");
					boxNick.setAttribute("class", "alert alert-secondary");
					
					boxNick.innerText = data.memberVo.member_nick;
					
					boxRow1_col1.appendChild(boxNick);		//안에 차곡차곡
					boxRow1.appendChild(boxRow1_col1);
					
					//날짜
					var boxRow1_col2 = document.createElement("div");
					boxRow1_col2.setAttribute("class", "col");
					
					var boxDate = document.createElement("div");
					boxDate.setAttribute("class", "alert alert-secondary");
					
					var milliseconds = data.replyVo.reply_writedate;	//날짜 이쁘게 자르자!
					var date = new Date(milliseconds);
					
					boxDate.innerText = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
					
					boxRow1_col2.appendChild(boxDate);		//안에 차곡차곡
					boxRow1.appendChild(boxRow1_col2);
					
					//내용
					var boxRow2 = document.createElement("div");
					boxRow2.setAttribute("class", "row");
					
					var boxRow2_col1 = document.createElement("div");
					boxRow2_col1.setAttribute("class", "col");
					
					var boxContent = document.createElement("div");
					boxContent.setAttribute("class", "alert alert-primary");
					
					boxContent.innerText = data.replyVo.reply_content;
					
					boxRow2_col1.appendChild(boxContent);
					boxRow2.appendChild(boxRow2_col1);
					
					//최종 박스 안에 넣기
					replyBox.appendChild(boxRow1);
					replyBox.appendChild(boxRow2);
				}
			}
			
		};
		
		xmlhttp.open("get", "./get_reply_list.do?board_no=" + boardNo, true);		//보통 select는 get방식, insert ..~ 이런거는 post방식
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
	function writeReply(){
		
		var boardNo = ${readContent.boardVo.board_no};
		var replyContent = document.getElementById("reply_content").value;
		
		//Ajax 기본
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshReplyList();		//정상적으로 댓글 등록시 리프레시리스트 출력
			}
			
		};
		
		xmlhttp.open("post", "./write_reply_process.do" , true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("board_no=" + boardNo + "&reply_content=" + replyContent);
	}

</script>

</head>
<body onload="refreshReplyList()">
	
	<div class="container">
		<div class="row">
			<div class="col">
				제목 : ${readContent.boardVo.board_title }<br>
				글쓴이 : ${readContent.memberVo.member_nick }<br>
				조회수 : ${readContent.boardVo.board_readcount }<br>
				내용 : <br>
				${readContent.boardVo.board_content }<br>
				<c:forEach items="${readContent.uploadFileVoList }" var="uploadFile">
					<img alt="" src="/upload/${uploadFile.file_link_path }">
				</c:forEach>
				<br><br><br>
			</div>
		</div>
		
		<div class="row">	<!-- 댓글 리스트 박스 -->
			<div class="col" id="reply_box">	<!-- 리스트 컨텐트 박스 -->
				<div class="row">	<!-- 1번 댓글 -->
					<div class="col-8">	<!-- 닉네임 -->
						
					</div>
					<div class="col">	<!-- 날짜 -->
						
					</div>
				</div>
				<div class="row">
					<div class="col">	<!-- 내용 -->
						
					</div>
				</div>		
			</div>
		</div>
		
		<div class="row">	<!-- 댓글 입력 -->
			<div class="col">
				댓글
			</div>
			<div class="col-8">
				<textarea class="form-control" id="reply_content"></textarea>
			</div>
			<div class="col">
				<input type="button" class="btn btn-primary" value="작성" onclick="writeReply()">
			</div>
		</div>
		
		
	</div>
	
	

	
	
	
	<br><br><br><br>
	<a href="${pageContext.request.contextPath }/board/main_page.do">목록</a>
	
	<c:if test="${!empty sessionUser && sessionUser.member_no == readContent.memberVo.member_no }">
	<a href="${pageContext.request.contextPath }/board/delete_content_process.do?board_no=${readContent.boardVo.board_no}">삭제</a>
	<a href="${pageContext.request.contextPath }/board/update_content_page.do?board_no=${readContent.boardVo.board_no}">수정</a>
	</c:if>
	
	
	

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	
	
</body>
</html>