<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file="/include/dbcon.jsp" %>

<!-- 데이터 받기 설정 -->
<% 
String unq = request.getParameter("unq");
String gid = request.getParameter("gid");
String thread = request.getParameter("thread");

String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");
%>

<!-- 데이터 유효성 체크 -->
<% 
if(title==null || pass == null || 
   title.equals("") || pass.equals("")) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location="/index.jsp";
	</script>
<%
	return; // jsp 종료
}
%>
<%
String sql2 = "select ifnull(max(thread),'a') thread2 from reboard "
            + "    where gid='"+gid+"' and length(thread)=length('a')+1 " ;
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
String maxThread = rs2.getString("thread2");
// a-> thread+a -> a:aa; ab:aba
// aa -> 앞a, 뒤a++
// aab -> 앞aa, 뒤b++
String myThread = "";
if( maxThread.equals("a")) {
	myThread = thread + "a"; // a->aa; ab->aba
} else {
	// max:ab a -> my:abb
	// String타입으로 불러오면 ++ 불가능
	char mx = maxThread.charAt(maxThread.length()-1);
    mx++; // a->b; b->c
    myThread = thread + mx;
}
%>
<!-- 입력 SQL 작성/적용 --> 
<%
String sql = "insert into reboard"
		   + " (title,pass,name,content,rdate,gid,thread) "
		   + " values('"+title+"','"+pass+"','"+name+"','"+content+"', now(),'"+gid+"','"+myThread+"') ";

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






 




 
