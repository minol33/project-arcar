<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String gid = request.getParameter("gid");
String thread = request.getParameter("thread");
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
			<h2>1:1 문의</h2>
			<p>다양한 문의사항을 기재해 주시면 최대한 빠르게 답변 하겠니다.</p>
		</div>
	</div>

	<div class="qna-container">

		<form name="frm" method="post" action="reBoardDelete.jsp">
			
			<input type="hidden" name="gid" value="<%=gid%>"> <input
				type="hidden" name="thread" value="<%=thread%>">
			<div style="font-size: 20px; text-align: center;">
				<font color="red">* </font>삭제를 위한 비밀번호를 입력해주세요.<font color="red"> *</font><br>
				<input type="password" name="pass" style="margin-top: 10px;">
				<button class="btn1" type="submit">삭제</button>
			</div>

		</form>


	</div>

</body>
</html>



