<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/module/header.jsp"%>
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<title>승차 관리</title>
<style>
/* 페이지네이션 링크 스타일 */
.page-link {
    color: #333; /* 페이지 링크의 텍스트 색상 */
    background-color: #f8f9fa; /* 페이지 링크의 배경색 */
    border: 1px solid #dee2e6; /* 페이지 링크의 테두리 */
    padding: 6px 12px; /* 페이지 링크의 패딩 */
}

/* 활성화된 페이지 스타일 */
.page-item.active .page-link {
    color: #fff; /* 활성화된 페이지 링크의 텍스트 색상 */
    background-color: #9ca9ba; /* 활성화된 페이지 링크의 배경색 */
    border-color: #b6c3d1; /* 활성화된 페이지 링크의 테두리 */
}

#keyword{
   display:none;
}

body {
   background-color: #e7f3ff;
   font-family: 'Arial', sans-serif;
   margin: 0;
   padding: 0;
}

.checklist-container {
   width: 100%;
   max-width: 600px;
   margin: auto;
   padding: 20px;
}

h1 {
   text-align: center;
}

table {
   width: 100%;
   border-collapse: collapse;
}

table, th, td {
   border: 1px solid #ddd;
}

th, td {
   text-align: center;
   padding: 8px;
   background-color: white;
}

th {
   background-color: white;
   color: black;
}

img {
   width: 50px;
   height: 50px;
   border-radius: 50%;
}

.call-button .fas {
   margin-right: 5px;
}

.call-button {
   background: none;
   border: none;
   cursor: pointer;
   color: #555;
   font-size: 1.5em;
   padding: 0;
}

.call-button:hover {
   color: #000;
}

.fas {
   font-size: 1.2em;
}

.start-button, .stop-button {
   background-color: #2E64FE;
   color: white;
   padding: 10px 20px;
   border: none;
   cursor: pointer;
   float: right;
   margin-left: 10px;
}

.in-button, .out-button {
   background-color: #2E64FE;
   color: white;
   padding: 10px 20px;
   border: none;
   cursor: pointer;
   float: right;
   margin-left: 10px;
}

.stop-button {
   background-color: #f44336;
}

.button-container {
   text-align: right;
   margin: 10px 0;
}

.submit-button {
   background-color: #2E64FE;
   color: white;
   padding: 10px 20px;
   border: none;
   cursor: pointer;
   float: left;
   width: 15%;
   margin-right: 4%;
}

.delete-button {
   background-color: #f44336;
   color: white;
   padding: 10px 20px;
   border: none;
   cursor: pointer;
   float: right;
   width: 15%;
}

.clearfix::after {
   content: "";
   clear: both;
   display: table;
}

.message-container {
   width: 100%;
   max-width: 600px;
   margin: auto;
   margin-top: 20px;
   border: 1px solid #ddd;
   padding: 10px;
   display: flex;
   align-items: center;
   height: 250px;
}

.message-input-container {
   flex-grow: 1;
   margin-right: 10px;
}

.message-input {
   width: 100%;
   height: 100%;
   padding: 10px;
   border: 1px solid #ddd;
   box-sizing: border-box;
}

.send-button {
   padding: 10px 20px;
   background-color: #4CAF50;
   color: white;
   border: none;
   cursor: pointer;
}
</style>


<div class="row" style="height: 1200px;">
   <div class="col-md-4" style="background-color: black;"></div>



   <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;">
      <div style="background-color: rgb(45, 80, 113); height: 80px; display: flex; align-items: center; justify-content: space-between;">

         <div class="navbar_logo">
            <a href="#"> <img src="${pageContext.request.contextPath }/resources/image/Logo5.png" alt="ABC's Logo" class="brand-image"
               style="height: 60px; width: 120px; border-radius: 50%; position: relative; left: 20px;">
            </a>
         </div>
         <div style="float: right; margin-right: 20px;">
            <button class="start-button"
               style="font-size: 17px; border-radius: 5px; width: 108px; height: 38px; color: white; background-color: rgba(255, 255, 255, 0.27); padding-right: 20px;display: flex; align-items: center; justify-content: center;" onclick="location.href='<%=request.getContextPath()%>/logout';">로그아웃</button>
         </div>


      </div>

      <div class="checklist-container">
            
            
            <div style="width: 100%; height: 50px; line-height: 30px; color: #666; font-size: 30px; text-align: right;" id="clock"></div><br/>
               
               
               <form id="jobForm">   
                  <input type='hidden' name="page" value="" />
                  <input type='hidden' name="perPageNum" value="5"/>
               </form>
               
               
               <nav aria-label="Navigation" style="float:left;">
                     <ul class="pagination m-0">
                        
                        <li class="page-item">
                           <a class="page-link" href="javascript:search_list(1);">
                              <i class="fas fa-angle-left page-number"></i>
                           </a>                  
                        </li>
                        <c:forEach var="pageNum" begin="${pageMaker2.startPage }" 
                                           end="${pageMaker2.endPage }" >
                        <li class="page-item ${pageMaker2.page == pageNum?'active':''}">
                           <a class="page-link page-number" href="javascript:search_list(${pageNum });">
                              ${pageNum }
                           </a>
                        </li>
                        </c:forEach>
                           
                        <li class="page-item">
                           <a class="page-link" href="javascript:search_list(${pageMaker2.realEndPage});">
                              <i class="fas fa-angle-right page-number"></i>
                           </a>                  
                        </li>      
                     </ul>
                  </nav>
                  
                  <div>
                  <div>
                     <button class="start-button" style="border-radius: 20px; background-color: rgb(52, 73, 94); font-size: 15px; margin-bottom:5px; margin-right:10px;"
                           onclick="startDriving();">주행시작</button>
                     <button class="stop-button" style="border-radius: 20px; font-size: 15px;" onclick="stopDriving();">
                           긴급정지</button>
                  </div>
               </div>

               
            <form role="form" action="boardingRegist" method="post" onsubmit="return false;">
               <table class="checklist" id="checklist" style="background-color: white;">
                  <tr>
                     <th>정류소 번호</th>
                     <th>사진</th>
                     <th>이름</th>
                     <th>승차 유무</th>
                     <th>벨트 유무</th>
                     <th>전화 발신</th>
                  </tr>
               

                  <c:forEach items="${childList }" var="child" varStatus="status">
                  
                     <c:if test="${child.station_num != '' }">
                        <c:set var="count" value="${!empty count ? count+1 : 0 }" />
                        <input type="hidden" name="riding_people_num[${status.index}]" value="${child.child_id}"/>
                        <input type="hidden" name="riding_station[${status.index}]" value="${child.station_num }"/>
                        <input type="hidden" name="riding_people_name[${status.index}]" value="${child.child_name }" />
                        <tr>
                           <td>${child.station_num }</td>
                           <td>
                              <div class="manPicture" id="pictureView" data-id="${child.child_id}" style = "display:block;border-radius:100%; width:55px;height:55px;margin:0 auto;"></div>
                           </td>
                           <td>${child.child_name }</td>
                           <td><input type="checkbox" class="riding-check" name="riding_check[${status.index}]" 
                              ${child.boarding_status == '1' ? 'checked and disabled':'' }
                              id="ridingCheckbox${child.child_id}" value="1"
                              data-id="${child.child_id}" data-name="${child.child_name }"/></td>
                           <td><input type="checkbox" class="belt-check" name="riding_belt[${status.index}]"
                              ${child.belt_status == '1' ? 'checked and disabled':'' }
                              id="beltCheckbox${child.child_id}" value="1"
                              data-id="${child.child_id}" /></td>

                           
                           <td>
                              <!-- 버튼 클릭 시 모달 창 열기 -->
                              <button class="call-button"
                                 onclick="CallButton(${child.child_id});" data-toggle="modal"
                                 data-target="#myModal${child.child_id }">
                                 <i class="fas fa-phone"></i>
                              </button> <!-- 모달 창 -->
                              <div class="modal fade" id="myModal${child.child_id }"
                                 role="dialog">
                                 <div class="modal-dialog">
                                    <div class="modal-content">
                                       <div class="modal-header">
                                          <h4 class="modal-title">${child.child_name }원생</h4>
                                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                                       </div>
                                       <div class="modal-body">
                                          <p id="modalParentsPhone${child.child_id }"></p>
                                       </div>
                                       <div class="modal-footer">
                                          <!-- 모달 내부에 버튼 추가 -->
                                          <button type="button" class="btn btn-info btn-md"
                                             data-dismiss="modal">사용</button>
                                          <button type="button" class="btn btn-info btn-md"
                                             data-dismiss="modal" style="margin-left: 3px;">취소</button>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </td>

                        </tr>
                     </c:if>
                  </c:forEach>
                  <input type="hidden" value="0" name="riding_belt[${count+1 }]" />
                  <input type="hidden" value="0" name="riding_check[${count+1 }]" />
               </table>

      <!--  <div style="padding-left: 10%; width: 100px; height: 30px; color: #666; font-size: 30px; text-align: center;" id="clock">
         </div> -->
            <div class="btn row" style="padding-left: 59%;">
               <button class="stop-button float-right"
                  style="border-radius: 20px; background-color: rgb(52, 73, 94);"
                  onclick="handleOffConfirmation()">하차처리</button>
               <button class="start-button float-right"
                  style="border-radius: 20px; background-color: rgb(52, 73, 94);"
                  onclick="handleOn()">승차처리</button>
            </div>
         </form>
      </div>

      <div style="width: 100%; padding-left: 40px;">
         <div style="width: auto;">
            <iframe id="chat" width="560px" height="300px" style="border: 1px solid rgb(191, 191, 191, 1.0);"
               src="http://localhost:3000/"> </iframe>
         </div>
      </div>

   </div>
   <div class="col-md-4" style="background-color: black;"></div>
</div>

<script> 
function startDriving() {
   fetch('http://127.0.0.1:8000/abcs/start-driving', { method: 'POST' })
   .then(response => response.json())
   .then(data => alert('주행 시작: ' + data.message))
   .catch(error => console.error('주행 시작 오류:', error));
   }

function stopDriving() {
   fetch('http://127.0.0.1:8000/abcs/stop-driving', { method: 'POST' })
   .then(response => response.json())
   .then(data => alert('긴급 정지: ' + data.message))
   .catch(error => console.error('긴급 정지 오류:', error));
   }
</script>


<script>

function handleOn(){
   //var checkboxes = document.querySelectorAll('input[type="checkbox"]');
   //var num = checkboxes.length / 2;
   var checkboxes = document.querySelectorAll('input[class="riding-check"]');
   var beltAlertShown = false;
   var ridingAlertShown = false;
   
   
   checkboxes.forEach(function(ridingCheckbox){
      var beltCheckbox = ridingCheckbox.parentNode.nextElementSibling.querySelector('input[class="belt-check"]');
      var childName = ridingCheckbox.getAttribute('data-name');
      if (ridingCheckbox.checked && !beltCheckbox.checked && !beltAlertShown){
         alert(childName + "님의 안전벨트를 확인해주세요.");
         beltAlertShown = true;
      }
      
      if (!ridingCheckbox.checked && beltCheckbox.checked && !ridingAlertShown){
         alert(childName + "님의 탑승을 확인해주세요.");
         ridingAlertShown = true;
      }
   });

   if(!beltAlertShown && !ridingAlertShown){
      let form = document.querySelector('form[action="boardingRegist"]');
      form.submit();
   }

}

function handleOffConfirmation(){
   var confirmation = confirm("하차 처리하시겠습니까?");
   if(confirmation){
      handleOff();
   } else{
   }
}

function handleOff(){
   
   var checkboxes = document.querySelectorAll('input[type="checkbox"]');
   
   checkboxes.forEach(function(checkbox){
      checkbox.checked = false;
      checkbox.disabled = false;
   });
   alert("하차 처리되었습니다.")
   
   var formObj = document.querySelector("form[role='form']");
      
      formObj.action = "boardingOff.do";
      formObj.submit();
}




function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
       amPm = 'PM';
       if(currentHours > 12){
       currentHours = addZeros(currentHours - 12,2);
       }
    }

    clock.innerHTML ="<span style='font-size:20px;'>현재 시각 </span>"+ currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
     var zero = '';
     num = num.toString();
     if (num.length < digit) {
       for (i = 0; i < digit - num.length; i++) {
         zero += '0';
       }
     }
     return zero + num;
}
printClock();


function CallButton(childId) {
   event.preventDefault();
    // 클릭된 버튼의 부모 tr 요소
    //var trElement = $(event.target).closest('tr');
    
    // 부모 tr 요소에서 riding-check 클래스를 가진 요소의 data-id.
    //var childId = $(trElement).find('.riding-check').data('id');
    
    // AJAX 요청.
    $.ajax({
        type: 'GET',
        url: '<%=request.getContextPath()%>/getParentsPhone',
        data: { childId: childId },
        success: function(response) {
            
            $('#modalParentsPhone' + childId).text('Parent Phone: ' + response);
            
            $('#myModal' + childId).modal('show'); //모달 열기
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}



function search_list(page){

   let perPageNum = 5;

   let form = document.querySelector("#jobForm");
   form.page.value=page;
   form.perPageNum.value=perPageNum;
   
   //console.log(page,perPageNum,searchType,keyword);
   console.log($(form).serialize());

   form.submit();
}   
</script>
<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<script>
MemberPictureThumb("<%=request.getContextPath()%>");
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>