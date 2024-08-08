<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<%@ include file="/WEB-INF/views/module/navbar_parents.jsp"%>


<style>
body {
   background-color: #e7f3ff;
}

.btn-custom {
   background-color: rgb(52, 73, 94);
   border-color: #your-color;
   color: #fff;
}
</style>

<div class="wrapper">
   <!-- Content Wrapper. Contains page content -->

   <!-- Main content -->
   <div class="content">
      <div class="row" style="padding-top: 150px; width:100%;">
         <!-- Left Section -->
         <div class="col-md-6">
            <div class="leftsection"
               style="background-color: #e7f3ff; padding-left: 250px;">
               <div class="" style="background-color: #e7f3ff;">
                  <div class="card"
                     style="padding-top: 30px; padding-right: 50px; padding-bottom: 0px; padding-left: 50px; width: 500px; height: 600px;">
                     <div class="register-card-header d-flex"
                        style="text-align: center;">
                        <h1 style="font-size: 1.5em; font-weight: bold;">학부모 정보</h1>
                     </div>
                     <div class="register-card-body">
                        <form role="form" class="regist-form" action="regist"
                           method="post" enctype="multipart/form-data">

                           <div class="form-group row">
                              <label for="date" class="col-sm-4" style="font-size: 0.9em;">이름</label>
                              <div class="col-sm-8 input-group-sm">
                                 <input class="form-control" name="name" class="form-control"
                                    id="date" value="${parents.parents_name }" readonly style="width:150px;">
                              </div>
                           </div>


                           <div class="form-group row">
                              <label for="id" class="col-sm-4" style="font-size: 0.9em;">
                                 아이디</label>
                              <div class="col-sm-8 input-group-sm">
                                 <input class="form-control" name="id" type="text"
                                    class="form-control" id="name"
                                    value="${parents.parents_id }" readonly style="width:150px;"
                                    onkeyup="this.value=this.value.trim();" />
                              </div>

                           </div>

                           <div class="form-group row">
                              <label for="pwd" class="col-sm-4" style="font-size: 0.9em;">
                                 비밀번호</label>
                              <div class="col-sm-8 input-group-sm">
                                 <input class="form-control" name="password"
                                    class="form-control" id="pwd"type="password"
                                    value="${parents.parents_pwd }" readonly style="width:150px;">


                              </div>

                           </div>

                           <div class="form-group row">
                              <label for="date" class="col-sm-4" style="font-size: 0.9em;">
                                 관계</label>
                              <div class="col-sm-8 input-group-sm">
                                 <input class="form-control" name="name" class="form-control"
                                    id="date" value="${parents.parents_relation }" readonly style="width:150px;">


                              </div>

                           </div>

                           <div class="form-group row">
                              <label for="phone" class="col-sm-4" style="font-size: 0.9em;">
                                 전화번호</label>
                              <div class="col-sm-8 input-group-sm">
                                 <input class="form-control" name="phone" class="form-control"
                                    id="phone" value="${parents.parents_phone }" readonly style="width:150px;">


                              </div>

                           </div>

                           <div class="card-footer" style="background-color: #ffffff;">


                              <div class="row">
                                 <div style="padding-left: 40%; padding-top: 40%;">



                                    <button type="button"
                                       onclick="window.open('modify?parents_id=${parents.parents_id}','상세보기', 'width=670, height=700');"
                                       id="modifyBtn" class="btn btn-primary"
                                       style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);">수&nbsp;정</button>


                                 </div>





                              </div>
                           </div>
                           <!-- Add other form fields here -->
                        </form>
                     </div>
                     <!-- register-card-body -->
                  </div>
               </div>
            </div>
         </div>
         <!-- /.Left Section -->

         <!-- Right Section -->


         <div class="rightsection" style="background-color: #e7f3ff;">
            <div class="" style="background-color: #e7f3ff;">
               <div class="card"
                  style="padding-top: 30px; padding-right: 50px; padding-bottom: 0px; padding-left: 50px; width: 500px; height: 600px;">
                  <div class="register-card-header d-flex"
                     style="text-align: center;">
                     <h1 style="font-size: 1.5em; font-weight: bold;">원생 정보</h1>
                  </div>
                  <div class="register-card-body">
                     <table class="table table-bordered">
                        <tr>
                           <th>이름</th>
                           <th>생년월일</th>
                        </tr>
                        <c:if test="${not empty childList }">
                           <c:forEach var="child" items="${childList }">
                              <tr
                                 onclick="window.open('/abcs/child/modify?child_id=${child.child_id }&parents_id=${parents.parents_id }','상세보기', 'width=650, height=700');"
                                 style="cursor: pointer;">
                                 <td>${child.child_name }</td>
                                 <td><fmt:formatDate value="${child.child_birth }"
                                       pattern="yyyy-MM-dd" /></td>
                              </tr>
                           </c:forEach>

                        </c:if>
                        <c:if test=" ${empty childList }">
                           <tr>
                              <td colspan="7" class="text-center">해당내용이 없습니다.</td>
                           </tr>
                        </c:if>
                     </table>

                     <div class="card-footer" style="background-color: #ffffff;">
                        <div class="row" style="padding-left:15%;">
                           <div class="col-sm-6">
                              <button type="button" id="registBtn"
                                 onclick="window.open('/abcs/child/regist?parents_id=${parents.parents_id}','상세보기', 'width=650, height=700');"
                                 class="btn btn-primary"
                                 style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);">원&nbsp;&nbsp;생&nbsp;&nbsp;등&nbsp;&nbsp;록</button>
                           </div>

                           <div class="col-sm-6">
                              
                              <!--취소버튼 수정하기 -->
                              <button type="button" id="cancelBtn"
                                 
                                 onclick="history.go(-1);"
                                 class="btn btn-primary"
                                 style="background-color: rgb(52, 73, 94); border-color: rgb(52, 73, 94);">취
                                 &nbsp;&nbsp;소</button>
                           </div>

                        </div>
                     </div>





                  </div>
                  <!-- register-card-body -->
               </div>
            </div>
         </div>
      </div>






      <!-- /.Right Section -->
   </div>
   <!-- /.row -->
</div>
<!-- /.content -->


<!-- REQUIRED SCRIPTS -->
<%@ include file="/WEB-INF/views/module/footer.jsp"%>