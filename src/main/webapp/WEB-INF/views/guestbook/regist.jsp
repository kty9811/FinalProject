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
<div class="card" style="width: 95%; margin: 0 auto">
	<div class="card-header"  style="background-color: rgb(189, 215, 238);">
		
				<h1>방명록</h1>
				<div class="card-tools"style="background-color: #e7f3ff;" >
			</div>

		</div>


		
				<div class="row">
					<div class="col-md-12">
					
							<div class="card-header"  style="background-color: rgb(189, 215, 238);">
								<h4>글등록</h4>
							</div>
							<!--end card-header  -->
							<div class="card-body" style="background-color: white;">
								<form role="form" method="post" action="regist.do"
									name="registForm">
									<div class="form-group">
										<label for="gbwriter">작성자</label> <input type="text"
											id="writer" name="gbwriter" class="form-control"
											value="${loginUser.parents_id}" readonly>
									</div>

									<div class="form-group">
										<label for="gbcontent">내 용</label>
										<textarea class="form-control" name="gbcontent" id="gbcontent"
											rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
									</div>

								</form>
							</div>
							<!--end card-body  -->
							<!--end card-footer  -->
						</div>
						<!-- end card -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
							<div class="card-footer" style="background-color: #e7f3ff;">
								<button type="button" class="btn btn-primary" id="registBtn"
									onclick="regist_go();">등 록</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn" id="cancelBtn"  style="background-color: rgb(52, 73, 94); color: white;" onclick="CloseWindow();"
									onclick="CloseWindow();">취 소</button>
							</div>


<script>
	var dataNum = 0;

	function remove_go(index) {
		//alert(index);
		$('div[data-no="' + index + '"]').remove();
	}

	function regist_go() {
		//alert("click regist");

		$("form[role='form']").submit();

	}
</script>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>