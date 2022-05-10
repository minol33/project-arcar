<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/dbcon.jsp"%>
<%
	//세션 변수 불러오기 + String 형 변환하기
String re_id = (String) session.getAttribute("arcar_id");
String re_name = (String) session.getAttribute("arcar_name");
String re_level = (String) session.getAttribute("arcar_level");
if (re_id == null || re_level.equals("B")) {
%>
<script>
	alert("관리자만 답변이 가능합니다.");
	location = "/reboard/reBoardList.jsp"
</script>
<%
	return;
}
String unq = request.getParameter("unq");
String name = request.getParameter("name");
String gid = request.getParameter("gid");
String thread = request.getParameter("thread");
%>
<%
String sql = "select pass from memberinfo"
		   + "    where name='"+re_name+"' ";
ResultSet rs = stmt.executeQuery(sql);
String pass = rs.getString("pass");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>답변게시판 답변화면</title>
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
			alert("내용을 입력해주세요.");
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
			<form name="frm" method="post" action="replyWriteSave.jsp">

				<input type="hidden" name="pass" value="<%=pass%>"> 
				<input type="hidden" name="unq" value="<%=unq%>"> 
				<input type="hidden" name="gid" value="<%=gid%>"> 
				<input type="hidden" name="thread" value="<%=thread%>">

				<table>
					<tr>
						<th width="25%">제목</th>
						<td width="75%">RE:<input type="text" name="title" style="width: 99%;" 
							value="답변 완료"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" style="width: 99%;"
							value=<%=re_name%>></td>
					</tr>
					<tr>
						<th height="200">내용</th>
						<td><textarea name="content"
								style="width: 99%; height: 200px" class="text_content"></textarea></td>
					</tr>
				</table>
			</form>

			<div class="qna-btn-top">
				<button type="submit" onclick="fn_submit(); return false;">저장</button>
				<button type="button" onclick=" location='reBoardList.jsp' ">취소</button>
			</div>




		</div>
	</div>
</body>
</html>



