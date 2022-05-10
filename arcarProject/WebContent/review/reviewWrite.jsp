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
		<div class="review-write">
			<form method="post" action="reviewWriteSave.jsp" name="frm">

				<table>
					<thead>
						<tr>
							<th class="th-title" colspan="2">차량 사용 후기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" name="title" placeholder="글 제목"
								style="width: 99%;"></td>
						</tr>
						<tr>
							<td><select onchange="Image();" name="carn"
								style="width: 100%;">
									<option value="/img/arcarmini.PNG">---차종--</option>
									<option value="/img/review/sparkimg.png">스파크</option>
									<option value="/img/review/grandeur1.png">그랜저</option>
									<option value="/img/review/venue1.png">베뉴</option>
									<option value="/img/review/ioniq1.png">아오오닉</option>
									<option value="/img/review/clio1.png">클리오</option>
									<option value="/img/review/thenewavante1.png">더 뉴 아반뗴</option>
									<option value="/img/review/allnewavante1.png">올 뉴 아반뗴</option>
							</select></td>
						</tr>
						<tr>
							<td><select name="score" style="width: 100%">
									<option value="">-평점-</option>
									<%
									while (rs3.next()) {
										String code = rs3.getString("code");
										String star = rs3.getString("star");
									%>
									<option value="<%=code%>"><%=star%></option>
									<%
									}
									%>
							</select></td>
						</tr>

						<tr>
							<td><textarea placeholder="글 내용" name="content"
									style="width: 99%; height:100px;"></textarea></td>
						</tr>
						<tr>

							<td><input style="width: 99%;" type="password" name="pass"
								placeholder="암호"></td>
						</tr>
					</tbody>
				</table>
			</form>

			<div class="review-detail-btn">
				<button type="submit" onclick="fn_submit(); return false; ">저장</button>
				<button type="button" onclick="history.back();">취소</button>
			</div>

		</div>


	</div>


</body>

</html>



