<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbcon.jsp" %>

<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
%>
<%
if(pass == null || pass.equals("") ){
%>
	<script>
	alert("잘못된 접근방식입니다.")
	location="/"
	</script>
<%	
	return;
}
%>

<%
String sql=" delete from memberinfo where userid='"+userid+"' and pass='"+pass+"'";
//result=1;
int result = stmt.executeUpdate(sql);
%>
<!-- 메세지 출력 후 목록으로 이동 -->
<%
if(result==1){
%>
	<script>
	alert("삭제완료");
	location="memberList.jsp"
	</script>
<%
}else{
%>
	<script>
	alert("삭제실패");
	history.back
	</script>
<%
}
%>