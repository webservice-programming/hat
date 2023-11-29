<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>아고라</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="container" style="padding-top: 100px;">
    <div class="d-grid gap-2 col-6 mx-auto">
        <figure class="text-center">
        <h2>회원가입</h2>
        <hr>
        </figure>
    </div>
<div class="member">
    <!-- 1. 이름 -->
    <div class="d-grid gap-2 col-6 mx-auto">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="UserName" placeholder="이름">
            <label for="UserName">이름</label>
        </div>
    <!-- 1. 이메일 -->
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="UserEmail" placeholder="name@example.com">
            <label for="UserEmail">이메일 주소</label>
        </div>
    <!-- 2. 아이디, 비밀번호 -->
        <div class="form-floating mb-1">
            <input type="text" class="form-control" id="UserIdt" placeholder="아이디">
            <label for="UserIdt">아이디</label>
        </div>
        <button type="submit" class="btn btn-dark mb-2" onclick="alert('구현중입니다.')">중복확인</button>
        <div class="form-floating mb-1"></div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="UserPass" placeholder="비밀번호">
            <label for="UserPass">비밀번호</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="UserPassRe" placeholder="비밀번호 재확인">
            <label for="UserPassRe">비밀번호 재확인</label>
        </div>
<%--    <!-- 3. 관심사 -->--%>
<%--        <div class="field birth">--%>
<%--            <select class="form-select" aria-label="Default select example">--%>
<%--                <option selected>관심사 선택</option>--%>
<%--                <option value="1">관심사 1</option>--%>
<%--                <option value="2">관심사 2</option>--%>
<%--                <option value="3">관심사 3</option>--%>
<%--            </select>--%>
<%--        </div>--%>
    </div>
    <!-- 6. 가입하기 버튼 -->
    <div class="d-grid gap-2 col-6 mx-auto" style="padding-top: 20px;">
        <hr>
        <button type="button" class="btn btn-dark" onclick="signup_logic('user', 'register', ['UserName', 'UserEmail', 'UserIdt', 'UserPass', 'UserPassRe'])">회원가입</button>
    </div>
</div>
</div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/signup.js?ver=1"></script>
</body>
</html>