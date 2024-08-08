<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<style>
	body{
		background-color:#e7f3ff;
	}
</style>

<div class="wrapper">
	<div>
		<div class="content"
			style="background-color: #e7f3ff; width: 100%; height: 858px;"> <br/><br/><br/>

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
									<option value="p"
										${pageMaker.searchType eq 'p' ? 'selected':'' }>학부모명</option>
									<option value="pn"
										${pageMaker.searchType eq 'pn' ? 'selected':'' }>전화번호</option>						
								</select>
								<!-- keyword -->
								<input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background-color: rgb(52,73,94); border-color: rgb(52,73,94);"
										data-card-widget="search" onclick="search_customerList;">
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
								<table class="table table-bordered table-hover" style="background-color:white;">
										<thead style="font-size:20px;">
											<tr>
												
												<th>아이디</th>
												<th>학부모명</th>
												<th>전화번호</th>												
											</tr>
										</thead>
										
					<tbody style="font-size:15px;">
											
						<c:if test="${not empty parentsList }">
		              		<c:forEach var="parents" items="${parentsList }">
		              		<tr onclick="location.href='<%=request.getContextPath()%>/parents/detail?parents_id=${parents.parents_id }';"  style="cursor:pointer;">
		              				
		              			<td>${parents.parents_id }</td>
		              			<td>${parents.parents_name }</td>
		              			<td>${parents.parents_phone}</td>
		              		</tr>
		              			
		              	</c:forEach>
		              </c:if>
		              	<c:if test=" ${empty parentsList }">
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
					<div>
						<%@ include file="/WEB-INF/views/module/pagination.jsp"%>

					</div><br/>
				</div>
			</section>

		</div>

	</div>
</div>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>