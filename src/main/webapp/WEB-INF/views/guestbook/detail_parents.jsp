<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>


<style>
body {
	background-color: #e7f3ff;
}
</style>
<!-- <div class="col-md-6"> -->
<div class="card" style="width:95%; margin:0 auto">
	<div class="card-header" style="background-color: rgb(189, 215, 238);">
		<h3 class="card-title">방명록</h3>

		<div class="card-tools" >
			
		</div>
	</div>
	
		<div class="row">
			<div class="col-md-12">
				
					<div class="card-header" style="background-color: rgb(189, 215, 238);">
						<h3>상세보기</h3>
					</div>
					<!--end card-header  -->
					<div class="card-body" style="background-color: white;">
						<form role="form" method="post" action="modify.do"
							name="modifyForm">
							<input type="hidden" name="pno" value="${guestbook.pno }" />

							
							<div class="col-sm-12 row">
								<div class="form-group col-sm-4">
									<label for="gbwriter">작성자</label> <input type="text"
										class="form-control" id="gbwriter" value="${guestbook.gbwriter }"
										readonly />
								</div>

								<div class="form-group col-sm-4">
									<label for="gbregDate">작성일</label> <input type="text"
										class="form-control" id="gbregDate"
										value="<fmt:formatDate value="${guestbook.gbregDate }" pattern="yyyy-MM-dd" />"
										readonly />
								</div>
							</div>

							<div class="form-group col-sm-12">
								<label for="gbcontent">내 용</label>
								<div>${guestbook.gbcontent }</div>
							</div>
		
					</form>
					</div>

				</div>
				<!--end card-body  -->
				<!--end card-footer  -->
			</div>
			<!-- end card -->
		</div>
		<!-- end col-md-12 -->
				<div class="card-footer" style="background-color: #e7f3ff;">
					<button type="button" class="btn btn-warning" id="modifyBtn"
						onclick="location.href='modifyForm?pno=${guestbook.pno}';">수
						정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" id="removeBtn"
						onclick="location.href='remove?pno=${guestbook.pno}';">삭제</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn" id="cancelBtn" style="background-color: rgb(52, 73, 94); color: white;"
						onclick="CloseWindow();">취 소</button>
				</div>

<!-- end row -->

<!-- /.card-body -->
<!-- /.card -->
<!-- </div> -->

<script>
	var dataNum = 0;

	var div = $('<div>').addClass("inputRow").attr("data-no", dataNum);
	var input = $('<input>').attr({
		"type" : "file",
		"name" : "uploadFile",
		"onchange" : "fileChange_go(" + dataNum + ");"
	}).css("display", "inline");
	div
			.append(input)
			.append(
					"<button onclick='remove_go("
							+ dataNum
							+ ");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
	dataNum++;

	function modify_submit() {
		//alert("submit btn");
		let form = $('form[name="modifyForm"]');

		//유효성 체크
		if ($("input[name='title']").val() == "") {
			alert(input.name + "은 필수입니다.");
			$("input[name='title']").focus();
			return;
		}

		form.submit();

	}

	function remove_go(dataNum) {
		let div = $('div[data-no="' + dataNum + '"]');
		div.remove();
	}
</script>



<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>