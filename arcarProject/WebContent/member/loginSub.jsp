<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import = "conn.Cookies" %>
 --%>
<!-- DB 연결 -->
<%@ include file = "/include/dbcon.jsp" %>

<!-- 데이터 받아오기 -->
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String cookieId = request.getParameter("saveid");
//쿠키 발생(아이디 쿠키저장)

Cookie cookie = new Cookie("userId", userid);// 일단 쿠키 생성

System.out.println(cookieId);
if (cookieId != null) { // 체크박스 체크여부에 따라 쿠키 저장 확인
	// 체크박스 체크 되었을 때
	// 쿠키 저장
	response.addCookie(cookie);
} else {
	// 체크박스 체크 해제되었을 때
	// 쿠키 유효시간 0으로 해서 브라우저에서 삭제
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}


String sql = " select count(*) cnt from memberinfo "
		   + " where userid = '"+userid+"' and pass = '"+pass+"' ";
//실행
ResultSet rs = stmt.executeQuery(sql);


// 유효성 체크하기(줄내림)
rs.next();

//위 sql에서 cnt 값 받기
int cnt = rs.getInt("cnt");



if( cnt == 0 ){  // 0 == 일치정보 없음.
%>
	<script>
	alert("일치하는 정보가 없습니다.");
	history.back();
	</script>
<%
	return;
}

String sql2 = " select name,level from memberinfo "
		+ " where userid = '"+userid+"' ";

//ResultSet 이 위에 있기때문에 새로운 공간 생성(stmt2)
Statement stmt2 = conn.createStatement();

ResultSet rs2 = stmt2.executeQuery(sql2);
rs2.next();

String name = rs2.getString("name");
String level = rs2.getString("level");


	//인증처리 = 세션변수 생성하기
session.setAttribute("arcar_id",userid);
session.setAttribute("arcar_name",name);
session.setAttribute("arcar_level",level);
%>

		<script>
		alert("<%=name%> 님 환영합니다. ");
		location = "/index.jsp";
		</script>



