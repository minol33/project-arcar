<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file = "/include/dbcon.jsp" %>
<!-- 데이터 받기 -->
<%
String userid = (String)session.getAttribute("arcar_id");

String pass = request.getParameter("pass");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
%>

<%
if(userid == null || name == null ||
	userid.equals("") || name.equals("") ){
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "/index.jsp";
	</script>
<%
	return; // jsp종료
}

userid = userid.trim();  // trim : 앞뒤 공백제거
name = name.trim();

String sql = " select count(*) cnt from memberinfo "
		+ " where userid='"+userid+"' and pass='"+pass+"' ";

ResultSet rs = stmt.executeQuery(sql);
int cnt = 0; //cnt 초기 0 설정



if(rs.next()){
cnt = rs.getInt("cnt"); // 비밀번호까지 일치한다면 cnt 값 증가
}
int result = 0;
if( cnt == 1 ){
%>
<!-- 저장처리 -->
<%  // cnt 값이 증가했을때 sql 
String sql2 = "UPDATE  memberinfo "
		+ "	  SET "
		+ "		name='"+name+"',"
		+ "		mobile='"+mobile+"'"
		+ "	  WHERE "
		+ "		userid='"+userid+"'  ";

 result = stmt.executeUpdate(sql2);
} else { // 비밀번호가 틀려서 cnt가 0일때
%>
	<script>
	alert("암호가 일치하지 않습니다.");
	history.back();
	</script>
<%
	return;
}
%>

<!-- 결과 안내창 -->
<%
if(result == 1){
%>
	<script>
	alert("수정 완료.");
	location = "/index.jsp";
	// == location="http://localhost:8080/index.jsp";
	// == location="/index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("수정 실패.");
	history.back();
	</script>
<%
}
%>