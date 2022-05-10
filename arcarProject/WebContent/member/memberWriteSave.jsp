<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 연결 -->
<%@ include file = "/include/dbcon.jsp" %>
<!-- 전송 데이터 세팅 -->
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
%>
<!-- ID / PASS / 이름 유효성 체크 -->
<%
if(userid == null || pass == null || name == null ||
	userid.equals("") || pass.equals("") || name.equals("")){
%>
	<script>
	alert("잘못된 접근입니다.")
	location = "/member/memberWrite.jsp"
	</script>
<%
	return; //jsp 종료
}

userid = userid.trim(); // trim : 앞뒤 공백 제거
pass = pass.trim();
name = name.trim();

int len = userid.length();
if( len < 4 || len > 12){
%>
	<script>
	alert("아이디는 4자 ~ 12자 사이로 입력해주세요.");
	history.back();
	</script>
<%	
	return;
}
%>


<!-- ID 중복체크 -->
<%
String sql = " select count(*) cnt from memberinfo "
		   + " where userid='"+userid+"' ";
ResultSet rs = stmt.executeQuery(sql);
rs.next();
int cnt = rs.getInt("cnt");
if(cnt == 1){
%>
	<script>
	alert("이미 사용중인 아이디입니다.");
	history.back();
	</script>
<%
	return;
}
%>


<!-- 저장 처리 -->
<%
String sql2 = " insert into memberinfo "
		   + " (userid,pass,name,mobile,rdate) "
		   + " values('"+userid+"', "
		   + " '"+pass+"', "
		   + " '"+name+"', "
		   + " '"+mobile+"', "
		   + " now() "
		   + " ); ";

int result = stmt.executeUpdate(sql2);
%>
<!-- 결과 메세지 출력 -->
<%
if(result == 1){
%>
	<script>
	alert("가입 완료");
	location = "/index.jsp";
	// == location="http://localhost:8080/index.jsp";
	// == location="/index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("가입 실패");
	history.back();
	</script>
<%
}
%>