<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbcon.jsp" %>
<%
String unq = request.getParameter("unq");
String gid = request.getParameter("gid");
String thread = request.getParameter("thread");
String pass = request.getParameter("pass");

String sql = "select count(*) cnt from reboard"
           + "   where gid='"+gid+"'"
           + "      and thread like '"+thread+"_'";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
String sql2 = "";
String msg = "";

if( cnt > 0 ) { // 댓글이 있는 경우
	
	sql2 = "update reboard set "
	     + "     title='글쓴이에 의한 삭제', "
	     + "     content='' "
	     + "    where gid='"+gid+"' "
	     + "       and thread='"+thread+"' "
	     + "       and pass='"+pass+"'   ";
    
    msg = "댓글의 존재로 내용만 비웠습니다.";

} else { // 댓글이 없는 경우

	sql2 = " delete from reboard "
	     + "    where gid='"+gid+"' "
	     + "       and thread='"+thread+"' "
	     + "       and pass='"+pass+"' ";
   msg = "삭제완료";
}

int result = stmt.executeUpdate(sql2);
if( result > 0 ) {
%>
     <script>
     alert("<%=msg %>");
     location="reBoardList.jsp";
     </script>
<%
} else {
%>
     <script>
     alert("비밀번호를 확인해주세요");
     history.back();
     </script>
<%
}
%>