<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
<title>리뷰 등록 페이지 </title>
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="css/post_register.css">
</head>
<body>
<jsp:include page="navbar.jsp"/>
<% request.setCharacterEncoding("UTF-8"); %>
<form method="post" action="<c:url value="/post?action=registerReview"/>">
	<div class="m-5">
	  <div class="mx-5">
	  
	  <br>
		  <textarea cols="50" rows="1" id="title" name="title" class="form-control" placeholder="리뷰 제목 입력 " ></textarea><br>
		  <textarea cols="50" rows="7" id="content" name="content" class="form-control" placeholder="내용 입력"></textarea><br>
		  	  <select name="score" id="score">
			    <option>별점을 선택하세요 </option><br>
			    <option value="1">1</option>
			    <option value="2">2</option>
			    <option value="3">3</option>
			    <option value="4">4</option>
			    <option value="5">5</option>
			  </select><br>
		  <input type="hidden" name="pid" id="pid" value=<%=request.getParameter("pid")%>>
		  <input type="hidden" name="uid" id="uid" value=<%=request.getParameter("uid")%>>
		  <button formaction="javascript:history.back()" class="btn" style="font-size: 18px; float:right">취소</button>
		  <button class="btn" style="font-size: 18px; float:right" type="submit">등록</button>
	  </div>
	  </div>
	 <br>
</form>

<jsp:include page="footer.jsp"/>
</body>
</html>