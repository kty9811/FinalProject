<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>

<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Refresh" content="5"> -->
</head>

<style>
#keyword {
	display: none;
}

body {
	background-color: #e7f3ff;
}

.chat-bubble {
	display: inline-block;
	background-color: #f1f0f0;
	border-radius: 15px;
	padding: 20px;
	margin: 10px;
	max-width: 70%; /* Adjust as needed */
}

.chat-bubble-sender {
	background-color: #d1eaf7;
	float: right; /* 메시지를 오른쪽으로 */
}

/* 새로운 테이블 로우 스타일링 */
.text-end {
	justify-content: flex-end; /* Flex 컨테이너 내에서 오른쪽 정렬 */
	display: flex;
}

.text-start {
	justify-content: flex-start; /* Flex 컨테이너 내에서 왼쪽 정렬 */
	display: flex;
}

/* Style for chat bubble container */
.chat-container {
	max-height: 650px; /* Adjust as needed */
	overflow-y: auto;
}
</style>

<div class="wrapper">
	<div class="content">
		<h1>&nbsp;</h1>
		<div class=""
			style="background-color: rgb(189, 215, 238); width: 100%; height: 794px; margin: 0 0 0 40px;">

			<div class="container-fluid">

				<div class="row d-flex justify-content-evenly"
					style="width: 100%; height: 780px;">

					<div class="col-md-4" style="padding-left: 15px; height:350px;">
						<br />

						<div class="text-center">
							<h4>전방카메라</h4>
						</div>
						<div class="row">
							<div class="text-right col-12">
								 <iframe width= "498px;" height="335px;" style="border-radius: 10px; border:none;"
									src="http://127.0.0.1:8000/abcs/video"></iframe>
								<!-- <img src="http://127.0.0.1:5000/abcs/video" alt="noimage"
									width= "498px;" height="350px;" style="border-radius: 10px;" /> -->
							</div>
						</div>


						<div style="height:300px; border-radius: 10px;">
							<iframe class="w-100" width="480px;" height="384px"
								style="border: none; border-radius: 10px;"		
								src="<%=request.getContextPath()%>/control/live"> </iframe>
						</div>
					</div>



					<!-- 승차리스트 -->

					<div class="col-4" style="padding-left: 23px; height:400px;">
						<br />
						<div class="text-center">
							<h4 style="width: 470px;">승차 리스트</h4>
						</div>
						<div id="boardingListchu" class="table-responsive p-0 text-center"
							style="background: rgb(255, 255, 255, 0.7); width: 470px; height: 700px;">
							<div id="keyword" class="card-tools">
								<div class="input-group row">
									<select class="form-control col-md-3" name="perPageNum"
										id="perPageNum" onchange="">
										<option value="10">정렬개수</option>
									</select> <select class="form-control col-md-3" name="searchType"
										id="searchType">
										<option value="">검색구분</option>
									</select>
									<!-- keyword -->
									<input class="form-control" type="text" name="keyword"
										placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" />
									<!-- end : search bar -->
								</div>
							</div>
							<table class="table table-bordered table-hover" id="boardingList">

							</table>
							<%@ include file="/WEB-INF/views/module/pagination.jsp"%>
						</div>
						<br />
					</div>

					<div class="col-md-4">
						<br />
						<div class="text-center">
							<h4 style="width: 460px; border-radius: 10px;">메신저</h4>
						</div>

						<iframe id="chat" width="460px" height="700px"
							style="border: none;" src="http://localhost:3000/"> </iframe>

					</div>
				</div>



			</div>

		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<!-- handlebars -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="boarding-list-template">

	<tr>
		<th>정류소 번호</th>
		<th>원생 사진</th>
		<th>원생 이름</th>
		<th>벨트 유무</th>
	</tr>					
									
	{{#each .}}		
	<tr>
		<td>{{station_num }}</td>
		<td>
			<div class="manPicture" id="pictureView" data-id="{{child_id}}" style="display:block;border-radius:100%; width:32px;height:32px;margin:0 auto;"></div>
		</td>
		<td>{{child_name }}</td>
		<td><input type="radio" id="belt_radio" disabled checked></td>
	</tr>
	{{/each}}

</script>


<script>

	var board_func = Handlebars.compile($("#boarding-list-template").html());

	function refreshBoardingList(){

		$.ajax({
			url: '<%=request.getContextPath()%>/control/boardingList',
			method: 'GET',
			dataType: 'json',
			success: function(data){
				console.log(data);
				$('#boardingList').html(board_func(data));
				MemberPictureThumb("<%=request.getContextPath()%>");
			},
			error: function(xhr, status, error){
				console.error('승차 목록 새로 고침 오류:', error);
			}
		});
	}
	
	setInterval(refreshBoardingList, 1000);

</script>


<script>
	refreshBoardingList();
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>