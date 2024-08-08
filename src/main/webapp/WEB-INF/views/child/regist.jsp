<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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


	<section class="regist"
		style="padding-left: 20%; padding-right: 20%; padding-top: 15%;">
		<div class="" style="background-color: #e7f3ff;">
			<div class="card">
				<label for="name" class="name"
					style="font-size: 1.5em; width: 500px; padding-left: 140px; padding-top: 50px;">원생등록</label>
				<div class="register-card-body">
					<form role="form" class="regist-form" action="regist" method="post"
						enctype="multipart/form-data">
						<div class="input-group mb-3">
							<div class="manPicture" data-id="${child.child_picture }" id="pictureView"
									style="border: 1px solid black; height: 200px; width: 140px; margin: 0 auto; margin-bottom: 5px;"></div>
							<div class="mailbox-attachment-info"
								style="width: 100%; background-color: #ffffff;">
								<div class="input-group input-group-sm">
									<label for="inputFile"
										class="btn btn-custom btn-sm btn-flat input-group-addon">파일선택</label>
									<input id="inputFileName" class="form-control" type="text"
										name="tempPicture" disabled
										value="${child.child_picture.split('\\$\\$')[1]}" />
										<input type="file"
										id="inputFile" name="child_picture" style="display: none;"
										onchange="picture_go();" />
								</div>
							</div>
							<br />
						</div>
						<div class="form-group row">
							<input type="hidden" name="parents_id" id="child_id" value="${parents_id}" />
						</div>

						<div class="form-group row">
							<label for="child_name" class="col-sm-3" style="font-size: 0.9em;">
								이 름</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="child_name" type="text"
									id="child_name" placeholder="이름을 입력하세요"
									onkeyup="this.value=this.value.trim();" />
							</div>
						</div>

						<div class="form-group row">
							<label for="child_birth" class="col-sm-3" style="font-size: 0.9em;">
								생년월일</label>
							<div class="col-sm-9 input-group-sm">
								<input class="form-control" name="child_birth" type="date"
									id="child_birth" max="2050-12-31" min="2016-01-01">
							</div>

						</div>
						
						<div class="card-footer" style="background-color: #ffffff;">
							<div class="row">
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go();" class="btn btn-custom">등&nbsp;&nbsp;록</button>
								</div>

								<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="CloseWindow();"
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
function picture_go() {
	let inputFile = $('input#inputFile')[0].files[0];
	let fileFormat = inputFile.name.substr(
			inputFile.name.lastIndexOf(".") + 1).toUpperCase();

	//이미지 확장자 jpg 확인
	if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	}

	//이미지 파일 용량 체크
	if (inputFile.size > 1024 * 1024 * 1) {
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	}
	;

	$('#inputFileName').val(inputFile.name);

	//미리보기
	if (inputFile) {
		var reader = new FileReader();
		let pictureView = $('div#pictureView')[0];

		reader.onload = function(e) {
			//이미지 미리보기
			pictureView.style.backgroundImage = "url(" + e.target.result
					+ ")";
			pictureView.style.backgroundPosition = "center";
			pictureView.style.backgroundSize = "cover";
			pictureView.style.backgroundRepeat = "no-repeat";
		}
		reader.readAsDataURL(inputFile);
	}
}

function regist_go(){
	if(!$('input[name="child_picture"]').val()){
		 alert("사진은 필수입니다.");
		 $('input[name="child_picture"]').click();
		 return;
	}
	
	
	if(!$('input[name="child_name"]').val()){
       alert("이름은 필수입니다.");
       return;
    }
	if(!$('input[name="child_birth"]').val()){
	   alert("생년월일은 필수입니다.");
	   return;
	}
    
	var form = $('form[role="form"]');
	form.submit();
}
</script>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>