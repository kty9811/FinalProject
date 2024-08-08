<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/module/header.jsp"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="5">

</head>

<style>
#keyword {
   display: none;
}

body {
   background-color: rgb(189, 215, 238, 1.0);
}

html {
	width: 100%;
	overflow-x:hidden;
	margin:0;
	padding:0;
}

</style>


<div class="text-center" id="information" style="width:498px;">
   <div>
      <h4>실시간 운행정보</h4>
   </div>

   <div style="background-color: rgb(157, 195, 230)">

      <div class="col-md-12" style="height:180px;">
         <c:choose>

            <c:when test="${location.location eq 'ready'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/noBus.png"
                     width="420px" height="155px">
               </div>
            </c:when>

            <c:when test="${location.location eq 'one1'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_자연시티빌.png"
                     width="420px" height="155px">
               </div>
            </c:when>
            <c:when test="${location.location eq 'two2'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_탄방개나리아파트.png"
                     width="420px" height="155px">
               </div>
            </c:when>
            <c:when test="${location.location eq 'three3'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_한양산호아파트.png"
                     width="420px" height="155px">
               </div>
            </c:when>
            <c:when test="${location.location eq 'four4'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_한우리아파트.png"
                     width="420px" height="155px">
               </div>
            </c:when>
            <c:when test="${location.location eq 'five5'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_한가람아파트.png"
                     width="420px" height="155px">
               </div>
            </c:when>
            <c:when test="${location.location eq 'six6'}">
               <div class="col-md-12">
                  <br /> <img
                     src="${pageContext.request.contextPath}/resources/image/station_미래유치원.png"
                     width="420px" height="155px">
               </div>
            </c:when>


         </c:choose>


      </div>

      <div class="row">

         <div class="col-8">
            <br />

            <c:choose>
               <c:when test="${location.location eq 'ready'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 운행준비중</p>
               </c:when>

               <c:when test="${location.location eq 'one1'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (자연시티빌)</p>
               </c:when>

               <c:when test="${location.location eq 'two2'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (탄방개나리아파트)</p>
               </c:when>

               <c:when test="${location.location eq 'three3'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (한양산호아파트)</p>
               </c:when>

               <c:when test="${location.location eq 'four4'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (한우리아파트)</p>
               </c:when>

               <c:when test="${location.location eq 'five5'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (한가람아파트)</p>
               </c:when>

               <c:when test="${location.location eq 'six6'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상태
                     : 자율운행중 (미래유치원)</p>
               </c:when>


            </c:choose>



            <c:choose>
               <c:when test="${location.location eq 'ready'}">

               </c:when>

               <c:when test="${location.location eq 'one1'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     50km/h</p>
               </c:when>

               <c:when test="${location.location eq 'two2'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     30km/h</p>
               </c:when>

               <c:when test="${location.location eq 'three3'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     30km/h</p>
               </c:when>

               <c:when test="${location.location eq 'four4'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     30km/h</p>
               </c:when>

               <c:when test="${location.location eq 'five5'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     30km/h</p>
               </c:when>

               <c:when test="${location.location eq 'six6'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시속:
                     50km/h</p>
               </c:when>


            </c:choose>


            <c:choose>
               <c:when test="${location.location eq 'ready'}">

               </c:when>
               <c:when test="${location.detect eq 'person'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인식 물체: 사람</p>
               </c:when>
               <c:when test="${location.detect eq 'no'}">
                  <p style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인식 물체: 인식된 물체 없음</p>
               </c:when>
            </c:choose>
         </div>

         
      </div>
   </div>

</div>


<%@ include file="/WEB-INF/views/module/common_js.jsp"%>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>