<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/xhtml+xml;charset=utf-8" />
<title>ARCAR</title>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/nav.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/1333355d33.js"
	crossorigin="anonymous"></script>
<script src="/js/jquery-1.11.3.min.js"></script>
</head>
<script>

$(document).ready(function() {
    $(window).scroll( function(){
			
        $('.fadein').each( function(i){
            
            var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 5;
            var bottom_of_window = $(window).scrollTop() + $(window).height();
            
            if( bottom_of_window > bottom_of_element ){
            	$(this).animate({'opacity':'1','margin-left':'0px'},700);
            }
            
        }); 
    });
});

</script>

<body>

		<%@include file="/include/nav.jsp"%>

		<div class="jumbotron">
			<p>차가 필요한<br> 모든 순간, 아카</p>
		</div>

	<div class="container-main">
		<div class="contents">
			<div>
				<p class="fadein" id="bold">
					<span style="color: #0BB8FF">24시간</span> 언제나
				</p>
				<p class="fadein">한밤중이나 주말에도 스마트폰으로<br> 
				시간에 구애받지 않고<br>
				아카와 함께 이동하세요.</p>
				<img class="fadein" src="/img/arcar1.jpg">
			</div>
			<div>
				<p class="fadein" id="bold">
					<span style="color: #0BB8FF">원하는 곳</span>에서
				</p>
				<p class="fadein">내 주변 3분 거리 아카존에서<br>
				혹은 내가 있는 곳으로 아카를 불러<br> 
				어디서나 편하게 출발하세요.</p>
				<img class="fadein" src="/img/arcar2.jpg">
			</div>
			<div>
				<p class="fadein" id="bold">
					<span style="color: #0BB8FF">필요한 시간</span>만큼
				</p>
				<p class="fadein">간단한 장보기부터 주말여행까지<br> 
				원하는 만큼만 이용하세요.</p>
				<img class="fadein" src="/img/arcar3.jpg">
			</div>
			<div>
				<p class="fadein" id="bold">
					<span style="color: #0BB8FF">다양한 차종</span>을
				</p>
				<p class="fadein">연인과의 드라이브부터<br>
				가족 캠핑까지 상황에 맞게<br>
				차량을 선택해서 이용하세요.</p>
				<img class="fadein" src="/img/arcar4.jpg">
			</div>
		</div>


	</div>

</body>
</html>