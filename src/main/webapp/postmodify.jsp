<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>구인글 수정 페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="css/postmodify.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% request.setCharacterEncoding("UTF-8"); %>
<form method="post" action="<c:url value="/post?action=edit"/>">
  <div class="row px-1 py-1 mt-2">
    <div class="col">
      <div class="card mb-4">
        <div class="card-header d-flex align-items-end">
          <h4 class="px-1" >
            <c:choose>
              <c:when test="${post.is_end == true}">
                <span class="badge bg-black">모집완료</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-danger">모집중</span>
              </c:otherwise>
            </c:choose>
          </h4>
          <h3 class="ms-3 px-1" ><%=request.getParameter("title")%></h3>
        </div>
        <div class="card-body">
          <ul>
            <p class="me-1 list_detail"><span class="ms-5"><%=request.getParameter("location")%></span></p>
            <textarea cols="50" rows="10" name="content" id="content" class="form-control" placeholder="내용 입력"><%=request.getParameter("content")%></textarea>
            <p class="d-flex justify-content-between align-self-end list_detail"><span><%=request.getParameter("size")%>/<%=request.getParameter("capacity")%>명</span><span>${post.updated_at}</span></p>
            <input type="hidden" name="postmodify" id="postmodify" value="detail_page.jsp">
            <input type="hidden" name="title" id="title" value=<%=request.getParameter("title")%>>
            <input type="hidden" name="location" id="location" value=<%=request.getParameter("location")%>>
            <input type="hidden" name="introduction" id="introduction" value=<%=request.getParameter("introduction")%>>
            <input type="hidden" name="capacity" id="capacity" value=<%=request.getParameter("capacity")%>>
            <input type="hidden" name="category" id="category" value=<%=request.getParameter("category")%>>
            <input type="hidden" name="pid" id="pid" value=<%=request.getParameter("pid")%>>
            <button class="d-flex justify-content-end btn" style="font-size: 18px; float:right" type="submit">완료</button>
          </ul>
        </div>
      </div>
    </div>
  </div>
</form>
  <form style="float:right;" action="javascript:history.back()">
    <button class="btn" style="font-size: 18px">취소</button>
  </form>
</div>

<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>