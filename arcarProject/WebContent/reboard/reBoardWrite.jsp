<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon.jsp"%>

<%
	String session_userid = (String) session.getAttribute("arcar_id");

if (session_userid == null) {
%>
<script>
	alert("로그인 이후에 이용가능합니다.");
	location = "/member/login.jsp";
</script>
<%
	return;
}
%>


<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>답변게시판 등록화면</title>
<link rel="stylesheet" href="/css/reboard.css?after">
</head>

<script>
	function fn_submit() {
		if (document.frm.title.value == "") {
			alert("제목을 입력해주세요.");
			document.frm.title.focus();
			return false;
		}
		if (document.frm.content.value == "") {
			alert("내용를 입력해주세요.");
			document.frm.content.focus();
			return false;
		}
		document.frm.submit(); // 전송
	}
</script>

<body>

	<%@include file="/include/nav.jsp"%>


	<div class="head">
		<div class="head-title">
			<h2>1:1 문의</h2>
			<p>다양한 문의사항을 기재해 주시면 최대한 빠르게 답변 하겠니다.</p>
		</div>
	</div>


	<div class="qna-container">
		<div class="qna-table">
			<form name="frm" method="post" action="reBoardWriteSave.jsp">
				<table>
					<tr class="top">
						<th width="25%">제목</th>
						<td width="75%"><input style="width: 99%;" type="text"
							name="title"></td>
					</tr>
					<tr class="top">
						<th height="200">내용</th>
						<td><textarea style="width: 99%; height: 200px;"
								name="content" class="text_content"></textarea></td>
					</tr>
					<tr class="top">
						<th>암호</th>
						<td><input style="width: 99%;" type="password" name="pass"></td>
					</tr>
				</table>
			</form>

			<div class="qna-btn-top">
				<button type="submit" onclick="fn_submit();return false;">저장</button>
				<button type="button" onclick=" location='reBoardList.jsp' ">취소</button>
			</div>

		</div>
	</div>




</body>
</html>



