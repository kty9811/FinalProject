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
                           <option value="6">정렬개수</option>
                           <option value="6" ${pageMaker.perPageNum eq 6 ? 'selected':'' }>6개로 정렬</option>
                           <option value="9" ${pageMaker.perPageNum eq 9 ? 'selected':'' }>9개로 정렬</option>
                        </select>


                        <select class="form-control col-md-3" name="searchType" id="searchType">
                           <option value="">검색구분</option>
                           <option value="i"
                              ${pageMaker.searchType eq 'i' ? 'selected':'' }>발생위치</option>
                           <option value="n"
                              ${pageMaker.searchType eq 'n' ? 'selected':'' }>감지물체</option>
                           <option value="p"
                              ${pageMaker.searchType eq 'p' ? 'selected':'' }>발생시간</option>                  
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
                        <div class="card-body pb-0">
                           <div class="row">
                              <c:if test="${not empty eventList }">
                                 <c:forEach var="event" items="${eventList}">
                                    <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
                                       <div class="card bg-light d-flex flex-fill">
                                          <div class="card-header text muted border-bottom-0">영상 번호 : ${event.num }</div>
                                          <div class="card-body pt-0">
                                             <div class="row">
                                                <div class="col-7">
                                                   <h2 class="lead">
                                                      <b>${event.event_title }</b>
                                                   </h2>
                                                   <br />
                                                   <ul class="ml-4 mb-0 fa-ul text-muted">
                                                      <li class="small text-left">
                                                         <span class="fa-li">
                                                            <i class="fas fa-lg fa-building"></i>
                                                         </span>
                                                         발생위치: 미래유치원
                                                      </li>
                                                      <li class="small text-left">
                                                         <span class="fa-li">
                                                            <i class="fas fa-lg fa-building"></i>
                                                         </span>
                                                         감지물체 : ${event.event_object }
                                                      </li>
                                                      <li class="small text-left">
                                                         <span class="fa-li">
                                                            <i class="fas fa-lg fa-calendar"></i>
                                                         </span>
                                                         발생시간 : <fmt:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${event.event_time }"/>
                                                      </li>
                                                   </ul>
                                                </div>
                                                <div class="col-5 text-center">
                                                   <img src="${pageContext.request.contextPath }/resources/thumbnail/${event.event_thumbnail}"
                                                         alt="${event.event_title }" class="img-fluid">
                                                </div>
                                             </div>
                                          </div>
                                          <div class="card-footer">
                                             <div class="text-right">
                                                <button class="btn btn-sm btn-primary" class="fas fa-link"
                                                      onclick="playVideo('${event.event_video }');" style="cursor:pointer;">
                                                   <i class="fas fa-link"></i>녹화영상
                                                </button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </c:forEach>
                              </c:if>
                              <c:if test=" ${empty eventList }">
                                      <tr>
                                       <td colspan="7" class="text-center">
                                          영상이 없습니다.
                                       </td>
                                    </tr>
                                   </c:if>
                           </div>
                        </div>
                     </div>
                  </div>
               <!-- 
               <div class="card-body" style="text-align: center;">
                  <div class="row">
                     <div class="col-sm-12">
                        <table class="table table-bordered table-hover" style="background-color:white;" id="eventTable">
                           <thead style="font-size:20px;">
                              <tr>
                                 <th>No.</th>
                                 <th>영상제목</th>
                                 <th>감지물체</th>
                                 <th>영상경로</th>                                    
                              </tr>
                           </thead>
                              
                           <tbody style="font-size:16px;">                                 
                              <c:if test="${not empty eventList }">
                                      <c:forEach var="event" items="${eventList}">
                                      <tr onclick="playVideo('${event.event_video }');" style="cursor:pointer;'">
                                         <td>${event.num }</td>
                                         <td>${event.event_title }</td>
                                         <td>${event.event_object }</td>
                                         <td>${event.event_video }</td>                 
                                      </tr>                             
                                      </c:forEach>
                              </c:if>
                                   <c:if test=" ${empty eventList }">
                                      <tr>
                                       <td colspan="7" class="text-center">
                                          영상이 없습니다.
                                       </td>
                                    </tr>
                                   </c:if>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div> -->
               <div class="card-footer">
                  <%@ include file="/WEB-INF/views/module/pagination.jsp"%>
               </div>
            </div>
         </section>
      </div>
   </div>
</div>

<script>
function playVideo(videoPath) {
    // 파일 경로에서 파일 이름만 추출
    var fileName = videoPath.substring(videoPath.lastIndexOf("/") + 1);
    var url = "<c:url value='/history/video2'/>?videoPath=" + encodeURIComponent(fileName);
    window.open(url, "videoWindow", "width=1000, height=750");
}

    
</script>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>