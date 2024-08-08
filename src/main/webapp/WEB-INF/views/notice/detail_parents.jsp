<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>


<!-- Style for detail.jsp -->
<style>
body {
	background-color: #e7f3ff;
}
</style>

<!-- <div class="col-md-6"> -->
<div class="card" style="width: 95%; margin: 0 auto">

	<div class="card-header" style="background-color: rgb(189, 215, 238);">
		<h3 class="card-title">공지사항</h3>

		<div class="card-tools"></div>
	</div>
	
		<div class="row">
			<div class="col-md-12">
		
				<div class="card-header"
					style="background-color: rgb(189, 215, 238);">
					<h3>상세보기</h3>
				</div>
				<!--end card-header  -->
				<div class="card-body" style="background-color: white;">
					<form role="form" method="post" action="modify.do"
						name="modifyForm">
						<input type="hidden" name="nno" value="${notice.nno }" />

						<div class="form-group col-sm-12">
							<label for="title">제 목</label> <input type="text"
								class="form-control" id="title" value="${notice.title }"
								readonly />
						</div>
						<div class="col-sm-12 row">
							<div class="form-group col-sm-4">
								<label for="writer">작성자</label> <input type="text"
									class="form-control" id="writer" value="${notice.writer }"
									readonly />
							</div>

							<div class="form-group col-sm-4">
								<label for="regDate">작성일</label> <input type="text"
									class="form-control" id="regDate"
									value="<fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd" />"
									readonly />
							</div>
							<div class="form-group col-sm-4">
								<label for="viewcnt">조회수</label> <input type="text"
									class="form-control" id="viewcnt" value="${notice.viewcnt }"
									readonly />
							</div>
						</div>

						<div class="form-group col-sm-12">
							<label for="content">내 용</label>
							<div>${notice.content }</div>
						</div>

						<div class="form-group col-sm-12">

							<div class="card-header">
								<h3>첨부파일</h3>
							</div>

							<div class="card-footer">
								<div class="row">
									<!-- attaches -->
									<c:forEach items="${notice.attachList }" var="attach">
										<div class="col-md-4 col-sm-4 col-xs-12"
											style="cursor: pointer;"
											onclick="location.href='<%=request.getContextPath()%>/getFile.do?ano=${attach.ano }';">
											<div class="info-box">
												<span class="info-box-icon bg-yellow"><i
													class="fa fa-copy"></i></span>
												<div class="info-box-content">
													<span class="info-box-text"> <fmt:formatDate
															value="${attach.regDate }" pattern="yyyy-MM-dd" />
													</span> <span class="info-box-number">${attach.fileName.split('\\$\\$')[1] }</span>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>

		</div>
		<!--end card-body  -->
		<!--end card-footer  -->

</div>

		<div class="card-footer" style="background-color: #e7f3ff;">
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn" id="cancelBtn"
				style="background-color: rgb(52, 73, 94); color: white;"
				onclick="CloseWindow();">닫기</button>
		</div>
<!-- end card -->

<!-- end col-md-12 -->

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