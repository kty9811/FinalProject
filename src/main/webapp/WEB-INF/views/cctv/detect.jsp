<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/WEB-INF/views/module/header.jsp" %>
<head>
	<meta http-equiv="Refresh" content="1">
</head>
<style>
 .recognition {
       
        background-color: rgba(255, 255, 255, 0.65);
        display: flex;
        flex-direction: column;
        
    }
    .human-recognition,
    .car-recognition,
    .motorcycle-recognition {
        font-size: 22px; /* 내용 글씨 크기 설정 */
        margin-bottom: 5px; /* 내용 간격 설정 */
        text-align: left; /* 왼쪽 정렬 */
        padding-left: 20px;
    }
    .AI.title {
        font-size: 30px; /* 제목 크기 설정 */
        font-weight: bold; /* 제목 굵기 설정 */
        margin-bottom: 10px; /* 제목과 내용 사이 간격 설정 */
        margin-top: 15px;
        text-align: center; /* 가운데 정렬 */
    }
</style>


<div class="recognition">
    		<div class="AI title">AI 실시간 인식</div>
    		
    		<div class="human-recognition" style="margin-top:50px;">
    			<c:choose>
    				<c:when test="${location.cctv_person eq 'no'}">
    					<p style="text-align: left;"></p>
    				</c:when>
    				<c:when test="${location.cctv_person eq 'person'}">
    					<p style="text-align: left;">사람 인식됨 (어린이 보호 주의!)</p>
    				</c:when>
    			</c:choose>
    		</div>
    		
    		<div class="car-recognition">
    			<c:choose>
    				<c:when test="${location.cctv_car eq 'no'}">
    					<p style="text-align: left;"></p>
    				</c:when>
    				<c:when test="${location.cctv_car eq 'car'}">
    					<p style="text-align: left;">차량 인식됨 (교통 사고 주의!)</p>
    				</c:when>
    			</c:choose>
    		</div>
    		
</div>
	
	
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
