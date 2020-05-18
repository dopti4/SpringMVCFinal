<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>


<script type="text/javascript">
	
	var isConfirmId = false;
	
	function confirmId(){
		
		var inputValue = document.getElementById("id").value;	//입력된 값 가져오기.
		
		//복붙
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){	//성공한 경우
				
				if(xmlhttp.responseText == 'true'){					//넘어오는 문자열 값이 true일 때,
					isConfirmId = true;
					alert("사용 가능한 ID입니다.");
				}else{
					isConfirmId = false;
					alert("중복된 ID가 존재합니다.");
				}
			}
		};	//세미콜론 필수
		
		//복붙
		xmlhttp.open("post", "./confirmId.do" , true);	//get방식은 url에 ? + "id=" + inputValue 이런식으로 
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("id=" + inputValue);
	}
	
	function confirmId_jQuery(){
		
		var inputValue = $("#id").val();	//val() 함수 호출해야함. 값을 넣으면 setter, 안 넣으면 getter
		
		$.ajax({	
			type : 'post',
			url : './confirmId.do',
			data : {'id' : inputValue},
			success : function(result){
				if(result == 'true'){
					isConfirmId = true;
					alert("사용가능한 아이디입니다.");
				}else{
					isConfirmId = false;
					alert("중복된 아이디가 존재합니다.");
				}
			}
		});	
	}
	
	<%--
	function testAjax(){
		
		//AJAX 호출...코드 시작
		var xmlhttp = new XMLHttpRequest();		//ajax 실행 객체
		
		//호출 후 값을 받았을때... 처리 로직....
		xmlhttp.onreadystatechange = function(){	//호출될 때마다 실행될 함수
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){			//예외 처리 - 한 번만 호출되게끔 해줌(4번이 핵심).
				//alert("안녕하세요");
				//alert(xmlhttp.responseText);		//html 코드 호출
				var box = document.getElementById("test_box");
				//box.innerText = xmlhttp.responseText;
				
				//댓글 처리시 참고! ---- 지웠다가 새로 뜨게끔
				for(var xx of box.childNodes){
					box.removeChild(xx);
				}
				
				var obj = JSON.parse(xmlhttp.responseText);	//json -> 자바스크립트로, 이거 무조건 써야함.
				//alert("닉네임 : " + obj.member_nick);
				var ul = document.createElement("ul");
				
				for(xxx of obj){
					
					var li = document.createElement("li");
					li.innerText = xxx.member_nick;
					ul.appendChild(li);
					
				}
				
				
				box.appendChild(ul);
					
			}
			
		};
		
		xmlhttp.open("get", "./testAjax.do" , true);	//get방식으로 url 호출하겠다. 
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		xmlhttp.send();		//자바스크립트로 url 호출
		
	}
	--%>
	
	function frm_submit(){
		var frm = document.getElementById("frm");
		
		//유효성 검사
		var idBox = document.getElementById("id");
		
		//ID 유효성(이메일)
		var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		
		if(!reg.test(idBox.value)){
			alert("이메일 형식이 아닙니다.");
			
			//유효성에 맞지 않으면 기입된 내용 삭제
			idBox.value = "";
			
			//유효성에 맞지 않은 곳에 커서 두기
			idBox.focus();
			
			return;
		}
		
		//패스워드 정규식
		reg = /^[A-Za-z0-9]{6,12}$/;
		
		var pwBox = document.getElementById("pw");
		
		if(!reg.test(pwBox.value)){
			alert("비밀번호는 숫자, 영문 6~12자리여야 합니다.")
			return;
		}
		
		if(isConfirmId != true){
			alert("아이디 중복 확인을 해주셔야 합니다!");
			return;
		}
		
		frm.submit();
	}
	
</script>

</head>
<body>

<jsp:include page="../commons/global_nav.jsp"></jsp:include>

	<div class="container text-center">
		<form id="frm" action="./join_member_process.do" method="post">
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
						<input id="id" type="text" class="form-control" name="member_id"> <input type="button" value="중복 확인" onclick="confirmId_jQuery()">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-3">
						PW
					</div>
					<div class="col">
						<input id="pw" type="password" class="form-control" name="member_pw">
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
						<input onclick="frm_submit()" type="button" value="가입" class="btn btn-primary btn-block">	
					</div>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		</form>
	</div>
	 
	 
	 
	 <br>
	 <div id="test_box"></div>
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
	 

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	 
	 
</body>
</html>