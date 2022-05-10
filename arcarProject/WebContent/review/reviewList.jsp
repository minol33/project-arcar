<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/dbcon.jsp"%>

<%
String review_id = (String) session.getAttribute("arcar_id");
String review_name = (String) session.getAttribute("arcar_name");
String s_column = request.getParameter("s_column");
String s_text = request.getParameter("s_text");
%>
<%
if (review_id == null) {
%>
<script>
	alert("로그인 후에 사용 가능합니다.");
	location = "/member/login.jsp"
</script>
<%
return;
}
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
String sql2 = "select count(*) as total from reviewboard";
Statement stmt2 = conn.createStatement();
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int total = rs2.getInt("total");
// (double)12/10 -> ceil(1.2) -> (int)2.0 
int lastpage = (int) Math.ceil((double) total / pageUnit); // 2.0
//2
int number = total - startno;

String add_sql = "";
if (s_column != null && s_text != null && !s_column.equals("") && !s_text.equals("")) {

	add_sql = " and  " + s_column + " like '%" + s_text + "%' ";
}

// limit 시작번호,출력개수
// 1 -> 0 , 2 -> 10 , 3 -> 20
String sql = " select " + " m.unq ," + " m.title, " + " m.name," + " m.hits, " + " j.star, " + "  m.rdate,"
		+ " m.thread, " + " m.carn " + "   from reviewboard m, score j" + " where m.score = j.code" + add_sql
		+ "	    order by m.gid desc, m.thread asc  " + "  limit " + startno + "," + pageUnit; // 0 ~ 9
ResultSet rs = stmt.executeQuery(sql);
%>








<%
String sql3 = " select code,star from score " + " order by code asc";
//실행
Statement stmt3 = conn.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql3);
%>




<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>차량 리뷰</title>

<link rel="stylesheet" href="/css/review.css">

</head>
<script>
	function Image() {
		//sel select
		var sel = document.getElementById("carn");
		var img = document.getElementById("carnimage");
		for (var i = 0; i < sel.length; i++) {
			if (sel[i].selected == true) {
				found = sel[i];
				break;
			}
		}

		img.src = found.value;
	}
	function fn_submit() {
		if (document.frm.title.value == "") {
			alert("제목을 입력해주세요.");
			document.frm.title.focus();
			return false;
		}
		if (document.frm.score.value == "") {
			alert("평점을 주세요.");
			document.frm.score.focus();
			return false;
		}
		if (document.frm.carn.value == "") {
			alert("차종을 선택해주세요.");
			document.frm.carn.focus();
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
			<h2>이용 후기</h2>
			<p>아카 고객님들의 이용 후기를 확인하고 나에게 맞는 차량을 예약해보세요!</p>
		</div>
	</div>

	<div class="review-container">
		<div class="review-list">
			<table class="review-list-table">
				<colgroup>
					<col width="10%" />
					<col class="title-table" width="25%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />

				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>차종</th>
					<th class="mobile-v">평점</th>
					<th>글쓴이</th>
					<th>조회수</th>
					<th class="mobile-v">등록일</th>
				</tr>
				<%
				while (rs.next()) {
					String unq = rs.getString("unq");
					String title = rs.getString("title");
					String score = rs.getString("star");
					String name = rs.getString("name");
					String hits = rs.getString("hits");
					String rdate = rs.getString("rdate");
					String thread = rs.getString("thread");
					String carn = rs.getString("carn");
					String re = "";
					if (!thread.equals("a")) {
						re = "<img src='/img/re3.png' width='20' height='20'>";
					}
					// "a".length() -> 1
					// "aa".length() -> 2
					// "aaa".length() -> 3
					int len = thread.length();
				%>


				<tr>
					<td><%=number%></td>
					<td><%=re%><a
						href="reviewDetail.jsp?unq=<%=unq%>"><%=title%></a></td>
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
					<td class="mobile-v"><%=score%></td>
					<td><%=name%></td>
					<td><%=hits%></td>
					<td class="mobile-v"><%=rdate.substring(0, 10)%></td>
				</tr>

				<%
				number--;
				}
				%>

			</table>

			<button class="review-list-btn" type="button"
				onclick="location='reviewWrite.jsp' ">글쓰기</button>

			<div class="page">

				<%
				// 12 -> 2
				for (int i = 1; i <= lastpage; i++) {
				%>
				<a href="reviewList.jsp?pageIndex=<%=i%>"><%=i%></a>
				<%
				}
				%>


			</div>

			<div class="search-form">
				<form action="reviewList.jsp" method="post" name="s_form">
					<select name="s_column">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="carn">차종</option>
						<option value="name">글쓴이</option>
					</select> <input type="text" style="width: 150px;" size="20" name="s_text" /> 
					<button type="submit">검색</button>
				</form>
			</div>


		</div>


	</div>


</body>

</html>



