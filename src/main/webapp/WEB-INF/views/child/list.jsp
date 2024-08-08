<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>

<style>
	body{
		background-color:#e7f3ff;
	}
	
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
						<div id="keyword" class="card-tools" style="width: 550px;">
							<div class="input-group row">
								

								<select class="form-control col-md-3" name="perPageNum"
									id="perPageNum" onchange="">
									<option value="10">정렬개수</option>
									<option value="10" ${pageMaker.perPageNum eq 2 ? 'selected':'' }>10개로
										정렬</option>
									<option value="20" ${pageMaker.perPageNum eq 3 ? 'selected':'' }>20개로
										정렬</option>
								</select>


								<select class="form-control col-md-3" name="searchType"
									id="searchType">
									<option value="">검색구분</option>
									<option value="i"
										${pageMaker.searchType eq 'i' ? 'selected':'' }>원생이름</option>
									<option value="n"
										${pageMaker.searchType eq 'n' ? 'selected':'' }>생년월일</option>
									<option value="p"
										${pageMaker.searchType eq 'p' ? 'selected':'' }>학부모명</option>						
								</select>
								<!-- keyword -->
								<input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background-color: rgb(52,73,94); border-color: rgb(52,73,94);"
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
								<table class="table table-bordered table-hover" style="background-color:white;" id="noticeTable">
										<thead style="font-size:20px;">
											<tr>
												<th>사진</th>
												<th>원생이름</th>
												<th>생년월일</th>
												<th>학부모명</th>												
											</tr>
										</thead>
										
					<tbody style="font-size:16px;">
											
						<c:if test="${not empty childList }">
		              		<c:forEach var="child" items="${childList}">
		              		<tr onclick="location.href='<%=request.getContextPath()%>/parents/detail?child_id=${child.child_id}&parents_id=${child.parents_id}';"  style="cursor:pointer;">
		              			
		              			
		              			<td>
		              				<div class="manPicture" id="pictureView" data-id="${child.child_id}" style = "display:block; border-radius:100%; width:30px; height:30px; margin:0 auto;"></div>
		              			</td>	
		              			
		              			<td>${child.child_name }</td>
		              			<td><fmt:formatDate value="${child.child_birth }" pattern="yyyy-MM-dd" /></td>
		              			<td>${child.parents_name}</td>
		              		</tr>
		              			
		              	</c:forEach>
		              </c:if>
		              	<c:if test=" ${empty childList }">
		              		<tr>
		            			<td colspan="7" class="text-center">
		            				해당내용이 없습니다.
		            			</td>
		            		</tr>
		              	</c:if>
		              	</tbody>
		            </table>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<%@ include file="/WEB-INF/views/module/pagination.jsp"%>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>
<script>
	MemberPictureThumb("<%=request.getContextPath()%>");
</script>

<script>
window.onload=function(){
	$("#noticeTable").DataTable({
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
  	}).buttons().container().appendTo('#noticeTable_wrapper .col-md-6:eq(0)');
}
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>