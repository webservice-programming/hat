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
<div class="container my-5">
  <div class="col">
    <div class="card border-danger mb-4">
      <div class="d-flex justify-content-center">
        <h4 class="px-1" >About User</h4>
      </div>
      <div class="d-flex justify-content-between">
	     <div class="col d-flex justify-content-center">이름: ${user.name}</div>
	     <div class="col d-flex justify-content-center">이메일: ${user.email}</div>
	     <div class="col d-flex justify-content-center">아이디: ${user.uid}</div>
      </div>
    </div>
  </div>
</div>
<div class="container">
<h4 class="mx-5">내 게시물</h4>
<c:forEach var="post" items="${mypost}">
  <div class="row px-1 py-1 mt-2">
    <div class="col">
      <div class="card border-danger mb-4 clickable-tag"
           onclick="onclick_link('post', 'detail', 'pid', ${post.getPid()});">
        <div class="card-header d-flex align-items-end" style="background-color:#fde2df">
          <h5 class="px-1" >
            <c:choose>
              <c:when test="${post.is_end == true}">
                <span class="badge bg-black">모집완료</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">모집중</span>
              </c:otherwise>
            </c:choose>
          </h5>
          <h6 class="ms-3 px-1" >${post.getTitle()}</h6>
        </div>
        <div class="card-body">
          <p class="ms-1"><span>${post.location}</span></p>
          <p class="ms-1">소개글 :</p>
          <p class="w-7">${post.introduction}</p>
          <p class="d-flex justify-content-end">${post.getCreated_at()}
          </p>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
<h4 class="mx-5">그룹 게시물</h4>
<c:forEach var="post" items="${group}">
  <div class="container">
    <div class="col">
      <div class="card border-danger mb-4 clickable-tag"
           onclick="onclick_link('post', 'detail', 'pid', ${post.getPid()});">
        <div class="card-header d-flex align-items-end" style="background-color:#fde2df">
          <h5 class="px-1" >
            <c:choose>
              <c:when test="${post.getIs_end() == false}">
                <span class="badge bg-danger">모집중</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-black">모집완료</span>
              </c:otherwise>
            </c:choose>
          </h5>
          <h5 class="ms-3 px-1">${post.getTitle()}</h5>
        </div>
      <div class="card-body">
        <p ><span class="ms-1">장소 : ${post.getLocation()}</span></p>
        <p class="ms-1">소개글 :</p>     
        <p class=" w-7">${post.getContent()}</p>
        <p class="d-flex justify-content-end"><span>${post.updated_at}</span></p>
      </div>
      </div>
    </div>
  </div>
</c:forEach>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>