<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 세션 변수 불러오기 + String 형 변환하기
String arcar_id = (String) session.getAttribute("arcar_id");
String arcar_name = (String) session.getAttribute("arcar_name");
String level = (String) session.getAttribute("arcar_level");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/nav.css?after">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/1333355d33.js"
	crossorigin="anonymous"></script>
<script src="/js/jquery-1.11.3.min.js"></script>
<title>sideBar</title>
</head>
<script>
	$(function(){
	    $(document).ready(function(){
	    	$('.toggle-btn').click(function(){
	    		$('.nav').fadeToggle('slow');
	    	});
	    });
	});

	function fn_logout() {
		location = "/member/logout.jsp";
	}

	// nav-scroll

	$(window).on('scroll', function() {
		if ($(window).scrollTop() > 150 && $(".nav").css("display") == "none") {
			$('.nav-header').addClass('nav-scroll');
			$('.main-logo').addClass('main-logo-scroll');
			$('.toggle-i').addClass('toggle-i-scroll');
			
		} else {
			$('.nav-header').removeClass('nav-scroll');
			$('.main-logo').removeClass('main-logo-scroll');
			$('.toggle-i').removeClass('toggle-i-scroll');
		}
	});
</script>


<body>

	<div class="container-nav">
		<div class="nav-header">
			<div>
				<a href="/index.jsp"><img class="main-logo" src="/img/arcar.png"></a>
			</div>
			<button type="button" class="toggle-btn">
				<i class="fa-solid fa-bars toggle-i"></i>
			</button>
		</div>
		<div class="nav nav-close">
			<div class="nav-sub">
				<div class="nav-login">
					<%
					if (arcar_id == null) {
					%>
					<a class="login-link" href="/member/login.jsp">로그인</a>
					<%
					} else if (level.equals("A")) {
					%>
					<div class="login-user">
						<a href="/member/memberModify.jsp?userid=<%=arcar_id%>"> 
							<i class="fa-solid fa-circle-user user-icon"></i>
						</a>
						<button type="button" onclick="fn_logout()" class="outbtn">
							<i class="fa-solid fa-arrow-right-from-bracket user-icon"></i>
						</button>
						<p><a href="/member/memberList.jsp"  class="login-user-tab">회원목록</a></p>
						<p><a href="/reservation/resStatusAdmin.jsp"  class="login-user-tab">회원예약목록</a></p>
					</div>
					<%
					} else {
					%>
					<div class="login-user">
						<a href="/member/memberModify.jsp?userid=<%=arcar_id%>"> 
							<i class="fa-solid fa-circle-user user-icon"></i>
						</a>
						<button type="button" onclick="fn_logout()" class="outbtn">
							<i class="fa-solid fa-arrow-right-from-bracket user-icon"></i>
						</button>
						<p><a href="/reservation/resStatus.jsp"  class="login-user-tab">예약현황</a></p>
					</div>
					<%
					}
					%>
				</div>
				
				
				<ul class="nav-menu">
					<li class="menu-link"><hr id="nav-hr"></li>	
					<li class="menu-link"><a href="/service/service.jsp">서비스안내</a></li>
					<li class="menu-link"><a href="/service/servicePrice.jsp">요금안내</a></li>
					<li class="menu-link"><hr id="nav-hr"></li>
					<li class="menu-link"><a href="/reservation/reservation.jsp">차량예약</a></li>
					<li class="menu-link"><a href="/review/reviewList.jsp">이용후기</a></li>
					<li class="menu-link"><a href="/reboard/reBoardList.jsp">문의사항</a></li>

				</ul>
			</div>
		</div>
	</div>


</body>
</html>