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
									<h5>어린이 자율주행 통학버스 관제시스템</h5></a>
							</div>
					

							<div class="card"
								style="background-color: rgb(255, 255, 255, 0.2);">
								<div class="card-body login-card-body"
									style="background-color: rgb(255, 255, 255, 0.2);">
									<br />
									<p style="font-size: 25px;" class="login-box-msg">유치원 로그인</p>
		

							
									
									<br />
									<form action="login_kinder" method="post">
										<input type="hidden" name="retUrl" value="${param.retUrl}">
										<div class="input-group mb-3">
											<input type="text" name="employee_id" class="form-control"
												placeholder="아이디를 입력하세요.">
											<div class="input-group-append">
												<div class="input-group-text">
													<span class="fas fa-envelope"></span>
												</div>
											</div>
										</div>
										<div class="input-group mb-3">
											<input type="password" name="employee_pwd"
												class="form-control" placeholder="비밀번호를 입력하세요.">
											<div class="input-group-append">
												<div class="input-group-text">
													<span class="fas fa-lock"></span>
												</div>
											</div>
										</div>
										<br />

										<div class="row">


										

											<div class="col-12">
												<button type="submit" class="btn btn-primary btn-block"
													style="background-color: rgb(35, 55, 101); border-color: rgb(52, 73, 94);">로그인</button>
											</div>
											
											<div class="col-12" style="padding-top:20px;">
												<button type="button" class="btn btn-primary" onclick="history.go(-1);"
													style="background-color: rgb(35, 55, 101); border-color: rgb(52, 73, 94); width:320px;">뒤로가기</button>
											</div>

										</div>
									</form>


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