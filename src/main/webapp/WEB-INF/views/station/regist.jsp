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
<div class="col-md-6">
	<div class="card">
		<div class="card-header" style="background-color: #e7f3ff;">
			<h3 class="card-title">탑승 원생 등록</h3>

			<div class="card-tools">
				<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
			</div>
		</div>
            <div class="card-body">
              
              <form role="form" class="form-horizontal" action="regist" method="post">
              <div class="form-group">
                <label for="inputStatus">정류소</label>
                <select id="inputStatus" name="station_num" class="form-control custom-select">
                  <option disabled="">Select one</option>
                  <option value="1" selected="">자연시티빌1</option>
                  <option value="2">탄방개나리아파트</option>
                  <option value="3">한양산호아파트</option>
                  <option value="4">한우리아파트</option>
                  <option value="5">한가람아파트</option>
                </select>
              </div>
              <div class="form-group">
                <label for="inputChild">원생</label>
                <select id="inputChild" name="child_id" class="form-control custom-select">
                  <option value="" disabled selected>원생 선택</option>
                  <c:forEach items="${childList }" var="child">
                  	<c:if test="${child.station_num == '' }">
                  		<option value="${child.child_id }">${child.child_name }
                  		<fmt:formatDate value="${child.child_birth }" pattern="(yy/MM/dd)"/>
                  		</option>
                  	</c:if>
                  </c:forEach>
                </select>
                <!-- <input type="text" id="inputClientCompany" name="child_name" class="form-control" placeholder="원생 이름"> -->
              </div>
              
              <div class ="card-tools">
              		<div class="d-flex justify-content-between">
              			<div>
		              		<button type="button" class="btn" id="registBtn" style="background-color: rgb(52,73,94); color:white;"  onclick="regist_go();">등 록</button>
              			</div>
              			<div>
							<button type="button" class="btn btn-secondary" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
              			</div>
              		</div>
              </div>
              </form>
              
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>

<script>
    function regist_go(){
	
    var childName = $('#inputChild').val();
    
	if(!childName){
	   alert("원생을 선택해주세요.");
	   return false;
	} else{
	
		var form = $('form[role="form"]');
		form.submit();
	}
}
</script>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>