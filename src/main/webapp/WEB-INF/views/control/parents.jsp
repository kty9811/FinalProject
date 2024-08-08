<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>
<%@ include file="/WEB-INF/views/module/navbar_parents.jsp"%>

<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Refresh" content="5"> -->
</head>

<style>
#keyword{
	display:none;
}

body {
	background-color: #e7f3ff;
	
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

</style>

<div class="wrapper">
		<div class="content" style="margin-left:150px; margin-right:150px;">
			<h1>&nbsp;</h1>
			<div class=""
				style="background-color: rgb(189, 215, 238); width: 100%; height: 794px; margin: 0 0 0 40px; border-radius: 10px;">

				<div class="container-fluid" style="border-radius: 10px;">

					<div class="row d-flex justify-content-evenly" style="width: 100%; height: 780px;">

						<div class="col-md-4" style="padding-left:15px;">
							<br />

							<div class="text-center" style="border-radius: 10px;">
								<h4>전방카메라</h4>
							</div>
							<div class="text-center">
								<iframe width= "498px;" height="300px;" style="border-radius: 10px; border:none;"
									src="http://127.0.0.1:8000/abcs/video_2"></iframe>
							</div>


							<br />

							<div class="text-center" style="width: 480px; margin-left:15px;">
								<iframe class="w-100" width="400px;" height="384px" style="border:none; border-radius: 10px;"
										src="<%=request.getContextPath()%>/control/live">
								</iframe>
							</div>
							
						</div>






						<!-- 승차리스트 -->

						<div class="col-md-4" style="padding-left:50px; width:400px; border-radius: 10px; ">
							<br />
							<div class="text-center">
								<h4 style="">승차 리스트</h4>
							</div>
							<div id="boardingListchu" class="table-responsive p-0 text-center"
								style="background: rgb(255, 255, 255, 0.7); width: 470px; height: 700px;">
								<div id="keyword" class="card-tools">
									<div class="input-group row">
										<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="">
											<option value="10">정렬개수</option>
										</select> <select class="form-control col-md-3" name="searchType" id="searchType">
											<option value="">검색구분</option>
										</select>
										<!-- keyword -->
										<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.keyword }" />
										<!-- end : search bar -->
									</div>
								</div>
								<table class="table table-bordered table-hover" id="boardingList">
								
								</table>
								<%@ include file="/WEB-INF/views/module/pagination.jsp"%>
							</div>
							<br />
						</div>

							<div class="text-center" style="width: 480px; margin-left:20px;">
								<iframe class="w-100" width="400px;" height="425px" style="border:none; border-radius: 10px;"
										src="<%=request.getContextPath()%>/control/arlert">
								</iframe>
							</div>
					</div>



				</div>

			</div>
		</div>
</div>


<%@ include file="/WEB-INF/views/module/common_js.jsp"%>


<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="boarding-list-template" >

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
	
	setInterval(refreshBoardingList, 60000);

</script>




<script>
	

	function forward(){
		$.ajax({
			url: '<%=request.getContextPath()%>/action?go=forward',
			type: 'GET',
			success: function(response){
				console.log('Forward request sent successfully');
			},
			error: function(xhr, status, error){
				console.log('Error sending forward request:', error);
			}
		});
	}
	
	function stop(){
		$.ajax({
			url: '<%=request.getContextPath()%>/action?go=stop',
			type: 'GET',
			success: function(response){
				console.log('Stop request sent successfully');
			},
			error: function(xhr, status, error){
				console.error('Error sending stop request:', error);
			}
		});
	}
	

</script>





<script>
	refreshBoardingList();
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>