<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<style>
body, html {
    height: 100%;
    margin: 0;
}

.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
}

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
	<section class="regist"
		style="padding-center: 650px; padding-top: 30px;">
		<div class="form-group row" style="width: auto;">
			<div class="card">
				<label for="name" class=""
					style="font-size: 2em; width: auto; padding-left: 10px; padding-top: 30px;">교사 수정</label>
				<div class="register-card-body" style="width: auto;">
					<br />
					<form role="form" class="modify-form" action="modify" method="post">
						<!-- Name Input -->
						<div class="form-group row" style="width:150px;">
							<label for="employee_name" class="col-sm-3" style="font-size: 1.2em;">이름</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="employee_name" type="text" id="employee_name" autocomplete="employee_name"
										value="${employee.employee_name }"/>
							</div>
						</div>
						<!-- ID Input -->
						<div class="form-group row">
							<label for="employee_id" class="col-sm-3" style="font-size: 1.2em;">아이디</label>
							<div class="col-6 input-group-sm">
								<input name="employee_id" type="text" class="form-control" id="employee_id" autocomplete="employee_id"
									value="${employee.employee_id }" style="width:200px;"/>
							</div>
						</div>
						<!-- Password Input -->
						<div class="form-group row">
							<label for="employee_pwd" class="col-sm-3" style="font-size: 1.2em;">비밀번호</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="employee_pwd" type="password" id="employee_pwd" autocomplete="employee_pwd"
									placeholder="비밀번호를 입력하세요." value="${employee.employee_pwd }" style="width:200px;"/>
							</div>
						</div>
						
						<!-- Phone Number Input -->
						<input type="hidden" name="employee_phone" id="employee_phone" value="" />
						<div class="form-group row">
							<label for="phone1" class="col-sm-3 control-label"
								style="font-size: 1.2em;">전화번호</label>
							<div class="col-sm-9">
								<div class="input-group-sm"> 
									<input type="hidden" name="employee_phone1" id="employee_phone1" value="${employee.employee_phone }">
									<input style="width: 90px;" name="phone1" id="phone1" type="text" class="form-control float-left" value="010" />
										<label class="float-left" style="padding: 0; text-align: center;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
										
									<input style="width: 87px;" name="phone2" id="phone2" type="text" class="form-control float-left" value="${employee.employee_phone.substring(4,8)}" />
										<label class="float-left" style="padding: 0; text-align: center;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
										
									<input style="width: 87px;" name="phone3" id="phone3" type="text" class="form-control float-left" value="${employee.employee_phone.substring(9,13)}" />
									
									<input type="hidden" name="employee_phone" id="employee_phone" value="" />	
								</div>
							</div>
						</div>

						<br />
						<!-- Submit Buttons -->
						<div class="card-footer" style="background-color: #ffffff;">
							<div class="row">
								<div class="col-6">
									<button type="submit" id="registBtn" onclick="modify_go"
										class="btn btn-custom">수&nbsp;&nbsp;정</button>
								</div>
								<div class="col-6">
									<button type="button" id="cancelBtn" onclick="history.go(-1);"
										class="btn btn-default float-right">취 &nbsp;&nbsp;소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- register-card-body -->
			</div>
		</div>
	</section>
</div>
<!-- ./wrapper -->
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>
<!-- REQUIRED SCRIPTS -->
<script>

function modify_go(){
	 var employee_id = $('#employee_id').val();
     var employee_pwd = $('#employee_pwd').val();
     var employee_name = $('#employee_name').val();
     var phone1 = $('#phone1').val();
     var phone2 = $('#phone2').val();
     var phone3 = $('#phone3').val();
     var employee_phone = phone1 + "-" + phone2 + "-" + phone3;

     
     var phoneTemp = phone1 + "-" + phone2 + "-" + phone3;
}


$('.modify-form').on('submit', function(e) {

    var phone = $('#phone1').val() + '-' + $('#phone2').val() + '-' + $('#phone3').val();

    $('#employee_phone').val(phone);

    this.submit();
});

function phone_second(){
	var employee_phone = $('#employee_phone').val().str.substr(5,8);
	var phone2 = employee_phone;
	
}

</script>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
