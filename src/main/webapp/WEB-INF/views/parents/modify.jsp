<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
	
</script>


<style>
body {
	background-color: #e7f3ff;
}

.btn-custom {
	background-color: rgb(52, 73, 94);
	border-color: #your-color;
	color: #fff;
}
</style>

<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->

	<!-- Main content -->
	<div class="content" style="width: 95%;">
		<div class="row" style="padding-top: 90px;">
			<!-- Left Section -->
			<div class="">
				<div class="leftsection"
					style="background-color: #e7f3ff; padding-left: 90px;">
					<div class="" style="background-color: #e7f3ff;">
						<div class="card"
							style="padding-top: 30px; padding-right: 50px; padding-left: 50px; width: 500px; height: 500px;">
							<div class="register-card-header d-flex"
								style="text-align: center;">
								<h1 style="font-size: 1.5em; font-weight: bold;">학부모 정보</h1>
							</div>
							<div class="register-card-body">
								<form role="form" class="modify-form"
									action="modify" method="post"
									enctype="multipart/form-data" onsubmit="return formSubmit();">

									<div class="form-group row">
										<label for="parents_name" class="col-sm-4" style="font-size: 0.9em;">
											이 름</label>
										<div class="col-sm-8 input-group-sm">
											<input class="form-control" name="parents_name" type="text"
												class="form-control" id="parents_name"
												value="${parents.parents_name }"
												onkeyup="this.value=this.value.trim();" />
										</div>

									</div>


									<div class="form-group row">
										<label for="parents_id" class="col-sm-4"
											style="font-size: 0.9em;"> 아이디</label>
										<div class="col-sm-8 input-group-sm">
											<input class="form-control" name="parents_id" type="text"
												class="form-control" id="parents_id"
												value="${parents.parents_id }"
												onkeyup="this.value=this.value.trim();" readonly />
										</div>
									</div>

									<div class="form-group row">
										<label for="parents_pwd" class="col-sm-4"
											style="font-size: 0.9em;"> 비밀번호</label>
										<div class="col-sm-8 input-group-sm">
											<input class="form-control" name="parents_pwd"
												type="password" id="parents_pwd"
												value="${parents.parents_pwd }"
												onclick="window.open('passwordmodify','상세보기', 'width=670, height=700');"
												readonly />
										</div>
									</div>


									<div class="form-group row">
										<label for="parents_relation" class="col-sm-4"
											style="font-size: 0.9em;"> 관계</label>
										<div class="col-sm-8 input-group-sm">
											<input class="form-control" name="parents_relation" class="form-control"
												id="parents_relation" value="${parents.parents_relation }">


										</div>

									</div>

									<div class="form-group row">
										<label for="parents_phone" class="col-sm-4"
											style="font-size: 0.9em;"> 전화번호</label>
										<div class="col-sm-8 input-group-sm">
											<input class="form-control" name="parents_phone"
												class="form-control" id="parents_phone"
												value="${parents.parents_phone }">


										</div>

									</div>

									<div class="card-footer" style="background-color: #ffffff;">


										
										<div class="row">
											<div class="col-sm-4 text-center">
												<!-- 수정 버튼 -->
												
												<button type="submit" id="modifyBtn" class="btn btn-primary"
													style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);">수정</button>
											</div>

											<div class="col-sm-4 text-center">
												<!-- 탈퇴 버튼 -->
												<button type="button"
													onclick="location.href='remove?parents_id=${parents.parents_id}';"
													id="deleteBtn" class="btn btn-danger">탈퇴</button>
											</div>

											<div class="col-sm-4 text-center">
												<button type="button" id="cancelBtn"
													onclick="window.close();" class="btn btn-default">취소</button>
											</div>

										</div>


									</div>
									<!-- Add other form fields here -->
								</form>
							</div>
							<!-- register-card-body -->
						</div>
					</div>
				</div>
			</div>
			<!-- /.Right Section -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content -->
</div>

<script>
	function openNewWindow(pageUrl) {
		window.open(pageUrl, '상세보기', 'width=550,height=250');
	}

	function formSubmit() {
		// 여기에서 필요한 검증 로직을 추가할 수 있습니다.
		// 검증에 실패하면 return false;를 하여 폼 제출을 중단합니다.

		// 검증이 완료되면 폼을 제출합니다.
		return true; // 이 부분이 폼 제출을 허용합니다.
	}
</script>
<!-- REQUIRED SCRIPTS -->
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
