<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<style>
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: rgb(45, 80, 113);
	padding: 8px 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-size: 18px;
}


body {
	margin: 0;
}

a {
	text-decoration: none;
	color: white;
}

.navbar_menu {
	list-style: none;
	display: flex;
	margin: 0;
	padding-left: 100px;
	flex-grow: 1;
}

.navbar_menu li {
	padding: 8px 30px;
}

.myinfo {
	color: white;
	height: 40px;
	width: 90px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.27);
	border: none;
	margin-right: 10px;
}

.logoutbtn {
	color: white;
	height: 40px;
	width: 90px;
	border-radius: 20px;
	background-color: rgba(255, 255, 255, 0.27);
	border: none;
}

.welcome {
	padding-right: 200px;
}
</style>

<nav class="navbar" style="position:absoulte; z-index:3;">
	<div class="navbar_logo">
		<a href="" style="font-size: 25px; padding-left: 60%;"><strong>ABC's</strong></a>

	</div>

	<ul class="navbar_menu">


	</ul>

	<div style="color: white; padding-right: 50px;">
		<button class="myinfo" onclick="location.href='login'">로그인</button>
		<button class="logoutbtn" onclick="location.href='regist'">회원가입</button>
		&nbsp;&nbsp;&nbsp; 로그인 해주세요&nbsp;&nbsp;
	</div>

</nav>


<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="position:absoulte; z-index:1;">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1" class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item">
			<img class="w-100"
				src="${pageContext.request.contextPath }/resources/image/head01.png"
				alt="First slide">
		</div>
		<div class="carousel-item active">
			<img class="w-100"
				src="${pageContext.request.contextPath }/resources/image/head02.png"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="w-100"
				src="${pageContext.request.contextPath }/resources/image/head03.png"
				alt="Third slide">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> 
		<span class="carousel-control-custom-icon" aria-hidden="true">
			<i class="fas fa-chevron-left"></i>
		</span>
		<span class="sr-only">
			Previous
		</span>
	</a>
	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="carousel-control-custom-icon" aria-hidden="true">
			<i class="fas fa-chevron-right"></i>
		</span>
		<span class="sr-only">
			Next
		</span>
	</a>
</div>


