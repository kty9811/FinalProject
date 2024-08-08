<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 변경 성공</title>
</head>
<body>

<div class="container">
    <h1>비밀번호 변경이 완료되었습니다.</h1>
    <p>비밀번호가 성공적으로 변경되었습니다. 안전한 사용을 위해 로그아웃 후 다시 로그인해 주세요.</p>
    <a href="${pageContext.request.contextPath}/modify?parents_id=${parents_id}">로그인 페이지로 이동</a>
</div>

</body>
</html>
