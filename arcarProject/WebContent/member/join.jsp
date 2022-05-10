<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/join.css?after">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="/js/jquery/jquery-1.12.4.js"></script>
<script src="/js/jquery-ui.js"></script>
<title>회원가입</title>
</head>
<script>

function fn_idcheck() {
	// ID값 받기
	// 팝업(idcheck.jsp)창으로 오픈
	var id = document.frm.userid.value;
	if( id.length < 4 || id.length > 12){
		alert("아이디는 4자~12자 사이로 입력해주세요.");
		return false;
	}
	var url = "idcheck.jsp?userid="+id;
	window.open(url,'popup','width=200,height=100'); // 팝업창을 띄우는 함수 (경로,별칭,크기)
}
function fn_submit() {

	var idButton = document.frm.idButton.value;
	if( idButton == 1 ){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	var userid = document.frm.userid.value;
	var len = userid.length;
	for(var i=0; i<len; i++){
		// 치환 replace(old,new)
		userid = userid.replace(" ","");
	}
	
	if( userid.length < 4 || userid.length > 12){
		alert("아이디를 다시 입력해 주세요.");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.pass.value == ""){
		alert("암호를 입력해 주세요.");
		document.frm.pass.focus();
		return false;
	}
	if(document.frm.name.value == ""){
		alert("이름을 입력해 주세요.");
		document.frm.name.focus();
		return false;
	}
	document.frm.submit(); // 전송
}

</script>


<body>

	<%@ include file="/include/nav.jsp"%>

	<form name="form-join" method="post"
		action="/member/memberWriteSave.jsp">
		<div class="container-join">

			<div class="join">
				<div class="tabs">
					<a href="/member/login.jsp">LOGIN</a> <a
						href="/member/join.jsp">JOIN</a>
				</div>
				<label for="userid">User ID</label> 
				<input type="text" name="userid">

				<label for="pass">Password</label> 
				<input type="password" name="pass"> 
								
				<label for="confirmpass">Confirm Password</label> 
				<input type="password" name="confirmpass"> 
				
				<label for="name">name</label> 
				<input type="text" name="name"> 
					
				<label for="mobile">Phone Number</label> 
				<input type="text" name="mobile"> 
				
				<button class="join-btn" type="submit" onclick="fn_submit(); return false;">Sign Up</button>
			</div>
		</div>
	</form>
</body>
</html>