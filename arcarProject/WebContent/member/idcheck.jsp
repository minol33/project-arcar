<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/dbcon.jsp"%>

<%
String userid = request.getParameter("userid");
%>
<!-- ID 중복체크 -->
<%
String sql = " select count(*) cnt from memberinfo " + " where userid ='" + userid + "' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();

int cnt = rs.getInt("cnt");
String msg = "";
if (cnt == 0) {
	msg = "사용가능한 아이디 입니다.";
%>
<script>
	opener.frm.idButton.value = "2";
</script>
<%
} else {
msg = "이미 사용중인 아이디 입니다.";
%>
<script>
	opener.frm.idButton.value = "1";
</script>
<%
}
%>


<!-- 결과 출력 -->
<div style="width: 220px; height: 100px; text-align: center; margin-top: 10px;">
	<%=msg%>
	<button type="button" onclick="self.close()" style="margin-top: 5px;">닫기</button>
</div>

