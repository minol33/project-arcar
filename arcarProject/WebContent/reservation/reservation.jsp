<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/include/dbcon.jsp"%>
<%
// 세션 변수 불러오기 + String 형 변환하기
String arcar_id2 = (String) session.getAttribute("arcar_id");
String arcar_name2 = (String) session.getAttribute("arcar_name");
String unq = request.getParameter("unq");
%>

<%
if (arcar_id2 == null) {
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
String sql = "select cnt from rescnt where unq=1";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
String cnt = rs.getString("cnt");

String sql2 = "select cnt from rescnt where unq=2";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
String cnt2 = rs2.getString("cnt");

String sql3 = "select cnt from rescnt where unq=3";
ResultSet rs3 = stmt.executeQuery(sql3);
rs3.next();
String cnt3 = rs3.getString("cnt");

String sql4 = "select cnt from rescnt where unq=4";
ResultSet rs4 = stmt.executeQuery(sql4);
rs4.next();
String cnt4 = rs4.getString("cnt");

String sql5 = "select cnt from rescnt where unq=5";
ResultSet rs5 = stmt.executeQuery(sql5);
rs5.next();
String cnt5 = rs5.getString("cnt");

String sql6 = "select cnt from rescnt where unq=6";
ResultSet rs6 = stmt.executeQuery(sql6);
rs6.next();
String cnt6 = rs6.getString("cnt");

String sql7 = "select cnt from rescnt where unq=7";
ResultSet rs7 = stmt.executeQuery(sql7);
rs7.next();
String cnt7 = rs7.getString("cnt");
%>

<html>
<head>
<meta charset="UTF-8">
<title>예약 화면</title>
<link rel="stylesheet" href="/css/reservation.css">

</head>

<body>

	<%@include file="/include/nav.jsp"%>

	<div class="head">
		<div class="head-title">
			<h2>차량예약</h2>
			<p>원하는 차량을 원하는 시간에! 지금 바로 예약하세요!</p>
		</div>
	</div>

	<div class="reser-container">
		<div class="reser-table">
			<table>
				<tr class="reser-table-title">
					<th>차량 이미지</th>
					<th colspan="2">상세 내용</th>
				</tr>
				<tr>
					<td><img src="/img/spark.png">
					<a href="/carinfo/spark.jsp" class="reser-car-name">
							스파크
					</a></td>
					<td class="car-detail">
						<p>차종 : 경차</p>
						<p>연료 : 휘발유</p>
						<p>승차 인원 : 5</p></td>
					<td>
						<%
						if (cnt.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=1' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						<%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/venue.png">
					<a href="/carinfo/venue.jsp" class="reser-car-name">
							베뉴
					</a></td>
					<td class="car-detail">
						<p>차종 : SUV</p>
						<p>연료 : 휘발유</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt2.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=2' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						<%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/grandeur.png">
					<a href="/carinfo/grandeur.jsp" class="reser-car-name">
							그랜저
					</a></td>
					<td class="car-detail">
						<p>차종 : 준중형</p>
						<p>연료 : 휘발유</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt3.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=3' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						<%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/ioniq.png">
					<a href="/carinfo/ioniq.jsp" class="reser-car-name">
							아이오닉
					</a></td>
					<td class="car-detail">
						<p>차종 : 준중형</p>
						<p>연료 : 휘발유/전기</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt4.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=4' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						<%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/clio.png">
					<a href="/carinfo/clio.jsp" class="reser-car-name">
							클리오
					</a></td>
					<td class="car-detail">
						<p>차종 : 소형</p>
						<p>연료 : 디젤(경유)</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt5.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=5' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						<%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/thenewavante.png">
					<a href="/carinfo/thenewavante.jsp" class="reser-car-name">
							더 뉴 아반떼
					</a></td>
					<td class="car-detail">
						<p>차종 : 중형</p>
						<p>연료 : 휘발유</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt6.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=6' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						 <%
 }
 %>
					</td>
				</tr>

				<tr>
					<td><img src="/img/allnewavante.png">
					<a href="/carinfo/allnewavante.jsp" class="reser-car-name">
							올 뉴 아반떼
					</a></td>
					<td class="car-detail">
						<p>차종 : 중형</p>
						<p>연료 : 휘발유</p>
						<p>승차 인원 : 5</p></td>

					<td>
						<%
						if (cnt7.equals("0")) {
						%>
						<button type="submit" class="avail-btn"
							onclick="location='reserDateWrite.jsp?unq=7' ">예약하기</button>
						<%
 } else {
 %>
						<button type="button" class="unavail-btn">예약불가</button>
						 <%
 }
 %>
					</td>
				</tr>


			</table>
			<div class="review-link">
				<p>
					<span style="color:red;">*</span> 차량 이용 후기를 작성 및 확인하시려면 
					<a href="/review/reviewList.jsp">여기</a>를 눌러주세요.
					<span style="color:red;">*</span>
				</p>
			</div>
		</div>
	</div>



</body>
</html>