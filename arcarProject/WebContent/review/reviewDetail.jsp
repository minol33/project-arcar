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
String sql3 = " select code,star from score " + " order by code asc";
//실행
Statement stmt3 = conn.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql3);
%>

<%
String arcar_lev = (String) session.getAttribute("arcar_level");

String unq = request.getParameter("unq");

String sql2 = "update reviewboard set hits=hits+1 " + "  where unq='" + unq + "'  ";
stmt.executeUpdate(sql2);

String sql = " select title,name," + "  (select star from score where code= m.score ) score, "
		+ " content,rdate,gid,thread,carn " + "   from reviewboard m " + "	    where unq='" + unq + "' ";

ResultSet rs = stmt.executeQuery(sql);
String title = "";
String carn = "";
String score = "";
String name = "";
String content = "";
String rdate = "";
String gid = "";
String thread = "";

if (rs.next()) {
	title = rs.getString("title");
	name = rs.getString("name");
	carn = rs.getString("carn");
	content = rs.getString("content");
	score = rs.getString("score");

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
<title>리뷰게시판 상세화면</title>
<link rel="stylesheet" href="/css/review.css">
</head>

<script>
	function fn_poll(unq) {
		var url = "revi.jsp?unq=" + unq;
		window.open(url, "poll", "width=350,height=300");
	}
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
			<h2>이용 후기</h2>
			<p>아카 고객님들의 이용 후기를 확인하고 나에게 맞는 차량을 예약해보세요!</p>
		</div>
	</div>

	<div class="review-container">
		<div class="review-list">
			<table>
				<tr>
					<th width="25%">제목</th>
					<td width="75%"><%=title%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=name%></td>
				</tr>
				<tr>
					<th>차종</th>
					<td>
						<%
						if (carn.equals("/img/review/sparkimg.png")) {
							out.print("스파크");
						} else if (carn.equals("/img/review/grandeur1.png")) {
							out.print("그랜저");
						} else if (carn.equals("/img/review/venue1.png")) {
							out.print("베뉴");
						} else if (carn.equals("/img/review/ioniq1.png")) {
							out.print("아이오닉");
						} else if (carn.equals("/img/review/clio1.png")) {
							out.print("클리오");
						} else if (carn.equals("/img/review/thenewavante1.png")) {
							out.print("더 뉴 아반떼");
						} else if (carn.equals("/img/review/allnewavante1.png")) {
							out.print("올 뉴 아반떼");
						} else {
							out.print("");
						}
						%>
					</td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=score%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=content%></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%=rdate%></td>
				</tr>
			</table>

			<div class="review-detail-btn">

				<%
				if ( arcar_name.equals(name)){
				%>
				<button type="button"
					onclick=" location='reviewModify.jsp?unq=<%=unq%>' ">수정</button>
				<button type="button"
					onclick=" location='reviewPassWrite.jsp?gid=<%=gid%>&thread=<%=thread%>' ">삭제</button>
				<%
				}
				%>
				<button type="button" onclick="location='reviewList.jsp'">목록</button>
			</div>
		</div>
	</div>


</body>
</html>



