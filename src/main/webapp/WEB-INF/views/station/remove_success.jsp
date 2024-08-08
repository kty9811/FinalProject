<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("${child_name}님이 삭제되었습니다.");
	window.location.href = document.referrer;
			
	window.opener.location.reload();
</script>