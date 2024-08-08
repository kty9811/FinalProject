<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("${param.pno}번 방명록이 삭제되었습니다.");
	window.close();
	window.opener.location.reload();
</script>