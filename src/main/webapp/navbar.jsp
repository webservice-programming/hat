<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: gdaegeun539
Date: 2022-11-30
Time: 오전 10:00
To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 폰트 적용 css--%>
<link rel="stylesheet" href="css/navbar.css" />

<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #F36F60">
  <div class="container">
    <a class="navbar-brand text-white" href="<c:url value="/"/>">DAMOA</a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a
                  class="nav-link dropdown-toggle"
                  id="navbarDropdown"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
          >카테고리</a>
          <ul
                  class="dropdown-menu dropdown-menu-end"
                  aria-labelledby="navbarDropdown"
          >
            <li><a class="dropdown-item" href="<c:url value="/post?action=category&cname=all"/>">전체</a></li>
            <li><a class="dropdown-item" href="<c:url value="/post?action=category&cname=공부"/>">공부</a></li>
            <li><a class="dropdown-item" href="<c:url value="/post?action=category&cname=독서"/>">독서</a></li>
<%--            <li><hr class="dropdown-divider" /></li>--%>
            <li><a class="dropdown-item" href="<c:url value="/post?action=category&cname=식사"/>">식사</a></li>
            <li><a class="dropdown-item" href="<c:url value="/post?action=category&cname=운동"/>">운동</a></li>
          </ul>
        </li>
        <c:choose>
            <c:when test="${sessionScope.uid eq null}">
<%--               세션이 없을 때 수행: 로그인 버튼 생성 --%>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<c:url value="/login.jsp"/>">로그인</a>
                </li>
            </c:when>
            <c:otherwise>
<%--               세션이 있을 때 수행: 마이페이지 및 로그아웃 버튼 생성 --%>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/user?action=mypage&uid=${sessionScope.uid}"/>">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="<c:url value="del_session.jsp"/>">로그아웃</a>
                </li>
            </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>
