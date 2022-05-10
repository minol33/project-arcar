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
String sql3 = " select code,star from score " + " order by code asc";
//실행
Statement stmt3 = conn.createStatement();
ResultSet rs3 = stmt3.executeQuery(sql3);
%>
<%
String unq = request.getParameter("unq");

String sql = " select title,name,carn,score,content from reviewboard " + "     where unq='" + unq + "' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String title = rs.getString("title");

String name = rs.getString("name");
String carn = rs.getString("carn");
String score = rs.getString("score");
String content = rs.getString("content");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>리뷰게시판 수정화면</title>
<link rel="stylesheet" href="/css/review.css">
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
			<h2>이용 후기</h2>
			<p>아카 고객님들의 이용 후기를 확인하고 나에게 맞는 차량을 예약해보세요!</p>
		</div>
	</div>

	<div class="review-container">
		<div class="review-list">
			<form name="frm" method="post" action="reviewModifySave.jsp">
				<input type="hidden" name="unq" value="<%=unq%>">
				<table>
					
					<tr>
						<th style="border-bottom: 1px solid black;">제목</th>
						<td style="border-bottom: 1px solid black;">
						<input type="text" name="title" value="<%=title%>" style="width: 99%;"></td>
					</tr>
					
					<tr>
						<th style="border-bottom: 1px solid black;">글쓴이</th>
						<td style="border-bottom: 1px solid black;"><%=name%></td>
					</tr>
					
					<tr>
						<th style="border-bottom: 1px solid black;">차종</th>
						<td style="border-bottom: 1px solid black;">
						<select name="carn" style="width: 100%;">
								<option value="--차종--"
									<%if (carn.equals("--차종--"))
										out.print("selected");%>>--차종--</option>
								<option value="/img/review/sparkimg.png"
									<%if (carn.equals("/img/review/sparkimg.png"))
										out.print("selected");%>>스파크</option>
								<option value="/img/review/grandeur1.png"
									<%if (carn.equals("/img/review/grandeur1.png"))
										out.print("selected");%>>그랜저</option>
								<option value="/img/review/venue1.png"
									<%if (carn.equals("/img/review/venue1.png"))
										out.print("selected");%>>베뉴</option>
								<option value="/img/review/ioniq1.png"
									<%if (carn.equals("/img/review/ioniq1.png"))
										out.print("selected");%>>아이오닉</option>
								<option value="/img/review/clio1.png"
									<%if (carn.equals("/img/review/clio1.png"))
										out.print("selected");%>>클리오</option>
								<option value="/img/review/thenewavante1.png"
									<%if (carn.equals("/img/review/thenewavante1.png"))
										out.print("selected");%>>더 뉴 아반떼</option>
								<option value="/img/review/allnewavante1.png"
									<%if (carn.equals("/img/review/allnewavante1.png")) 
										out.print("selected");%>>올 뉴 아반떼</option>
						</select>
						</td>
					</tr>
					
					
					<tr>
						<th>암호</th>
						<td style="border-bottom: 1px solid black;"><input
							type="password" name="pass" style="width: 99%;"></td>
					</tr>
					<tr>
						<th>리뷰점수</th>
						<td>
						<select name="score" style="width: 100%;">
								<option value="">평점</option>
								<%
								while (rs3.next()) {
									String code = rs3.getString("code");
									String star = rs3.getString("star");
								%>
								<option value="<%=code%>"
									<%if (score.equals(code)) {
										out.print("selected");
										}%>><%=star%>
								</option>
									<%
									}
									%>
						</select>
						</td>
					</tr>
					
					<tr>
						<th>내용</th>
						<td><textarea name="content" class="text_content"
								style="width: 99%; height: 100px;"><%=content%>
					</textarea>
						</td>
					</tr>
					
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



