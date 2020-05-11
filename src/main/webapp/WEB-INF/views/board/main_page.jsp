<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	<!-- fmt 추가해서 태그 이용해 날짜 변환 하자. -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<!-- 인클루드~~ -->
<jsp:include page="../commons/global_nav.jsp"></jsp:include>


	
	<!-- 부트스트랩 -->
	<div class="container mt-5 text-center">
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">	<!-- 테이블 -->
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr><td>글번호</td><td>제목</td><td>글쓴이</td><td>작성일</td><td>조회수</td></tr>
							</thead>
							<tbody>		<!-- 반복문 -->
							<c:forEach items="${dataList }" var="aaa">
								<tr class="text-center">
									<td>${aaa.boardVo.board_no }</td>
									<td><a href="${pageContext.request.contextPath }/board/read_content_page.do?board_no=${aaa.boardVo.board_no}">${aaa.boardVo.board_title }</a></td>
									<td>${aaa.memberVo.member_nick }</td>
									<!-- 
									<td>${aaa.boardVo.board_writedate }</td>
									 -->
									<!-- Date타입 String으로(자바 문법) -->
									<%--
									<%
										java.util.Map<String, Object> map = 
												(java.util.Map<String, Object>)pageContext.getAttribute("xxx");
									
										com.ja.freeboard.vo.BoardVo boardVo = 
												(com.ja.freeboard.vo.BoardVo)map.get("boardVo");
										
										java.util.Date date = boardVo.getBoard_writedate();
										
										//out.print(date.toString());
										
										//Date타입으로 들어오고 리턴은 String으로
										java.text.SimpleDateFormat sd = new java.text.SimpleDateFormat("yy.MM.dd");
										
										String printValue = sd.format(date);
										
										//printValue 출력
									%>
									 --%>
									 <!-- fmt태그 이용 변환 -->
									 <td><fmt:formatDate value="${aaa.boardVo.board_writedate }" pattern="yy.MM.dd hh:mm:ss"/></td>
									 
									
									<td>${aaa.boardVo.board_readcount }</td>
									 
									 
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
				</div>
				<div class="row mt-3">	<!-- 버튼 -->
					<div class="col">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
						    <li class="page-item active"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">Next</a></li>
						  </ul>
						</nav>
					</div>
					<div class="col-2">
						<a href="./write_content_page.do" class="btn btn-primary btn-block">글쓰기</a>
					</div>
				</div>
				
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	
	
	
	<!-- 게시글 목록 -->
	<!-- 
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${dataList}" var="aaa">
			<tr>
				<td>${aaa.boardVo.board_no }</td>
				<td><a href="${pageContext.request.contextPath }/board/read_content_page.do?board_no=${aaa.boardVo.board_no}">${aaa.boardVo.board_title }</a></td>
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
	-->
	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


	
</body>
</html>