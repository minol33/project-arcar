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

<%
String unq = request.getParameter("unq");

String sql = " select title,name,content from reboard " + "     where unq='" + unq + "' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String title = rs.getString("title");
String name = rs.getString("name");
String content = rs.getString("content");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>답변게시판 수정화면</title>
<link rel="stylesheet" href="/css/reboard.css?after">
</head>

<script>
	function fn_submit() {
		if (document.frm.title.value == "") {
			alert("제목을 입력해주세요.");
			document.frm.title.focus();
			return false;
		}
		if (document.frm.pass.value == "") {
			alert("암호를 입력해주세요.");
			document.frm.pass.focus();
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
			<form name="frm" method="post" action="reBoardModifySave.jsp">
				<input type="hidden" name="unq" value="<%=unq%>">
				<table>
					<tr class="top">
						<th width="25%">제목</th>
						<td width="75%"><input style="width: 99%;" type="text"
							name="title" value="<%=title%>"></td>
					</tr>
					<tr class="top">
						<th>암호</th>
						<td><input style="width: 99%;" type="password" name="pass"></td>
					</tr>
					<tr class="top">
						<th>이름</th>
						<td><input style="width: 99%;" type="text" name="name"
							value="<%=name%>"></td>
					</tr>
					<tr class="top">
						<th height="200">내용</th>
						<td><textarea name="content"
								style="width: 99%; height: 200px;" class="text_content"><%=content%></textarea></td>
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



