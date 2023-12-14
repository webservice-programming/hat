<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- 사이트 인코딩 설정 및 동적 웹 설정: 추가할 것 -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>아고라</title>
    <!-- Favicon(사이트 타이틀 옆 파비콘) -->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- 코어 CSS/Core theme CSS (부트스트랩 작동에 필요/includes Bootstrap) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous"
    />
    <link href="css/main.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="navbar.jsp"/>
<%-- 페이지 컨텐츠: 사실상의 body --%>
<div class="container">
    <%-- 검색 창 --%>
    <div class="card text-success my-5 py-5 text-center" style="background-image: url('assets/main.png'); background-size: 600px 400px; background-position: center;">
        <div class="card-body">
            <div class="input-group mb-3 mx-auto" style="max-width: 800px; height: 70px;">
                <input type="text" class="form-control" placeholder="모임을 검색해보세요" aria-label="모임 검색" aria-describedby="search-button" id="search-input-id" style="font-size: 18px;"/>
                <button class="btn text-white" style="width: 110px; background-color: #F36F60;" type="button" id="search-button" onclick="onclick_link_innerval('post', 'search', 'pname', 'search-input-id');">검색</button>
            </div>
        </div>
    </div>
    <%--  카테고리 목록들  --%>
    <div class="row gx-4 gx-lg-5">
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', 'all');">
                    <h2 class="card-title">전체</h2>
                    <p class="card-text"><br/>다양한 모임을 찾아보세요.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '공부');">
                    <h2 class="card-title">공부</h2>
                    <p class="card-text"><br/>공부 모임을 찾아보세요.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '독서');">
                    <h2 class="card-title">독서</h2>
                    <p class="card-text"><br/>독서 모임을 찾아보세요.</p>
                </div>

            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '식사');">
                    <h2 class="card-title">식사</h2>
                    <p class="card-text"><br/>식사 모임을 찾아보세요.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '운동');">
                    <h2 class="card-title">운동</h2>
                    <p class="card-text"><br/>운동 모임을 찾아보세요.</p>
                </div>
            </div>
        </div>

    </div>
</div>
<jsp:include page="footer.jsp"/>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/btn_link_func.js?ver=0"></script>

</body>
</html>