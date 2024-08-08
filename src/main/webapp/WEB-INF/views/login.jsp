<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<div class="wrapper">
	<div>
		<div class="content" style="width: 100%; height: 940px;">
			<img
				src="${pageContext.request.contextPath}/resources/image/login.png"
				style="width: 100%; height: 100%; position: absolute; z-index: 5;">
			<br /> <br /> <br /> <br />

			<div class="container-fluid" style="position: absolute; z-index: 10;">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-7" style="height: 700px;"></div>
					<div class="col-md-4" style="height: 700px;">
						<br /> <br /> <br /> <br />
						<div class="login-box" style="margin: 0 0 0 110px;">
							<div class="login-logo">
								<b>ABC's</b><br />
								<h5>어린이 자율주행 통학버스 관제시스템</h5>
								</a>
							</div>
							<br />
							<br />


							<div class="card"
								style="background-color: rgb(255, 255, 255, 0.2);">
								<div class="card-body login-card-body"
									style="background-color: rgb(255, 255, 255, 0.2);  height: 200px;">




									<div style="justify-content: space-between; text-align: center;" class="">
										
											<button type="button" onclick="location.href='login_parents'"
												class="btn btn-primary btn-block"
												style="background-color: rgb(57, 107, 159); border-color: rgb(57, 107, 159); width: 50%; height: 40px; display: inline-block; margin-top: 8px;">학부모
												로그인</button>
										
											<button type="button" onclick="location.href='login_teacher'"
												class="btn btn-primary btn-block"
												style="background-color: rgb(196, 67, 53); border-color: rgb(196, 67, 53); width: 50%; height: 40px; display: inline-block;">교사
												로그인</button>
										
											<button type="button" onclick="location.href='login_kinder'"
												class="btn btn-primary btn-block"
												style="background-color: rgb(218, 179, 24); border-color: rgb(218, 179, 24); width: 50%; height: 40px; display: inline-block;">유치원
												로그인</button>
										
									</div>
									<br />



									<div class="social-auth-links text-center mb-3">
										<p>&nbsp;</p>

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>