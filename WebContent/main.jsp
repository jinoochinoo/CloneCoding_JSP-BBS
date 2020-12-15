<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- 화면 최적화 -->
<meta name="viewport" content="width=device-width">
<!-- 부트스트랩 파일 참조 -->
<link rel="stylesheet" href="css/bootstrap.css">
<!--  css 파일 참조 -->
<link rel="stylesheet" href="css/custom.css">
<title>JINWOO JSP BBS</title>
</head>
<body>
	<nav class="navbar navbar-default"><!-- 네비게이션 영역 -->
		<div class="navbar-header"><!-- 네비게이션 상단 -->
	
			<!-- 네비게이션 상단 클릭 버튼 -->
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-ex-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- 메뉴 추가, 하이퍼링크 등록 -->
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		<!-- 제목 옆 메뉴 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>		
			<!-- 헤더 우측에 표시할 드랍다운 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<!-- 드랍다운 아이템 영역 -->	
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!-- 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1 style="text-align: center;">JSP 게시판 소개</h1>
				<p> 포트폴리오용 JSP 게시판입니다. DB 연결은 MYSQL, JDBC 이용해서 제작했습니다.
						디자인 템플릿은 부트스트랩을 사용했고, javascript·css 부분은 인터넷에서 상당 부분 참고했습니다.
						게시판 구현에 필요한 로직을 이해하고 익히기에 좋은 시간이었습니다. 감사합니다.</p>
				<a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a>
			</div>
		</div>
	</div>
	<!-- 메인 페이지 이미지 -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ul class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="2" ></li>
				<li data-target="#myCarousel" data-slide-to="3" ></li>
			</ul>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg">
				</div>
				<div class="item">
					<img src="images/2.jpg">
				</div>
				<div class="item">
					<img src="images/3.jpg">
				</div>
			</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
		</div>
	</div>	
	<!-- 메인 페이지 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>