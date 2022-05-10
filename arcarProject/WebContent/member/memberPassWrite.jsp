<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/css/reboard.css?after">
</head>

<body>
	<%@include file="/include/nav.jsp"%>

	<div class="head">
		<div class="head-title">
			<h2>회원 목록</h2>
			<p>현재 아카 회원 목록</p>
		</div>
	</div>


	<div class="qna-container">

		<form name="frm" method="post" action="memberDelete.jsp">
		
			<input type="hidden" name="userid" value="<%=userid%>">
			<div style="font-size: 20px; text-align: center;">
				<font color="red">* </font>삭제를 위한 비밀번호를 입력해주세요.<font color="red"> *</font><br>
				<input type="password" name="pass" style="margin-top: 10px;">
				<button class="btn1" type="submit">삭제</button>
			</div>

		</form>


	</div>


</body>
</html>



