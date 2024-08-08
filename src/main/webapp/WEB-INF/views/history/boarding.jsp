<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>


<style>

	.col-md-6{
		text-align:left;	
	}

</style>

<div class="wrapper">
	<div>
		<div class="content"
			style="background-color: #e7f3ff; width: 100%; height: 1100px;"> <br/><br/><br/>

			<section class="content" style="margin:0 60px 0 60px;">
				<div class="card" style="background-color:rgb(189, 215, 238);">
					<div class="card-header with-border">
					<span style="font-size:25px; color:rgb(52, 73, 94); margin-left:10px;">승차내역</span>
						<div id="keyword" class="card-tools" style="width: 550px;">
							<div class="input-group row">
								

								<select class="form-control col-md-3" name="perPageNum"
									id="perPageNum" onchange="">
									<option value="10">정렬개수</option>
									<option value="5" ${pageMaker.perPageNum eq 5 ? 'selected':'' }>5개로
										정렬</option>
									<option value="15" ${pageMaker.perPageNum eq 15 ? 'selected':'' }>15개로
										정렬</option>
								</select>


								<select class="form-control col-md-3" name="searchType"
									id="searchType">
									<option value="">검색구분</option>
									<option value="c"
										${pageMaker.searchType eq 'c' ? 'selected':'' }>원생</option>
									<option value="p"
										${pageMaker.searchType eq 'p' ? 'selected':'' }>학부모</option>
									<option value="n"
										${pageMaker.searchType eq 'n' ? 'selected':'' }>정류소 번호</option>
									<option value="s"
										${pageMaker.searchType eq 's' ? 'selected':'' }>정류소 이름</option>
									<option value="d"
										${pageMaker.searchType eq 'd' ? 'selected':'' }>날짜</option>
								</select>
								<!-- keyword -->
								<input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);"
										data-card-widget="search" onclick="search_list(1);">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div>
						</div>
					</div>
					<div class="card-body" style="text-align: center;">
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-bordered table-hover" style="background-color:white;" id="boardingTable">
									<thead>
										<tr>
											<th>원생 이름</th>
											<th>학부모 성함</th>
											<th>탑승 정류소 번호</th>
											<th>탑승 정류소 이름</th>
											<th>탑승 날짜 및 시간</th>
										</tr>
									</thead>
									<c:if test="${not empty boardingList }">
									<c:forEach items="${boardingList }" var="boarding">
										<tr>
											<td>${boarding.child_name }</td>
											<td>${boarding.parents_name }</td>
											<td>${boarding.station_num }</td>
											<td>${boarding.station_name }</td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${boarding.up_time }"/></td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${empty boardingList }">
										<tr>
											<td colspan="7" class="text-center">
												해당 내용이 없습니다.
											</td>
										</tr>
									</c:if>
										
<!-- 									<c:forEach begin="0" end="10">
											
												<tr>
													<th>&nbsp;</th>
													<th>&nbsp;</th>
													<th>&nbsp;</th>
													<th>&nbsp;</th>
													<th>&nbsp;</th>
												</tr>
											</tbody>
										</c:forEach>
 -->
	
								</table>
							</div>
						</div>
					</div>
					<div>
						<%@ include file="/WEB-INF/views/module/pagination.jsp"%>

					</div><br/>
				</div>
			</section>

		</div>

	</div>
</div>
<script>
window.onload=function(){
	$("#boardingTable").DataTable({
		"paging": false,
	    "searching": false,
	    "ordering": true,
	    "info": false,
    	"responsive": true, 
    	"lengthChange": true, 
    	"autoWidth": false,
    	"buttons": [{
    		extend: 'csv',
            charset: 'utf-8',
            bom: true
    	}, "excel", "pdf", "print"]
  	}).buttons().container().appendTo('#boardingTable_wrapper .col-md-6:eq(0)');
}
</script>
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>