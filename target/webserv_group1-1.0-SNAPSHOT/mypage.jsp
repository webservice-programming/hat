<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>내 정보 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="css/mypage.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<div class="row px-1 py-1 mt-2">
  <div class="col">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-center">
        <h3 class="px-1" >내정보</h3>
      </div>
      <div class="card-body">
        <ul>
          <li class="px-1" style="font-size: 24px">이름: ${user.name}</li>
          <li class="px-1" style="font-size: 24px">이메일: ${user.email}</li>
          <li class="px-1" style="font-size: 24px">아이디: ${user.uid}</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<h2>내 게시물</h2>
<c:forEach var="post" items="${mypost}">
  <div class="row px-1 py-1 mt-2">
    <div class="col">
      <div class="card mb-4 clickable-tag"
           onclick="onclick_link('post', 'detail', 'pid', ${post.getPid()});">
        <div class="card-header d-flex align-items-end">
          <h4 class="px-1" >
            <c:choose>
              <c:when test="${post.is_end == true}">
                <span class="badge bg-danger">모집완료</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-success">모집중</span>
              </c:otherwise>
            </c:choose>
          </h4>
          <h3 class="ms-3 px-1" >${post.getTitle()}</h3>
        </div>
        <div class="card-body">
            <%--              <p class="me-1 list_detail"><span class="me-3">모집종료날짜</span><span class="ms-5">지역</span></p>--%>
          <p class="me-1 list_detail"><span>${post.location}</span></p>
          <p class="px-5 py-3">${post.introduction}</p>
          <p class="d-flex justify-content-between list_detail">
            <span>${post.people.size()}/${post.capacity}명</span><span>${post.getCreated_at()}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
<h2>그룹 게시물</h2>
<c:forEach var="post" items="${group}">
  <div class="row px-1 py-1 mt-2">
    <div class="col">
      <div class="card mb-4 clickable-tag"
           onclick="onclick_link('post', 'detail', 'pid', ${post.getPid()});">
        <div class="card-header d-flex align-items-end">
          <h4 class="px-1" >
            <c:choose>
              <c:when test="${post.getIs_end() == false}">
                <span class="badge bg-success">모집중</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">모집완료</span>
              </c:otherwise>
            </c:choose>
          </h4>
          <h3 class="ms-3 px-1" >${post.getTitle()}</h3>
        </div>
        <div class="card-body">
            <%--              <p class="me-1 list_detail"><span class="me-3">모집종료날짜</span><span class="ms-5">지역</span></p>--%>
          <p class="me-1 list_detail"><span>${post.getLocation()}</span></p>
          <p class="px-5 py-3">${post.getIntroduction()}</p>
          <p class="d-flex justify-content-between list_detail">
            <span>${post.getPeople().size()}/${post.getCapacity()}명</span><span>${post.getCreated_at()}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>