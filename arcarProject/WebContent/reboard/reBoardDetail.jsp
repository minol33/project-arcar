<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/dbcon.jsp"%>
<%
String session_userid = (String) session.getAttribute("arcar_id");
String re_name = (String) session.getAttribute("arcar_name");

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
String arcar_lev = (String) session.getAttribute("arcar_level");

String unq = request.getParameter("unq");
if (unq == null || unq.equals("")) {
%>
<script>
	alert("잘못된 접근입니다.");
	location = "/";
</script>
<%
	return; // jsp end
}

String sql2 = "update reboard set hits=hits+1 " + "  where unq='" + unq + "'  ";
stmt.executeUpdate(sql2);

String sql = " select title,name,content,rdate,gid,thread " + "   from reboard " + "	    where unq='" + unq + "' ";

ResultSet rs = stmt.executeQuery(sql);
String title = "";
String name = "";
String content = "";
String rdate = "";
String gid = "";
String thread = "";

if (rs.next()) {
title = rs.getString("title");
name = rs.getString("name");
content = rs.getString("content");
// \n -> <br> .. 
content = content.replace("\n", "<br>");
rdate = rs.getString("rdate");
gid = rs.getString("gid");
thread = rs.getString("thread");
}
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>답변게시판 상세화면</title>
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
		document.frm.submit();
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
			<table>
				<tr>
					<th style="width: 400px;">제목</th>
					<td width="75%"><%=title%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=name%></td>
				</tr>
				<tr>
					<th height="200">내용</th>
					<td><%=content%></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%=rdate%></td>
				</tr>
			</table>

			<div class="qna-btn-top">

				<%
				if ( arcar_name.equals(name)){
				%>
				<button type="button"
					onclick=" location='reBoardModify.jsp?unq=<%=unq%>' ">수정</button>
				<button type="button"
					onclick=" location='reBoardPassWrite.jsp?gid=<%=gid%>&thread=<%=thread%>' ">삭제</button>
				<%
				}
				%>
				
				<%
					if (arcar_lev != null && arcar_lev.equals("A")) {
				%>
				<button type="button" id="button"
					onclick=" location='replyWrite.jsp?unq=<%=unq%>&gid=<%=gid%>&thread=<%=thread%>' ">답변</button>
				<%
					}
				%>
				<button type="button" onclick=" location='reBoardList.jsp' ">목록</button>

			</div>
		</div>
	</div>

</body>
</html>



