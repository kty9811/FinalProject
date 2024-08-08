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
<div class="card" style="width:95%; margin:0 auto">
	<div class="card-header" style="background-color: rgb(189, 215, 238);">
					<h1>공지사항</h1>
					<div class="card-tools"style="background-color: #e7f3ff;" >
				</div>
	
			</div>
		
		
			<div class="row">
				<div class="col-md-12">
					
						<div class="card-header" style="background-color: rgb(189, 215, 238);">
							<h4>글등록</h4>
						</div>
						<!--end card-header  -->
						<div class="card-body" style="background-color: white;">
							<form enctype="multipart/form-data" role="form" method="post" action="regist.do"	name="registForm">
								<div class="form-group">
									<label for="writer">작성자</label> <input type="text"
										id="writer" readonly name="writer" class="form-control"
										value="${loginUser.employee_id}">
								</div>
								<div class="form-group">
									<label for="title">제 목</label> <input type="text"
										id="title" name='title' class="form-control"
										placeholder="제목을 쓰세요">
								</div>
								<div class="form-group">
									<label for="content">내 용</label>
									<textarea class="form-control" name="content" id="content"
										rows="5" placeholder="1000자 내외로 작성하세요."></textarea>
								</div>
	
								<div class="form-group">
									
										<div class="card-header">
											<h5 style="display: inline; line-height: 40px;">첨부파일
												:</h5>
											&nbsp;&nbsp;
											<button class="btn btn-xs btn-primary"
												onclick="addFile_go();" type="button" id="addFileBtn">Add
												File</button>
										</div>
										<div class="card-footer fileInput"></div>
									</div>
							</form>
								</div>
						</div>
					</div>
				</div>
	
		<!--end card-body  -->
		<div class="card-footer" style="background-color: #e7f3ff;">
			<button type="button" class="btn btn-primary" id="registBtn"
				onclick="regist_go();">등 록</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn" id="cancelBtn" style="background-color: rgb(52, 73, 94); color: white;" onclick="CloseWindow();"
				onclick="CloseWindow();">취 소</button>
		</div>
		<!--end card-footer  -->

<!-- end row -->
	

<script>
var dataNum=0;

function addFile_go(){
	//alert("add btn");
	

	if($('input[name="uploadFile"]').length >=5){
		alert("파일추가는 5개까지만 가능합니다.");
		return;
	}
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");	
	$('.fileInput').append(div);
	
	dataNum++;	
}

function remove_go(index){
	//alert(index);
	$('div[data-no="'+index+'"]').remove();
}

function regist_go(){
	//alert("click regist");
	if($("input[name='title']").val()==""){ //form.title.value
		alert("제목은 필수입니다.");
		$("input[name='title']").focus();
		return;
	}
	
	var inputs = $('input[name="uploadFile"]');
	for(var input of inputs){
		//console.log(input.name+" : "+input.value);
		if(input.value==""){
			alert("파일을 선택하세요.");
			input.focus();
			input.click();
			return;
		}
	}	
	
	$("form[role='form']").submit();
	
}

$('.fileInput').on('change',"input[name='uploadFile']",function(event){
	//alert("file change");
	let input = $(this)[0];
		if(input.files[0].size > 1024*1024*40){
			alert("첨부파일크기는 40MB 이하만 가능합니다.");
			input.value="";				
		}
});

</script>

<%@ include file="/WEB-INF/views/module/common_js.jsp"%>

<%@ include file="/WEB-INF/views/module/footer.jsp"%>