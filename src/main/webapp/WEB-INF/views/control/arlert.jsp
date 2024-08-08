<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="5">

<style>
body{
background-color: rgb(189, 215, 238)
}
</style>
</head>

<div class="col-md-4">
							<br />
							<div class="text-center">
								<h4>알림</h4>
							</div>

							<div class="d-flex justify-content-center" id="notificationArea" style="overflow-y: auto; max-height: 700px; display: flex; flex-direction: column-reverse;">
    							<!-- 기존의 알림 메시지들을 보여줄 영역 -->

							    <!-- 기존의 알림 메시지들을 보여줄 영역 -->
							    <div style="background-color: rgba(169, 169, 169, 0.5); padding: 20px; text-align: center; border-radius: 10px;">
							        <c:choose>
							            <c:when test="${location.location eq 'ready'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 운행 준비 중입니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'one1'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 자연시티빌에 도착했습니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'two2'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 탄방개나리아파트에 도착했습니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'three3'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 한양산호아파트에 도착했습니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'four4'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 한우리아파트에 도착했습니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'five5'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 한가람아파트에 도착했습니다.</p>
							            </c:when>
							            <c:when test="${location.location eq 'six6'}">
							                <p style="font-weight: bold; font-size: 20px; color: #333;">버스가 미래유치원에 도착했습니다.</p>
							            </c:when>
							        </c:choose>
							    </div>
							</div>

						</div>
<script>
// 페이지를 자동으로 새로고침하는 함수
function autoRefreshPage() {
    location.reload(); // 페이지를 새로고침
}

// 일정 시간마다 페이지를 자동으로 새로고침
setInterval(function() {
    autoRefreshPage(); // 페이지를 자동으로 새로고침
}, 3000); // 3초마다 페이지를 새로고침하도록 설정

// 서버에서 위치 값을 가져오는 함수
function getLocationFromServer() {
    // AJAX 요청을 통해 서버에서 위치 값을 가져옴
    $.ajax({
        url: '/get-location', // 위치 값을 가져오는 엔드포인트 URL
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            // 위치 값이 성공적으로 가져와졌을 때 새로운 알림 추가
            handleLocationChange(response.location); // 서버로부터 받은 위치 값을 전달하여 알림 추가
        },
        error: function(xhr, status, error) {
            console.error('Error fetching location:', error);
        }
    });
}

// 위치 값을 가져온 후 자동으로 페이지를 새로고침하는 함수
function getLocationAndRefreshPage() {
    getLocationFromServer(); // 위치 값을 가져와서 알림 추가
    autoRefreshPage(); // 페이지를 자동으로 새로고침
}

// 위치 값이 변경될 때마다 새로운 알림 메시지 추가
function handleLocationChange(newLocation) {
    var message = '';
    switch (newLocation) {
        case 'ready':
            message = '버스가 운행 준비 중입니다.';
            break;
        case 'one1':
            message = '버스가 자연시티빌에 도착했습니다.';
            break;
        case 'two2':
            message = '버스가 탄방개나리아파트에 도착했습니다.';
            break;
        case 'three3':
            message = '버스가 한양산호아파트에 도착했습니다.';
            break;
        case 'four4':
            message = '버스가 한우리아파트에 도착했습니다.';
            break;
        case 'five5':
            message = '버스가 한가람아파트에 도착했습니다.';
            break;
        case 'six6':
            message = '버스가 미래유치원에 도착했습니다.';
            break;
        default:
            message = '알 수 없는 위치입니다.';
    }
    // 새로운 알림 메시지 추가
    addNotification(message);
}

// 서버에서 위치 값을 가져오고, 그 후 페이지를 새로고침하는 함수
function getLocationAndRefreshPage() {
    getLocationFromServer(); // 위치 값을 가져와서 알림 추가
    autoRefreshPage(); // 페이지를 자동으로 새로고침
}
</script>




<%@ include file="/WEB-INF/views/module/common_js.jsp"%>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>