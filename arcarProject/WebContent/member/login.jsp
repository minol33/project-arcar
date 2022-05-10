<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/login.css?after">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<title>로그인</title>
</head>
<%String cookie = "";
Cookie[] cookies = request.getCookies(); //쿠키생성
	if(cookies !=null&& cookies.length > 0)
	for (int i = 0; i < cookies.length; i++){
		if (cookies[i].getName().equals("userId")) { // 내가 원하는 쿠키명 찾아서 값 저장
			cookie = cookies[i].getValue();}}
%>
<script>

	function fn_submit() {
		if (document.frm.userid.value == "") {
			alert("아이디를 입력해 주세요.");
			document.frm.userid.focus();
			return false;
		}
		if (document.frm.pass.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.frm.pass.focus();
			return false;
		}

		document.frm.submit(); // 전송
	}
</script>


<body onload="document.frm.userid.focus();">
	
	<%@ include file="/include/nav.jsp"%>

	
	<form name="form-login" method="post" action="/member/loginSub.jsp">
		<div class="container-login">

			<div class="login">
				<div class="tabs">
					<a href="/member/login.jsp">LOGIN</a> 
					<a href="/member/join.jsp">JOIN</a>
				</div>
				<input type="text" name="userid" placeholder="ID" class="login-input" value="<%=cookie%>">
				<input type="password" name="pass" placeholder="Password" class="login-input">
				<input type="checkbox" name="saveid" id="saveid"><span> 아이디 저장</span> 

				<button class="login-btn" type="submit" onclick="fn_submit(); return false;">Let me in</button>
			</div>
		</div>
	</form>
</body>
</html>