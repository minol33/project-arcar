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
	alert("관리자만 확인 가능합니다.");
	location = "/index.jsp"
</script>
<%
	return;
}
%>
<%
String s_column = request.getParameter("s_column");
String s_text = request.getParameter("s_text");
%>

<%
int pageUnit = 5;

String pageIndex = request.getParameter("pageIndex");
if (pageIndex == null || pageIndex.equals("")) {
	pageIndex = "1";
}
int pageno = Integer.parseInt(pageIndex);

// 1 -> 0 , 2 -> 10 , 3 -> 20
// (1-1) * 10 -> 0 , (2-1) * 10 , (3-1) * 10
int startno = (pageno - 1) * pageUnit;
%>


<%
	// 11 -> 2 , 7 -> 1 , 19 -> 2

// 11/10 -> ceil(1.1)2.0 , 15/10-> ceil(1.5)2.0
String sql1 = "select count(*) as total from memberinfo";
ResultSet rs1 = stmt.executeQuery(sql1);
rs1.next();
int total = rs1.getInt("total");
// (double)12/10 -> ceil(1.2) -> (int)2.0 
int lastpage = (int) Math.ceil((double) total / pageUnit); // 2.0
//2
int number = total - startno;

String add_sql = "";
if (s_column != null && s_text != null && !s_column.equals("") && !s_text.equals("")) {

	add_sql = "	and " + s_column + " like '%" + s_text + "%' ";

}

String sql2 = "select" + " 	m.userid," + "		m.pass," + "		m.name,"
		+ "		date_format(m.rdate,'%Y-%m-%d') as rdate " + "	  from memberinfo as m" + add_sql
		+ "	  order by m.rdate desc" //0~9
		+ "  limit " + startno + "," + pageUnit;
ResultSet rs2 = stmt.executeQuery(sql2);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="/css/reboard.css?after">
</head>
<body>

	<%@ include file="/include/nav.jsp"%>

	<div class="head">
		<div class="head-title">
			<h2>회원 목록</h2>
			<p>현재 아카 회원 목록</p>
		</div>
	</div>

	<div class="qna-container">
		<div class="qna-table">
			<span > total : <%=total%> 명</span>
			<table>
				<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
					<col width="15%" />
				<tr class="top">
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>

				<%
					while (rs2.next()) {
					String userid = rs2.getString("userid");
					String pass = rs2.getString("pass");
					String name = rs2.getString("name");
					String rdate = rs2.getString("rdate");
				%>
				<tr align="center">
					<td><%=number%></td>
					<td><%=userid%></td>
					<td><%=pass%></td>
					<td><%=name%></td>
					<td><%=rdate%></td>
					<td>
						<button type="button"
							onclick="location='memberPassWrite.jsp?userid=<%=userid%>'">삭제</button>
					</td>
				</tr>
				<%
					number--;
				}
				%>
			</table>
			<div class="qna-btn-top">
					<form name="s_form" method="post" action="memberList.jsp">
						<select name="s_column">
							<option value="userid">아이디</option>
							<option value="name">이름</option>
						</select> 
						<input type="text" name="s_text" style="width: 150px;">
						<button type="submit">검색</button>
						<button type="button" onclick="location='join.jsp'">회원등록</button>
					</form>
			</div>
			<div class="page">
				<%
					for (int i = 1; i <= lastpage; i++) {
				%>
				<a href="memberList.jsp?pageIndex=<%=i%>"><%=i%></a>
				<%
					}
				%>
			</div>

		</div>

	</div>

</body>
</html>
