<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<style>
body {
	background-color: #e7f3ff;
	.table-fixed-width {
    width: 100%; /* 테이블 너비를 100%로 설정 */
    table-layout: fixed; /* 테이블 너비를 고정 */
}

.table-borderless, .table-borderless td, .table-borderless th {
border: none !important;
}

</style>

<div class="wrapper">
	<div>
		<div class="content"
			style="background-color: #e7f3ff; width: 100%; height: 858px;">
			<br />


			<section class="content-header">
	<div class="container-fluid">
		<br><br>
		<div class="row">
          <div class="col-12">
            <div class="card" style="background-color: rgb(189,215,238);">
              <div class="card-header">

                <button type="button" style="background-color:rgb(52,73,94); color:white;" class="float-sm-right btn active" onclick="OpenWindow('registForm','등록',500,500);">등록</button>

              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
			    <table class="table text-nowrap text-center">
			        <tbody style="background-color:#F8F8FF;">
			            <tr>
			                <td>
			                 
			                    <table class="table table-hover table-fixed-width">
			                        <thead>
			                            <tr>
			                                <th onclick="OpenWindow('modifyForm?station_num=1','상세보기',500,500);" style="cursor:pointer;">
			                                1.자연시티빌1
			                                </th>

			                            </tr>
			                            
			                        </thead>
			                        <tbody class="table-borderless">
			                            <c:forEach items="${childList}" var="child">
			                                <c:if test="${child.station_num == 1 }">
			                                    <tr>
			                                        <td>${child.child_name }</td>
			                                    </tr>
			                                </c:if>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                   
			                </td>
			                <td>
			                    <table class="table table-hover table-fixed-width">
			                        <thead>
			                            <tr>
			                                <th onclick="OpenWindow('modifyForm?station_num=2','상세보기',500,500);" style="cursor:pointer;">
			                                2.탄방개나리아파트
			                                </th>
			                            </tr>
			                        </thead>
			                        <tbody class="table-borderless">
			                            <c:forEach items="${childList}" var="child">
			                                <c:if test="${child.station_num == 2 }">
			                                    <tr>
			                                        <td>${child.child_name }</td>
			                                    </tr>
			                                </c:if>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                </td>
			                <td>
			                    <table class="table table-hover table-fixed-width">
			                        <thead>
			                            <tr>
			                                <th onclick="OpenWindow('modifyForm?station_num=3','상세보기',500,500);" style="cursor:pointer;">
			                                3.한양산호아파트
			                                </th>
			                            </tr>
			                        </thead>
			                        <tbody class="table-borderless">
			                            <c:forEach items="${childList}" var="child">
			                                <c:if test="${child.station_num == 3 }">
			                                    <tr>
			                                        <td>${child.child_name }</td>
			                                    </tr>
			                                </c:if>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                </td>
			                <td>
			                    <table class="table table-hover table-fixed-width">
			                        <thead>
			                            <tr>
			                                <th onclick="OpenWindow('modifyForm?station_num=4','상세보기',500,500);" style="cursor:pointer;">
			                                4.한우리아파트
			                                </th>
			                            </tr>
			                        </thead>
			                        <tbody class="table-borderless">
			                            <c:forEach items="${childList}" var="child">
			                                <c:if test="${child.station_num == 4 }">
			                                    <tr>
			                                        <td>${child.child_name }</td>
			                                    </tr>
			                                </c:if>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                </td>
			                <td>
			                    <table class="table table-hover table-fixed-width">
			                        <thead>
			                            <tr>
			                                <th onclick="OpenWindow('modifyForm?station_num=5','상세보기',500,500);" style="cursor:pointer;">
			                                5.한가람아파트
			                                </th>
			                            </tr>
			                        </thead>
			                        <tbody class="table-borderless">
			                            <c:forEach items="${childList}" var="child">
			                                <c:if test="${child.station_num == 5 }">
			                                    <tr>
			                                        <td>${child.child_name }</td>
			                                    </tr>
			                                </c:if>
			                            </c:forEach>
			                        </tbody>
			                    </table>
			                </td>
			            </tr>
			        </tbody>
			    </table>
			</div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
	</div>

</section>

		</div>

	</div>
</div>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<%@ include file="/WEB-INF/views/module/footer.jsp"%>