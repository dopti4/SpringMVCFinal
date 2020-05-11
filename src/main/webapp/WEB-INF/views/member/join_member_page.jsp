<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<jsp:include page="../commons/global_nav.jsp"></jsp:include>

	<div class="container text-center">
		<form action="./join_member_process.do" method="post">
		<div class="row">
			<div class="col-3"></div>
			<div class="col">
				<div class="row">	<!-- 로고 -->
					<div class="col mt-5">
						<h1>회원가입</h1>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-3">
						ID
					</div>
					<div class="col">
						<input type="text" class="form-control" name="member_id">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-3">
						PW
					</div>
					<div class="col">
						<input type="password" class="form-control" name="member_pw">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-3">
						닉네임
					</div>
					<div class="col">
						<input type="text" class="form-control" name="member_nick">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-3">
						성별
					</div>
					<div class="col btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-outline-success active">
							<input type="radio" name="member_sex" value="M" checked>남
						</label>
						<label class="btn btn-outline-success active">
							<input type="radio" name="member_sex" value="W">여
						</label> 
					</div>
					<div class="col-5"></div>
				</div>
				<div class="row mt-2">
					<div class="col-3">
						취미
					</div>
					<div class="col text-left btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-outline-info active">
							<input type="checkbox" name="member_hobby" value="1">농구
						</label>
						<label class="btn btn-outline-info active">	
							<input type="checkbox" name="member_hobby" value="2">축구
						</label>
						<label class="btn btn-outline-info active">	
							<input type="checkbox" name="member_hobby" value="3">야구
						</label>
						<label class="btn btn-outline-info active">	
							<input type="checkbox" name="member_hobby" value="4">독서
						</label>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<input type="submit" value="가입" class="btn btn-primary btn-block">	
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		</form>
	</div>
	 
	 <!--
	<h1>회원 가입</h1>
	
	<form action="./join_member_process.do" method="post">
		ID(이메일) : <input type="text" name="member_id"><br>
		PW : <input type="password" name="member_pw"><br>
		닉네임 : <input type="text" name="member_nick"><br>
		성별 : <input type="radio" name="member_sex" value="M" checked>남
				<input type="radio" name="member_sex" value="W">여<br> 
		취미 : <input type="checkbox" name="member_hobby" value="1">농구
				<input type="checkbox" name="member_hobby" value="2">축구
				<input type="checkbox" name="member_hobby" value="3">야구
				<input type="checkbox" name="member_hobby" value="4">독서<br>
		<input type="submit" value="가입">		
	</form>
	 -->
	 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	 
	 
</body>
</html>