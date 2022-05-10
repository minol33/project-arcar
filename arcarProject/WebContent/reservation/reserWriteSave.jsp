<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/include/dbcon.jsp"%>
<%
// 세션 변수 불러오기 + String 형 변환하기
String arcar_id3 = (String) session.getAttribute("arcar_id");
String arcar_name3 = (String) session.getAttribute("arcar_name");
%>
<%
String unq = request.getParameter("unq"); //reservation2에서 unq값 불러오기

String sql2 = "select carname from rescnt where unq='"+unq+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
String carname = rs2.getString("carname"); //unq값에 기반한 carname값 불러오기

String hiredate = request.getParameter("hiredate");


String hiredate2 = request.getParameter("hiredate2");


//데이터베이스에 불러온 unq값 경로에 cnt 1, hiredate1,2, 예약자 이름 업데이트
String sql = " update rescnt set "
           + " cnt = 1 , "
           + " hiredate = '"+hiredate+"', "
           + " hiredate2 = '"+hiredate2+"', "
           + " user = '"+arcar_name3+"', "
           + " id = '"+arcar_id3+"' "
           + " where unq = '"+unq+"' "; 
			

int result = stmt.executeUpdate(sql);

if( result == 1 ) {
%>
		<script>
		alert("<%=hiredate%> 부터 <%=hiredate2%> 까지 \n <%=carname%>의 예약이 완료되었습니다.");
		location = "reservation.jsp";
		</script>
<%
  return;
} else {
%>
		<script>
		alert("의 예약이 실패되었습니다.");
		history.back();  // 이전화면으로 이동
		</script>
<%
}
%>


