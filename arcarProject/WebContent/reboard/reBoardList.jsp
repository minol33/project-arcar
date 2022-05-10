<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/dbcon.jsp"%>

<%
	int pageUnit = 10;

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
String sql2 = "select count(*) as total from reboard";
Statement stmt2 = conn.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();
int total = rs2.getInt("total");
// (double)12/10 -> ceil(1.2) -> (int)2.0 
int lastpage = (int) Math.ceil((double) total / pageUnit); // 2.0
//2
int number = total - startno;

// limit 시작번호,출력개수
// 1 -> 0 , 2 -> 10 , 3 -> 20
String sql = " select unq,title,name,hits,rdate,thread " + "   from reboard " + "	    order by gid desc, thread asc  "
		+ "  limit " + startno + "," + pageUnit; // 0 ~ 9
ResultSet rs = stmt.executeQuery(sql);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>답변게시판 목록</title>
<link rel="stylesheet" href="/css/reboard.css?after">

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
				<colgroup>
					<col width="9%" />
					<col width="40%" />
					<col width="15%" />
					<col width="9%" />
					<col width="27%" />
				</colgroup>
				<tr class="top">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
				<%
				while (rs.next()) {
				String unq = rs.getString("unq");
				String title = rs.getString("title");
				String name = rs.getString("name");
				String hits = rs.getString("hits");
				String rdate = rs.getString("rdate");
				String thread = rs.getString("thread");
				String re = "";
				if (!thread.equals("a")) {
					re = "<img src='/img/re3.png' width='15' height='15'>";
				}
				// "a".length() -> 1
				// "aa".length() -> 2
				// "aaa".length() -> 3
				int len = thread.length();
			%>
				<tr align="center">
					<td><%=number%></td>
					<td align="left">
						<%
						for (int i = 1; i < len; i++) {
						out.print("");
					}
					%> <%=re%><a href="reBoardDetail.jsp?unq=<%=unq%>"><%=title%></a>
					</td>
					<td><%=name%></td>
					<td><%=hits%></td>
					<td><%=rdate.substring(0, 10)%></td>
				</tr>

				<%
				number--;
			}
			%>

			</table>
			<button class="qna-btn" type="button"
				onclick="location='reBoardWrite.jsp' ">글쓰기</button>
			
			<div class="page">

				<%
				// 12 -> 2
			for (int i = 1; i <= lastpage; i++) {
			%>
				<a href="reBoardList.jsp?pageIndex=<%=i%>"><%=i%></a>
				<%
				}
			%>


			</div>
		</div>
	</div>



</body>
</html>



