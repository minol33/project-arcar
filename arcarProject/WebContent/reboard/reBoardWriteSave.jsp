<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="../include/dbcon.jsp" %>

<!-- 데이터 받기 설정 -->
<% 
String title = request.getParameter("title");
String content = request.getParameter("content");
String name = (String) session.getAttribute("arcar_name");
String pass = request.getParameter("pass");
%>

<!-- 데이터 유효성 체크 -->
<% 
if(title==null || pass == null || 
title.equals("") || pass.equals("")) {
%>
	<script>
	alert("암호를 입력해주세요.");
	location="reBoardWrite.jsp";
	</script>
<%
	return; // jsp 종료
}
%>
<%
String sql2 = "select ifnull(max(gid),0)+1 gid from reboard";
ResultSet rs = stmt.executeQuery(sql2);
int gid = 0;
if( rs.next() ){
	gid = rs.getInt("gid");
}
%>

<!-- 입력 SQL 작성/적용 --> 
<%
String sql = "insert into reboard"
		   + " (title,name,content,rdate,gid,thread,pass) "
		   + " values('"+title+"','"+name+"','"+content+"', now(),'"+gid+"','a','"+pass+"') ";

int result = stmt.executeUpdate(sql);
%>
<!-- 결과 메세지 출력 --> 

<%
if(result == 1) {
%>
	<script>
	alert("저장완료");
	location='reBoardList.jsp';
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%
}
%>






 




 
