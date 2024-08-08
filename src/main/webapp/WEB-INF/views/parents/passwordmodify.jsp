<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>비밀번호 변경</title>
    <!-- 스타일시트와 자바스크립트 파일을 필요에 따라 추가 -->
</head>
<body>

<div class="container">
    <h2>비밀번호 변경</h2>

    <!-- 액션 메시지 표시 영역 -->
    <c:if test="${not empty message}">
        <div class="alert">
            <p>${message}</p>
        </div>
    </c:if>

    <!-- 비밀번호 변경 폼 -->
    <form action="${pageContext.request.contextPath}/parents/passwordupdate" method="post">
        <div class="form-group">
            <label for="currentPassword">현재 비밀번호:</label>
            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
        </div>
        <div class="form-group">
            <label for="newPassword">새 비밀번호:</label>
            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">비밀번호 변경</button>
        </div>
    </form>
</div>

</body>
</html>
