<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 인클루드~~ -->

<nav class="navbar navbar-expand-lg navbar-light bg-light">
   <a class="navbar-brand"
      href="${pageContext.request.contextPath }/board/main_page.do">메인페이지</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
      aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
   </button>
   <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav mr-auto">
         <li class="nav-item active"><a class="nav-link"
            href="${pageContext.request.contextPath }/board/main_page.do">Home
               <span class="sr-only">(current)</span>
         </a></li>
         <li class="nav-item"><a class="nav-link" href="#">되나</a></li>
         <li class="nav-item"><a class="nav-link" href="#">안되나</a></li>

      </ul>
      <c:choose>
         <c:when test="${!empty sessionUser }">
            <ul class="nav navbar-nav navbar-right">
               <li class="nav-item dropdown"><a
                  class="nav-link dropdown-toggle" href="#"
                  id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
                     ${sessionUser.member_nick }님 </a>
                  <div class="dropdown-menu"
                     aria-labelledby="navbarDropdownMenuLink">
                     <a class="dropdown-item"
                        href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
                     <a class="dropdown-item" href="#">게시글</a> <a
                        class="dropdown-item" href="#">Something else here</a>
                  </div></li>
            </ul>
         </c:when>
         <c:otherwise>
            <ul class="nav navbar-nav navbar-right">
               <li class="nav-item" style="list-style: none"><a
                  class="nav-link"
                  href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
               </li>
            </ul>
         </c:otherwise>
      </c:choose>

   </div>
</nav>
<!-- 
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">홈</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">자유 게시판 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">쇼핑몰</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">경매</a>
      </li>
      </ul>
<c:choose>
	<c:when test="${!empty sessionUser }">
      <ul class="nav navbar-nav navbar-right">
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${sessionUser.member_nick }
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a>
          <a class="dropdown-item" href="#">마이페이지</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      </ul>	
	</c:when>
	<c:otherwise>
      <li class="nav-item justify-content-end" style="list-style:none">
        <a class="nav-link" href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>
      </li>		
	</c:otherwise>
</c:choose>      
      

    </ul>
  </div>
</nav>


      
      <!-- 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
       
   -->