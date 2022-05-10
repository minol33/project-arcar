<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/include/dbcon.jsp"%>
<%
// 세션 변수 불러오기 + String 형 변환하기
String arcar_id5 = (String) session.getAttribute("arcar_id");
String arcar_name5 = (String) session.getAttribute("arcar_name");
%>

<%
if (arcar_id5 == null) {
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
String sql = " select " 
           + " unq, " 
		   + " carname, " 
           + " hiredate, " 
		   + " hiredate2, " 
           + " user, " 
		   + " id "
		   + " from rescnt " 
		   + " where user = '" 
		   + arcar_name5 
		   + "' and id = '" 
		   + arcar_id5 
		   + "' ";
ResultSet rs = stmt.executeQuery(sql);

String SQL1004 = " select " 
			   + " count(*) arcar_cnt " 
			   + " from rescnt where " 
			   + " id = '" + arcar_id5 + "' "
			   + " and user='" 
			   + arcar_name5 + "' ";
Statement stmt1004 = conn.createStatement();
ResultSet rs1004 = stmt1004.executeQuery(SQL1004);
rs1004.next();
int arcar_cnt = rs1004.getInt("arcar_cnt");

if (arcar_cnt == 0) {
%>

<script>
	alert("예약된 차량이 없습니다.");
	location = "/reservation/reservation.jsp";
</script>
<%
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<link rel="stylesheet" href="/css/reservation.css">
</head>
<script>
	function fn_delete(unq) {

		if (confirm("정말 취소하시겠습니까?")) {
			location = "resDelete.jsp?unq=" + unq;
		}

	}
</script>

<body>
<%@include file="/include/nav.jsp"%>

	<div class="head">
		<div class="head-title">
			<h2>차량예약 현황</h2>
			<p>고객님의 차량예약 현황입니다.</p>
		</div>
	</div>

	<div class="reser-container">
		<div class="reser-admin-table">
			<table>
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
				</colgroup>
				<tr>
					<th class="status-th">예약차량</th>
					<th class="status-th">출발일자</th>
					<th class="status-th">반납일자</th>
					<th colspan="2" class="status-th">예약자명</th>
				</tr>

				<%
				//반복문을 통한 정보 받아오며 출력
				while (rs.next()) {
					String unq = rs.getString("unq");
					String carname = rs.getString("carname");
					String hiredate = rs.getString("hiredate");
					String hiredate2 = rs.getString("hiredate2");
					String user = rs.getString("user");
				%>

				<tr>
					<td class="status-img">
							<%
							if (unq.equals("1")) {
							%> <img src="/img/spark.png"><p><%=carname%></p> <%
							} else if (unq.equals("2")) {
							%> <img src="/img/venue.png"><p><%=carname%></p> <%
							} else if (unq.equals("3")) {
							%> <img src="/img/grandeur.png"><p><%=carname%></p> <%
							} else if (unq.equals("4")) {
							%> <img src="/img/ioniq.png"><p><%=carname%></p> <%
							} else if (unq.equals("5")) {
							%> <img src="/img/clio.png"><p><%=carname%></p> <%
							} else if (unq.equals("6")) {
							%> <img src="/img/thenewavante.png"><p><%=carname%></p> <%
							} else if (unq.equals("7")) {
							%> <img src="/img/allnewavante.png"><p><%=carname%></p> <%
							}
							%>
					</td>
					<td><%=hiredate%></td>
					<td><%=hiredate2%></td>
					<td><%=user%>
					<button class="cancel-btn" type="button" 
							name="cancel" onclick="fn_delete('<%=unq%>')">취소</button></td>
				</tr>
				<%
				}
				%>

			</table>
		</div>
	</div>

</body>
</html>