<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>구인글 등록 페이지</title>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="css/post_register.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<%--<div class="row px-1 py-1 mt-2">--%>
<%--  <div class="col">--%>
<%--    <div class="card mb-4">--%>
<%--      <div class="card-header d-flex align-items-end">--%>
<%--        <form action="" method="get">--%>
<%--          <select name="category" id="category">--%>
<%--            <option>----- 선택하세요 -----</option>--%>
<%--            <option value="공부">공부</option>--%>
<%--            <option value="독서">독서</option>--%>
<%--            <option value="식사">식사</option>--%>
<%--            <option value="운동">운동</option>--%>
<%--          </select>--%>
<%--        </form>--%>
<%--        <textarea cols="50" rows="1" id="title" name="title" class="form-control" placeholder="모임 제목 입력"></textarea>--%>
<%--        <textarea cols="50" rows="1" id="location" name="location" class="form-control" placeholder="지역 입력"></textarea>--%>
<%--      </div>--%>
<%--      <div class="card-body">--%>
<%--        <textarea cols="50" rows="3" id="introduction" name="introduction" class="form-control" placeholder="소개 입력"></textarea>--%>
<%--        <textarea cols="50" rows="10" id="content" name="content" class="form-control" placeholder="내용 입력"></textarea>--%>
<%--        <textarea cols="50" rows="1" id="capacity" name="capacity" class="form-control" placeholder="인원 수 입력"></textarea>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<form method="post" action="<c:url value="/post?action=register"/>">
  <select name="category" id="category">
    <option>----- 선택하세요 -----</option>
    <option value="공부">공부</option>
    <option value="독서">독서</option>
    <option value="식사">식사</option>
    <option value="운동">운동</option>
  </select>
  <textarea cols="50" rows="1" id="title" name="title" class="form-control" placeholder="모임 제목 입력"></textarea>
  <textarea cols="50" rows="1" id="location" name="location" class="form-control" placeholder="지역 입력"></textarea>
  <textarea cols="50" rows="3" id="introduction" name="introduction" class="form-control" placeholder="소개 입력"></textarea>
  <textarea cols="50" rows="10" id="content" name="content" class="form-control" placeholder="내용 입력"></textarea>
  <textarea cols="50" rows="1" id="capacity" name="capacity" class="form-control" placeholder="인원 수 입력"></textarea>
  <input type="hidden" name="writer" id="writer" value="${sessionScope.get("uid")}" >
  <button formaction="javascript:history.back()" class="btn" style="font-size: 18px; float:right">취소</button>
  <button class="btn" style="font-size: 18px; float:right" type="submit">등록</button>
</form>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>