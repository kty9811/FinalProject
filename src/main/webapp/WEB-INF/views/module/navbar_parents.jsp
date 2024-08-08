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
		<a href="#"> <img
			src="${pageContext.request.contextPath }/resources/image/Logo5.png"
			alt="ABC's Logo" class="brand-image"
			style="height: 60px; border-radius: 50%; position: relative; left: 50px;">
		</a>
	</div>

	<ul class="navbar_menu">
		<li><a href="<%=request.getContextPath()%>/notice/list_parents"
			target="mainFrame" class="nav-link">공지사항</a></li>
		
		<li><a href="<%=request.getContextPath()%>/guestbook/list_parents"
			target="mainFrame" class="nav-link">방명록</a></li>
			
		<li class="nav-item"><a href="<%=request.getContextPath()%>/control/parents"
			target="mainFrame" class="nav-link">안심등원</a>
		</li>
	</ul>

	<div style="color: white; padding-right: 50px;">
		<button class="myinfo" onclick="location.href='<%=request.getContextPath()%>/parents/detail_parents?parents_id=${loginUser.parents_id}';">내정보</button>
		<button onclick="location.href='<%=request.getContextPath()%>/logout';" class="logoutbtn">로그아웃</button>
		&nbsp;&nbsp;&nbsp; ${loginUser.parents_name }&nbsp;&nbsp;
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
				src="${pageContext.request.contextPath }/resources/image/header01.png"
				alt="First slide">
		</div>
		<div class="carousel-item active">
			<img class="w-100"
				src="${pageContext.request.contextPath }/resources/image/header02.png"
				alt="Second slide">
		</div>
		<div class="carousel-item">
			<img class="w-100"
				src="${pageContext.request.contextPath }/resources/image/header03.png"
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


