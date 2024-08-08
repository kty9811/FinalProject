<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<style>
body {
	background-color: #e7f3ff; /* 백그라운드 색상 변경 */
}



.btn-custom {
	background-color: rgb(52, 73, 94); /* 원하는 배경색을 설정합니다. */
	border-color: #your-color; /* 원하는 테두리 색상을 설정합니다. */
	color: #fff; /* 버튼 텍스트 색상을 설정합니다. */
}
</style>


<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->

	<!-- Main content -->

	<section class="content register-page"
		style="background-color: #e7f3ff;">
		<div class="" style="background-color: #e7f3ff;">
			<div class="card"
				style="padding-top: 30px; padding-right: 50px; padding-bottom: 0px; padding-left: 50px;">
				<div class="register-card-header" style="text-align: center;">
					<h1 style="font-size: 1.5em; font-weight: bold;">교사 정보</h1>
				</div>
				<div class="register-card-body">
					<form role="form" class="regist-form" action="regist" method="post"
						enctype="multipart/form-data">



						<div class="form-group row">
							<label for="name" class="col-sm-4" style="font-size: 0.9em;">
								아이디</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="name" type="text"
									class="form-control" id="name" value="${employee.employee_id }" readonly
									onkeyup="this.value=this.value.trim();" />
							</div>

						</div>

						<div class="form-group row">
							<label for="password" class="col-sm-4" style="font-size: 0.9em;">
								비밀번호</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="password" id="password"
									type="password" value="${employee.employee_pwd }" readonly>
							</div>
						</div>

						<div class="form-group row">
							<label for="date" class="col-sm-4" style="font-size: 0.9em;">
								이름</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="name" class="form-control"
									id="date" value="${employee.employee_name }" readonly>


							</div>

						</div>

						<div class="form-group row">
							<label for="date" class="col-sm-4" style="font-size: 0.9em;">
								전화번호</label>
							<div class="col-sm-8 input-group-sm">
								<input class="form-control" name="name" class="form-control"
									id="date" value="${employee.employee_phone }" readonly>


							</div>

						</div>



						<div class="card-footer" style="background-color: #ffffff;">


							<div class="row">
								<div class="col-6 text-center">

									<button type="button"
										onclick="location.href='modify?employee_id=${employee.employee_id}';" id="modifyBtn"
										class="btn btn-primary" style="background-color: rgb(52,73,94); border-color:rgb(52,73,94);">수&nbsp;&nbsp;정</button>
								</div>

								<div class="col-6 text-center">

									<button type="button"
										onclick="location.href='remove?employee_id=${employee.employee_id}';"
										id="deleteBtn" class="btn btn-danger float-right">삭&nbsp;&nbsp;제</button>

								</div>

							</div>
						</div>
					</form>
				</div>
				<!-- register-card-body -->
			</div>
		</div>
	</section>

	<script>
    function OpenWindow(url, title, w, h) {
        // 팝업 창을 가운데 위치시키기 위한 좌표 계산
        var left = (screen.width/1)-(w/1);
        var top = (screen.height/1)-(h/1);
        return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    }
</script>


</div>
<!-- ./wrapper -->


<!-- REQUIRED SCRIPTS -->




<%@ include file="/WEB-INF/views/module/footer.jsp"%>
