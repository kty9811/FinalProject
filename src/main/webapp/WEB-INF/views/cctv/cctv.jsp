<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/module/header.jsp" %>

<style>

	body {
        background-color: #e7f3ff; /* 백그라운드 색상 변경 */
    }
    .container {
        display: flex;
        height: 80vh;
    }
    .main-screen {
        flex: 0.8;
        font-weight: bold;
        font-size: 30px;
        display: flex;
        flex-direction: column;
    }
    
    
    .main-camera video,
	.monitor video {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 영상을 요소에 맞게 조정 */
}
    
    .main-camera{
    	box-shadow:3px 3px 3px black;
    	width: 490px;
    	height: 365px;
    	position: relative;
    	padding: 5px 10px;
    	
    }
    
    .cctv{
    
    position:absolute;
    width:640px;
    height:480px;
    transform: scale(0.75);
    border: 0;
    transform-origin:top left;
    
    
    
    }

    
    .camera, .recognition {
        
        height:230px;
        
    }
   
    
    .sub-screens {
        flex: 1;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        font-weight: bold;
        align-content: flex-start;
        font-size:22px;
    

    }
    .sub-screen {
        width: 250px; /* 각 보조 화면 너비 설정 */
        height: 140px; /* 각 보조 화면 높이 설정 */
        margin-bottom:95px;
       
    }
    .monitor:hover {
    	cursor: pointer;
    	transform: scale(1.05);
    	
}
    .monitor{
    	box-shadow:3px 3px 3px black;
    	transition-duration:0.3s;
    	max-width:100%;
    	max-height:100%;
    	overflow: hidden;
    }
    .monitor:active{
    	margin-left: 5px;
    	margin-top: 5px;
    	box-shadow:none;
    }
</style>


<div class="wrapper">
<!-- Content Wrapper. Contains page content -->    

	 <!-- Main content -->
	
	
	<section class="content" style="background-color: #e7f3ff; padding-top:50px;">
	<div class="container">
    <div class="main-screen" style="margin:0 50px 0 0;">
    	<div class="camera" style="height:400px;">
    		<div class="main-camera-name">
    			유치원 입구
    		</div>
    		<div class="main-camera">
    			<iframe class="cctv"  src="http://127.0.0.1:5000/abcs/video_feed"> </iframe>
    		</div>
    	</div>
    	
    	<div class="recognition" style="margin-top:60px;">
    		<iframe class="w-100" width="480px;" height="230px"
								style="border: none; border-radius: 10px;"		
								src="<%=request.getContextPath()%>/detect"> </iframe>
    	</div>
    </div>
    
    
    <div class="sub-screens">
        <!-- 보조 화면 내용 -->

        <div class="sub-screen">
        	<div class="sub-screen-name">자연시티빌</div>
        	<div class="monitor"><video  src="resources/video/22.mp4" muted autoplay playsinline loop></video></div>
        </div>
        <div class="sub-screen">
        	<div class="sub-screen-name">탄방개나리아파트</div>
        	<div class="monitor"><video src="resources/video/22.mp4" muted autoplay playsinline loop></video></div>
        </div>
        <div class="sub-screen">
        	<div class="sub-screen-name">한양산호아파트</div>
        	<div class="monitor"><video src="resources/video/33.mp4" muted autoplay playsinline loop></video></div>
        </div>
        <div class="sub-screen">
        	<div class="sub-screen-name">한우리아파트</div>
        	<div class="monitor"><video src="resources/video/11.mp4" muted autoplay playsinline loop></video></div>
        </div>
        <div class="sub-screen">
        	<div class="sub-screen-name">한가람아파트</div>
        	<div class="monitor"><video src="resources/video/11.mp4" muted autoplay playsinline loop></video></div>
        </div>
    </div>
</div>
	</section>
	 
	 
	 
   	

</div>
<!-- ./wrapper -->


<%@ include file="/WEB-INF/views/module/common_js.jsp" %>
<!-- REQUIRED SCRIPTS -->



<script>
    // 메인 카메라 비디오 요소 가져오기
    var mainVideo = document.getElementById('mainVideoElement');

    // 웹캠 스트림 가져와서 메인 카메라 비디오 요소에 할당하기
    if (navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function (stream) {
                mainVideo.srcObject = stream;
            })
            .catch(function (error) {
                console.log("웹캠 스트림을 가져오는 중 오류가 발생했습니다: ", error);
            });
    } else {
        console.log("getUserMedia를 지원하지 않습니다.");
    }
</script>
<script>
    // 서브 카메라 비디오 요소 가져오기
    var subVideo = document.getElementById('subVideoElement');

    // 웹캠 스트림 가져와서 서브 카메라 비디오 요소에 할당하기
    if (navigator.mediaDevices.getUserMedia) {
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function (stream) {
                subVideo.srcObject = stream;
            })
            .catch(function (error) {
                console.log("웹캠 스트림을 가져오는 중 오류가 발생했습니다: ", error);
            });
    } else {
        console.log("getUserMedia를 지원하지 않습니다.");
    }
</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var subScreens = document.querySelectorAll('.sub-screen');

    subScreens.forEach(function (subScreen) {
        subScreen.addEventListener('click', function () {
            var clickedVideo = this.querySelector('video');
            var clickedTitle = this.querySelector('.sub-screen-name').innerText;
            var mainVideo = document.querySelector('.main-camera video');
            var mainTitle = document.querySelector('.main-camera-name');

            // 클릭된 영상과 제목을 main-screen에 표시
            mainVideo.src = clickedVideo.src;
            mainTitle.innerText = clickedTitle;
        });
    });
});
</script>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
