<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	alert("${param.nno}번 공지가 삭제되었습니다.");
	window.close();
	window.opener.location.reload();
</script>