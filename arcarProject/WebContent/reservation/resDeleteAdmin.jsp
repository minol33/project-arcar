<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/include/dbcon.jsp" %>
<%
// 세션 변수 불러오기 + String 형 변환하기
String delId = (String) session.getAttribute("arcar_id");
String delName = (String) session.getAttribute("arcar_name");
// 취소버튼 누를 때 unq 값 받기
String value = request.getParameter("unq");
%>

<%
if( delId == null){
%>
	<script>
	alert("로그인 후에 사용 가능합니다.");
	location="/member/login.jsp"
	</script>
<%
	return;
}

		 String sql2 = " update rescnt set "
		             + " cnt = '0', "
		             + " hiredate = null, "
		             + " hiredate2 = null, "
	         		 + " user = '', "
		             + " id = '' "
		             + " where unq = '"+value+"' ";
        
        int result = stmt.executeUpdate(sql2);
		%>
		<%
		if(result == 1){
			%>
		<script>
			alert("취소가 완료되었습니다.");
			location="/reservation/resStatusAdmin.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		alert("취소 실패");
		history.back();
		</script>
	<%
	}
	%>


