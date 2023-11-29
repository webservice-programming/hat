<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<% // 로그인 실패시 사용자에게 안내
  if (request.getAttribute("login") != null || request.getAttribute("error") != null) { // 에러 파라미터 받을 경우 %>
<script>
  alert('아이디 또는 비밀번호가 일치하지 않습니다.');
</script>
<% } %>
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
<jsp:include page="navbar.jsp" />
<div class="container" style="padding-top: 150px;">
<!-- 헤드라인 -->
  <div class="d-grid gap-2 col-6 mx-auto">
    <figure class="text-center">
      <h2><strong>로그인</strong></h2>
      <div class="d-grid gap-2 col-6 mx-auto">
        <hr>
      </div>
    </figure>
  </div>

  <div>
    <div>
      <div class="d-grid gap-2 col-6 mx-auto"><!-- 크기 조절 용 -->
        <div class="d-grid gap-2 col-6 mx-auto">
<!-- 아이디, 비밀번호 입력 = 로그인 -->
          <div class="form-group mb-2">
            <input type="text" class="form-control" id="input-id" placeholder="아이디" name="userID" maxlength="20">
          </div>
          <div class="form-group mb-3">
            <input type="password" class="form-control" id="input-pwd" placeholder="비밀번호" name="userPassword" maxlength="20">
          </div>
          <button type="button" class="btn btn-dark" onclick="onclick_link_multi_val('user', 'login', ['uid', 'upw'], ['input-id', 'input-pwd'])">로그인</button>

          <div style="text-align: center;"><!-- 찾기 버튼 병렬 용 -->
<!-- 아이디 찾기 버튼 -->
            <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#findId">아이디찾기</button>
<!-- 아이디 찾기 버튼 - Modal -->
            <div class="modal fade" id="findId" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel1">아이디 찾기</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="form-floating mb-3">
                      해당 이메일로 아이디 정보를 보내드립니다.(구현중)
                    </div>
                    <div class="form-floating mb-3">
                      <input type="email" class="form-control" id="UserEmail" placeholder="name@example.com">
                      <label for="UserEmail">이메일 주소</label>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-dark">확인</button>
                  </div>
                </div>
              </div>
            </div>

<!-- 비밀번호 찾기 버튼 -->
            <button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#findPass">비밀번호찾기</button>
<!-- 비밀번호 찾기 버튼 - Modal -->
            <div class="modal fade" id="findPass" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel2">비밀번호 찾기</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="form-floating mb-3">
                      회원가입시 입력하셨던 이메일로 비밀번호 정보를 보내드립니다.(구현중)
                    </div>
                    <div class="form-floating mb-3">
                      <input type="text" class="form-control" id="UserID" placeholder="ID">
                      <label for="UserEmail">아이디</label>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-dark">확인</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
<!-- 회원가입 버튼 -->
        <div class="d-grid gap-2 col-6 mx-auto">
          <hr>
          <button type="button" class="btn btn-dark" onclick="onclick_static('SignUp.jsp')">회원가입</button>
        </div>
      </div>
    </div>
  </div>
  <br/>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/btn_link_func.js?ver=1"></script>
<script src="js/login.js?ver=0"></script>

</body>
</html>