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
    <link href="css/index.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="navbar.jsp"/>
<%-- 페이지 컨텐츠: 사실상의 body --%>
<div class="container">
    <%-- 검색 창 --%>
    <div class="card text-white bg-secondary my-5 py-4 text-center">
        <div class="card-body">
            <h2 class="card-title mb-3" id="test-id">모임을 찾아보세요</h2>
            <div class="input-group mb-3 px-5">
                <input type="text" class="form-control" placeholder="게시글 제목을 입력해보세요" aria-label="게시글 제목 입력" aria-describedby="search-button" id="search-input-id" />
                <button class="btn btn-dark" type="button" id="search-button" onclick="onclick_link_innerval('post', 'search', 'pname', 'search-input-id');">검색</button>
            </div>
        </div>
    </div>
    <%--  카테고리 목록들  --%>
    <div class="row gx-4 gx-lg-5">
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', 'all');">
                    <h2 class="card-title">전체</h2>
                    <p class="card-text">어떤 모임들이 있나 먼저 둘러보세요.<br/>다양한 분들이 모집하는 다양한 모임들이 있습니다.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '공부');">
                    <h2 class="card-title">공부</h2>
                    <p class="card-text">다양한 공부를 같이 해보세요.<br/>문학, 코딩, 전공 등등...</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '독서');">
                    <h2 class="card-title">독서</h2>
                    <p class="card-text">책을 다함께 읽어 보아요.<br/>독서 토론도 가능합니다.</p>
                </div>

            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '식사');">
                    <h2 class="card-title">식사</h2>
                    <p class="card-text">다양한 분들과 다양한 음식을 먹어보세요.<br/>한식, 양식, 주류 등등...</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-5">
            <div class="card h-100">
                <div class="card-body clickable-tag" onclick="onclick_link('post', 'category', 'cname', '운동');">
                    <h2 class="card-title">운동</h2>
                    <p class="card-text">어떤 운동이든 모집해 보세요.<br/>구기종목 같은 협력, PT같은 1:1운동 모두 좋습니다.</p>
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