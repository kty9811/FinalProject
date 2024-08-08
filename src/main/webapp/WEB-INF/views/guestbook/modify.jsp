<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<div class="card-tools" style="background-color: #e7f3ff;">
			
		</div>
	</div>

		<div class="row">
			<div class="col-md-12">
				
					<div class="card-header" style="background-color: rgb(189, 215, 238);">
						<h3>수정</h3>
					</div><!--end card-header  -->
					<div class="card-body" style="background-color: white;">
						<form role="form" method="post" action="modify.do" name="modifyForm">
							<input type="hidden" name="pno" value="${guestbook.pno }" />
							
							<div class="form-group">
								<label for="gbwriter">작성자</label> 
								<input type="text" id="gbwriter" readonly
									name="gbwriter" class="form-control" value="${guestbook.gbwriter }">
							</div>
							
							<div class="form-group">
								<label for="gbcontent">내 용</label>
								<textarea id="gbcontent" class="form-control" rows="5" name="gbcontent">${guestbook.gbcontent}</textarea>
							</div>
							
						
						</form>
					</div><!--end card-body  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->

					<div class="card-footer" style="background-color: #e7f3ff;">
						<button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_submit();">수 정</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn" id="cancelBtn" style="background-color: rgb(52, 73, 94); color: white;" onclick="CloseWindow();">취 소</button>
					</div><!--end card-footer  -->
	<!-- /.card-body -->

<!-- /.card -->
<!-- </div> -->


<script>
var dataNum=0;
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);		


function modify_submit(){
	//alert("submit btn");
	let form = $('form[name="modifyForm"]');
	
	//유효성 체크

	
	form.submit();

}



function remove_go(dataNum){
	let div = $('div[data-no="'+dataNum+'"]');
	div.remove();
}
</script>
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>