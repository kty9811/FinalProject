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

<div class="wrapper">
	<div>
		<div class="content"
			style="background-color: #e7f3ff; width: 100%; height: 858px;">
			<br /> <br /> <br />

			<section class="content" style="margin: 0 60px 0 60px;">
				<div class="card" style="background-color: rgb(189, 215, 238);">
					<div class="card-header with-border">
						

						<!-- /.card-header -->
						<div class="card-body" style="position:relative;">
						<div class="row" style="padding-left:10px;">
							<button type="button"
								style="background-color: rgb(52, 73, 94); color: white; position: absolute; top: 80; left: 120;"
								class="btn active"
								onclick="OpenWindow('registForm.do','등록',700,710);"><i class="fas fa-pen"></i></button>
						
						<div id="keyword" class="card-tools ml-auto" style="width: 550px;">
							<div class="input-group row"></div>
							
							<div id="keyword" class="card-tools" style="position: absolute; top: 100; right:0;">
								<div class="input-group row" style="padding-right:15px;">
									<select class="form-control col-md-3" name="perPageNum"
										id="perPageNum" onchange="">
										<option value="10"
											${pageMaker.perPageNum==10 ? 'selected':'' }>정렬개수</option>
										<option value="20"
											${pageMaker.perPageNum==20 ? 'selected':'' }>20개씩</option>
										<option value="30"
											${pageMaker.perPageNum==30 ? 'selected':'' }>30개씩</option>
										<option value="50"
											${pageMaker.perPageNum==50 ? 'selected':'' }>50개씩</option>

									</select> <select class="form-control col-md-3" name="searchType"
										id="searchType">
										<option value="tcw"
											${pageMaker.searchType eq 'tcw' ? 'selected':'' }>전
											체</option>
										<option value="t"
											${pageMaker.searchType eq 't' ? 'selected':'' }>제 목</option>
										<option value="w"
											${pageMaker.searchType eq 'w' ? 'selected':'' }>작성자</option>
										<option value="c"
											${pageMaker.searchType eq 'c' ? 'selected':'' }>내 용</option>
										<option value="tc"
											${pageMaker.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
										<option value="cw"
											${pageMaker.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>
									</select> <input class="form-control" type="text" name="keyword"
										placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" /> <span
										class="input-group-append">
										<button class="btn btn-primary" type="button" id="searchBtn"
											style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);"
											data-card-widget="search" onclick="search_customerList;">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div></div>
						<br/><br/>
							<table class="table table-bordered text-center"
								style="background-color: white;">
								<tr style="font-size: 20px;">
									<th>번 호</th>
									<th>제 목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회수</th>
								</tr>
								<c:if test="${empty noticeList}">
									<td colspan="6">해당내용이 없습니다.</td>
								</c:if>
								<c:forEach items="${noticeList }" var="notice">
									<tr style="margin: 0; padding: 0; padding-top: 5px;">
										<td>${notice.nno }</td>
										<td id="boardTitle"
											style="text-align: left; max-width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
											<a
											href="javascript:OpenWindow('detail.do?nno=${notice.nno }&from=list','상세보기',800,700);">
												<span class="col-sm-12 ">${notice.title }</span>
										</a>
										</td>

										<td>${notice.writer }</td>
										<td><fmt:formatDate value="${notice.regDate }"
												pattern="yyyy-MM-dd" /></td>
										<td><span class="badge bg-red">${notice.viewcnt }</span></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div class="card-footer">
							<div style="display:${!empty noticeList ? 'visible':'none' };">
								<%@ include file="/WEB-INF/views/module/pagination.jsp"%>
							</div>

						</div>
					</div>
				</div>
				<!-- /.card-body -->
			</section>
		</div>
		<!-- /.card -->
	</div>
</div>


<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>