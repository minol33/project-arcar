<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/dbcon.jsp"%>
<%
String unq = request.getParameter("unq");
String carname = request.getParameter("carname");

String sql = "select unq,carname from rescnt"; //unq,carname 값 불러오기

ResultSet rs = stmt.executeQuery(sql);
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" href="/css/reservation.css?after">
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-1.11.3.min.js"></script>
<script src="/js/jquery-ui.js"></script>

<script>

	function fn_submit() {
		if (document.frm.hiredate.value == "") {
			alert("출발일자를 입력해주세요.");
			document.frm.hiredate.focus();
			return false;
		}
		if (document.frm.hiredate2.value == "") {
			alert("반납일자를 입력해주세요.");
			document.frm.hiredate2.focus();
			return false;
		}
		if (document.frm.hiredate.value > document.frm.hiredate2.value) {
			alert("반납일이 출발일보다 늦습니다. 반납일을 다시 확인해주세요.");
			return false;
		}
		document.frm.submit();
	};
</script>
<script>	
var jb = jQuery.noConflict();
	jb(function() { //hiredate 함수
		jb("#hiredate").datepicker({
			changeMonth : true,
			changeYear : true
		});
		jb('#datepicker').datepicker('setDate', 'today'); 
	});
</script>
<script>
	jb(function() { //hiredate2 함수
		jb("#hiredate2").datepicker({
			changeMonth : true,
			changeYear : true
		});
		jb('#datepicker').datepicker('setDate', 'today'); 
	});
</script>
</head>
<body>

	<%@include file="/include/nav.jsp"%>

	<div class="head">
		<div class="head-title">
			<h2>차량예약</h2>
			<p>원하는 차량을 원하는 시간에! 지금 바로 예약하세요!</p>
		</div>
	</div>

	<div class="date-container">
		<div class="date-table">
			<form name="frm" method="post" action="reserWriteSave.jsp?unq=<%=unq%>">
				<!-- reserWriteSave로 unq값 기반으로 데이터 전송 -->
				<table>
					<tr class="date-table-title">
						<th>차량 이미지</th>
						<th>상세 내용</th>
					</tr>
					<tr>
						<%
					if (unq.equals("1")) {
					%>
						<td class="car-date-img"><img src="/img/spark.png"><p>스파크</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2"autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("2")) {
					%>
						<td class="car-date-img"><img src="/img/venue.png"><p>베뉴</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("3")) {
					%>
						<td class="car-date-img"><img src="/img/grandeur.png"><p>그랜저</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("4")) {
					%>
						<td class="car-date-img"><img src="/img/ioniq.png"><p>아이오닉</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("5")) {
					%>
						<td class="car-date-img"><img src="/img/clio.png"><p>클리오</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("6")) {
					%>
						<td class="car-date-img"><img src="/img/thenewavante.png"><p>더 뉴 아반떼</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					} else if (unq.equals("7")) {
					%>
						<td class="car-date-img"><img src="/img/allnewavante.png"><p>올 뉴 아반떼</p></td>
						<td class="car-date">
							<div class="car-date-input">
								<p>예약일 :</p> 
								<input type="hidden" name="unq" value="<%=unq%>">
								<input type="hidden" name="carname" value="<%=carname%>">
								<p><input type="text" name="hiredate" id="hiredate" autocomplete="off"><span> 부터</span>
								<input type="text" name="hiredate2" id="hiredate2" autocomplete="off"><span> 까지</span>
							</div>
						</td>
						<%
					}
					%>

					</tr>
					<tr>
						<td colspan="2">
							<div class="date-btn">
								<button type="submit" class="date-reser-btn"
									onclick="fn_submit();return false;">예약하기</button>
								<button type="button" class="date-cancel-btn"
									onclick="history.back()">취소</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	
	<%
	if (unq.equals("1")) {
	%>
	<%@include file="/carinfo/spark.jsp"%>
	<%
	} else if (unq.equals("2")) {
	%>
	<%@include file="/carinfo/venue.jsp"%>
	<%
	} else if (unq.equals("3")) {
	%>
	<%@include file="/carinfo/grandeur.jsp"%>
	<%
	} else if (unq.equals("4")) {
	%>
	<%@include file="/carinfo/ioniq.jsp"%>
	<%
	} else if (unq.equals("5")) {
	%>
	<%@include file="/carinfo/clio.jsp"%>
	<%
	} else if (unq.equals("6")) {
	%>
	<%@include file="/carinfo/thenewavante.jsp"%>
	<%
	} else if (unq.equals("7")) {
	%>
	<%@include file="/carinfo/allnewavante.jsp"%>
	<%
	}
	%>


</body>
</html>