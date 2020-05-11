<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 복붙 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<jsp:include page="../commons/global_nav.jsp"></jsp:include>

<!-- row 안 쪽에 col 들어가야함! 컨텐츠는 col에다 넣는다. row에 뭐 넣는 거 아니야~ -->
<div class="container">
	<form action="./login_process.do">
	<div class="row">
		<div class="col-3"></div>
		<div class="col">
			<!-- 로고 -->
			<div class="row text-center mt-5">
				<div class="col">
					<h1>로그인</h1>
				</div>
			</div>
			<!-- ID -->
			<div class="row mt-5">
				<div class="col-1">
					ID
				</div>
				<div class="col">
					<input placeholder="이메일을 입력해주세요." type="text" class="form-control" name="member_id">
				</div>
			</div>
			<!-- PW -->
			<div class="row mt-1">
				<div class="col-1">
					PW
				</div>
				<div class="col">
					<input placeholder="비밀번호를 입력해주세요." type="password" class="form-control" name="member_pw">
				</div>
			</div>
			<!-- 로그인 -->
			<div class="row mt-3">
				<div class="col">
					<input type="submit" value="로그인" class="btn btn-primary btn-block">
				</div>
			</div>
			<!-- 회원가입 -->
			<div class="row mt-2">
				<div class="col">
					<a href="./join_member_page.do" class="btn btn-outline-success btn-block">회원가입</a>
				</div>
			</div>
		</div>
		<div class="col-3"></div>
	</div>
	</form>
</div>



<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>