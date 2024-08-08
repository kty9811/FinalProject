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
<div class="card">
	<div class="card-header" style="background-color: #e7f3ff;">
		<h3 class="card-title">탑승 원생 수정</h3>

		<div class="card-tools" style="background-color: #e7f3ff;">
			<button type="button" class="btn btn-tool"
				data-card-widget="collapse" title="Collapse">
				<i class="fas fa-minus"></i>
			</button>
		</div>
	</div>
	<div class="card-body table-responsive p-1">
		<form role="form" class="form-horizontal" method="post"
			action="modify">
			<table
				class="table table-bordered table-hover text-nowrap text-center">
				<thead>
					<tr>
						<th>정류소</th>
						<th>원생</th>
						<th>&nbsp;</th>

					</tr>
				</thead>
				<tbody>
					<c:if test="${empty childList }">
						<tr>
							<td colspan="7" class="text-center">해당 원생이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach items="${childList }" var="child" varStatus="status">

						<tr>
							<td><select id="inputStatus"
								name="station_num[${status.index }]"
								class="form-control custom-select">
									<option disabled="">Select one</option>
									<option value="1" ${child.station_num == 1 ? 'selected' : '' }>자연시티빌1</option>
									<option value="2" ${child.station_num == 2 ? 'selected' : '' }>탄방개나리아파트</option>
									<option value="3" ${child.station_num == 3 ? 'selected' : '' }>한양산호아파트</option>
									<option value="4" ${child.station_num == 4 ? 'selected' : '' }>한우리아파트</option>
									<option value="5" ${child.station_num == 5 ? 'selected' : '' }>한가람아파트</option>
							</select></td>
							<td><input type="hidden" name="child_id[${status.index }]"
								value="${child.child_id}" /> ${child.child_name }</td>

							<td><button type="button" class="btn btn-danger"
									id="removeBtn"
									onclick="submit_go('remove.do?child_id=${child.child_id}');">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<br>

			<div class="card-tools">
				<div class="d-flex justify-content-around">
					<div>
						<button type="button" class="btn"
							style="background-color: rgb(52, 73, 94); color: white;"
							id="registBtn" onclick="modify_go();">등 록</button>
					</div>
					<div>
						<button type="button" class="btn btn-secondary" id="cancelBtn"
							onclick="CloseWindow();">취 소</button>
					</div>
				</div>
			</div>
			</form>
	</div>
	<!-- /.card-body -->
</div>
<!-- /.card -->
<!-- </div> -->


<script>
var formObj = document.querySelector("form[role='form']");

function submit_go(url){
	if(url=="remove.do" && !confirm("정말로 삭제하시겠습까?")){
		return;
	}
	formObj.action=url;
	formObj.submit();
}

function modify_go(){
	
    var form = $('form[role="form"]');
    form.submit();
}

</script>
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>