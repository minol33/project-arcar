<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- DB 연결 -->
<%@ include file="/include/dbcon.jsp"%>

<%
//세션 연결 확인
String arcar_id = (String) session.getAttribute("arcar_id");

if (arcar_id == null) {
%>
<script>
	alert("로그인 이후에 이용가능니다.");
	location = "/member/login.jsp";
</script>
<%
return;
}
%>

<!-- 불러오기 -->
<%
//정보 불러오기
String sql2 = " select name,mobile " + " from memberinfo " + " where userid = '" + arcar_id + "' ";
// 중복되지 않도록 sql 사용공간 생성
Statement stmt2 = conn.createStatement();

ResultSet rs2 = stmt2.executeQuery(sql2);

//줄내림(유효성체크)
rs2.next();

//정보 가져오기
String name = rs2.getString("name");
String mobile = rs2.getString("mobile");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/css/memberModify.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery/jquery-1.12.4.js"></script>
<script src="/js/jquery-ui.js"></script>
<script>
function fn_idcheck() {
	// ID값 받기
	// 팝업(idcheck.jsp)창으로 오픈
	var id = document.frm.userid.value;
	if( id.length < 4 || id.length > 12){
		alert("아이디는 4자~12자 사이로 입력해주세요.");
		return false;
	}
	var url = "idcheck.jsp?userid="+id;
	window.open(url,'popup','width=200,height=100'); // 팝업창을 띄우는 함수 (경로,별칭,크기)
}
function fn_submit() {

	var idButton = document.frm.idButton.value;
	if( idButton == 1 ){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	var userid = document.frm.userid.value;
	var len = userid.length;
	for(var i=0; i<len; i++){
		// 치환 replace(old,new)
		userid = userid.replace(" ","");
	}
	
	if( userid.length < 4 || userid.length > 12){
		alert("아이디를 다시 입력해 주세요.");
		document.frm.userid.focus();
		return false;
	}
	if(document.frm.pass.value == ""){
		alert("암호를 입력해 주세요.");
		document.frm.pass.focus();
		return false;
	}
	if(document.frm.name.value == ""){
		alert("이름을 입력해 주세요.");
		document.frm.name.focus();
		return false;
	}
	document.frm.submit(); // 전송
}

</script>

</head>
<body>

	<div class="user-info-container">
		<div>
			<a href="/index.jsp"><img class="logo" src="/img/arcar2.png"></a>
		</div>
		<div class="info-table">
			<form name="frm" method="post" action="/member/memberModifySave.jsp">
				<table>
					<caption>회원정보수정</caption>
					<tr>
						<th>User ID</th>
						<td><%=arcar_id%></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
					</tr>
					<tr>
						<th>name</th>
						<td><input type="text" name="name" value="<%=name%>"></td>
					</tr>
					<tr>
						<th>Phone Number</th>
						<td><input type="text" name="mobile" value="<%=mobile%>"></td>
					</tr>
				</table>
				<div class="info-table-margin">
					<span style="color: red;">* </span><span>비밀번호를 입력하셔야 수정이
						가능합니다.</span>
				</div>
				<div class="user-btn">
					<button type="submit" onclick="fn_submit(); return false;">저장</button>
					<button type="button" onclick="history.back()">취소</button>
				</div>
			</form>
		</div>

	</div>

</body>
</html>