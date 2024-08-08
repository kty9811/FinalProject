<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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
		style="padding-center: 650px; padding-top: 160px;">
		<div class="form-group row" style="max-width: 600px;">
			<div class="card">
				<label for="name" class=""
					style="font-size: 2em; width: 500px; padding-left: 230px; padding-top: 50px;">회원가입</label>
				<div class="register-card-body" style="width: 600px;">
					<br />
					<form role="form" class="regist-form" action="regist" method="post"
						enctype="multipart/form-data">
						<!-- Name Input -->
						<div class="form-group row">
							<label for="parents_name" class="col-sm-3" style="font-size: 1.2em;">이
								름</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="parents_name" type="text" id="parents_name" autocomplete="parents_name"
									placeholder="이름을 입력하세요" />
							</div>
						</div>
						<!-- ID Input -->
						<div class="form-group row">
							<label for="parents_id" class="col-sm-3" style="font-size: 1.2em;">아이디</label>
							<div class="col-sm-6 input-group-sm">
								<input name="parents_id" type="text" class="form-control" id="parents_id" autocomplete="parents_id"
									placeholder="13글자 영문자,숫자 조합" />
							</div>
							<div class="col-sm-3" style="padding-left: 30px;">
								<button type="button" onclick="idCheck_go();"
									class="btn btn-info btn-sm btn-custom" style="font-size: 15px;">중복확인</button>
							</div>
						</div>
						<!-- Password Input -->
						<div class="form-group row">
							<label for="parents_pwd" class="col-sm-3" style="font-size: 1.2em;">비밀번호</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="parents_pwd" type="password" id="parents_pwd" autocomplete="parents_pwd"
									placeholder="20글자 영문자,숫자,특수문자 조합"
									onkeyup="checkPasswordMatch();" />
							</div>
						</div>
						<!-- Password Confirmation Input -->
						<div class="form-group row">
							<label for="parents_pwd2" class="col-sm-3" style="font-size: 1.2em;">비밀번호
								확인</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="parents_pwd2" type="password" autocomplete="parents_pwd2"
									id="parents_pwd2" placeholder="같은 비밀번호를 입력하세요"
									onkeyup="checkPasswordMatch();" />
							</div>
						</div>
						<!-- Password Match Message -->
						<div class="form-group row" id="passwordMatchMsg"
							style="display: none;">
							<div class="col-sm-9 offset-sm-3">
								<p id="passwordMatchText" style="color: red;"></p>
							</div>
						</div>
						<!-- Relationship Input -->
						<div class="form-group row">
							<label for="parents_relation" class="col-sm-3"
								style="font-size: 1.2em;">관계</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="parents_relation" type="text" autocomplete="parents_relation"
									id="parents_relation" placeholder="원생과의 관계를 입력하세요" />
							</div>
						</div>
						<!-- Phone Number Input -->
						<input type="hidden" name="parents_phone" id="parents_phone" value="" />
						<div class="form-group row">
							<label for="phone1" class="col-sm-3 control-label"
								style="font-size: 1.2em;">전화번호</label>
							<div class="col-sm-9">
								<div class="input-group-sm">
									<input style="width: 90px;" name="phone1" id="phone1" 
										type="text" class="form-control float-left" value="010" /> <label
										class="float-left" style="padding: 0; text-align: center;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
									<input style="width: 87px;" name="phone2" id="phone2"
										type="text" class="form-control float-left" /> <label
										class="float-left" style="padding: 0; text-align: center;">&nbsp;&nbsp;-&nbsp;&nbsp;</label>
									<input style="width: 87px;" name="phone3" id="phone3"
										type="text" class="form-control float-left" />
								</div>
							</div>
						</div>

						<br />
						<!-- Submit Buttons -->
						<div class="card-footer" style="background-color: #ffffff;">
							<div class="row">
								<div class="col-sm-6">
									<button type="submit" id="registBtn" onclick="regist_go();"
										class="btn btn-custom">등&nbsp;&nbsp;록</button>
								</div>
								<div class="col-sm-6">
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
    // Check ID is already used
    var checkedID = null;

    function idCheck_go() {
        let parents_id = $('#parents_id').val();
        if (!parents_id) {
            alert("아이디를 작성하세요.");
            $('#parents_id').focus();
            return;
        }
        $.ajax({
            url: "idCheck?parents_id=" + parents_id,
            method: "get",
            success: function (result) {
                if (result === "duplicated") {
                    alert("중복된 아이디 입니다.");
                    $('#parents_id').focus();
                } else {
                    alert("사용가능한 아이디 입니다.");
                    checkedID = parents_id;
                }
            }
        });
    }

    // Check if passwords match
    function checkPasswordMatch() {
        var password = $('#parents_pwd').val();
        var confirmPassword = $('#parents_pwd2').val();
        var messageDiv = $('#passwordMatchMsg');
        var messageText = $('#passwordMatchText');

        if (password === confirmPassword) {
            messageText.text("비밀번호가 동일합니다.");
            messageText.css('color', 'green');
        } else {
            messageText.text("비밀번호가 다릅니다.");
            messageText.css('color', 'red');
        }
        messageDiv.show();
    }

    function regist_go() {
        var parents_id = $('#parents_id').val();
        var parents_pwd = $('#parents_pwd').val();
        var parents_pwd2 = $('#parents_pwd2').val();
        var parents_name = $('#parents_name').val();
        var phone1 = $('#phone1').val();
        var phone2 = $('#phone2').val();
        var phone3 = $('#phone3').val();
        var parents_relation = $('#parents_relation').val();
        var parents_phone = phone1 + "-" + phone2 + "-" + phone3;

        
        if (!parents_name) {
            alert("이름은 필수입니다.");
            return;
        }
        if (!parents_id || parents_id !== checkedID) {
            alert("아이디 중복 확인이 필요합니다.");
            return;
        }
        if (!parents_pwd) {
            alert("패스워드는 필수입니다.");
            return;
        }
        if (parents_pwd !== parents_pwd2) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
       
        if (!phone1 || !phone2 || !phone3) {
            alert("전화번호를 모두 입력하세요.");
            return;
        }

        // 전화번호 전체 문자열 생성
        var phoneTemp = phone1 + "-" + phone2 + "-" + phone3;

        
    }
    $('.regist-form').on('submit', function(e) {
        // 폼 기본 제출 동작을 방지합니다.
        e.preventDefault();

        // 전화번호 입력 필드의 값을 읽어 하나의 문자열로 결합합니다.
        var phone = $('#phone1').val() + '-' + $('#phone2').val() + '-' + $('#phone3').val();

        // 결합된 전화번호 값을 숨겨진 필드에 설정합니다.
        $('#parents_phone').val(phone);

        // 수정된 데이터로 폼을 제출합니다.
        this.submit();
    });

</script>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
