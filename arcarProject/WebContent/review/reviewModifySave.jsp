<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>

<%
String unq = request.getParameter("unq");
String title = request.getParameter("title");
String name = request.getParameter("name");
String carn = request.getParameter("carn");
String pass = request.getParameter("pass");
String score = request.getParameter("score");
String content = request.getParameter("content");

String sql = " select count(*) cnt from reviewboard "
		   + "      where unq='"+unq+"' and pass='"+pass+"'";

ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt"); // 0 ; 1 
if ( cnt == 0 ) {
%>
		<script>
		alert("암호가 일치하지 않습니다.");
		history.back();
		</script>
<%
	return;   // jsp stop
}

String sql2 = " update reviewboard set "
			+ "		title='"+title+"',"
			+ "		carn='"+carn+"', "
			+" 		score='"+score+"', "
			+ "		content='"+content+"' "
			+ "	where "
			+ "		unq = '"+unq+"'";
// result = 1;
int result = stmt.executeUpdate(sql2);
if( result == 1 ) {
%>
		<script>
		alert("수정완료");
		location="reviewWrite.jsp";
		
		</script>
<%
} else {
%>
		<script>
		alert("수정실패");
		history.back();
		</script>
<%
}
%>












