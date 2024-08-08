<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("원생등록을 성공했습니다.");
	window.close();
	window.opener.location.href='<%=request.getContextPath()%>/parents/detail_parents.do?parents_id=${parents_id}';
</script>