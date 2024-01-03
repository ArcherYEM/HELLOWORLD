<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>HelloWorld</title>
      <link  href="/resources/css/index/main.css" rel="stylesheet">
      <link  href="/resources/css/index/notice.css" rel="stylesheet">
      <link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
      <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
   </head>
   <body>
   <div class="index-frame">
      <div class="divIndexMenu index-header">
	      <div class="index-header-left">
	         <a class="logoATag" href="<c:url value='/'/>">
	           <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	         </a>
	       </div>
	       <h5 class="right" id="userDotori">내 도토리 : <span id="userDotoriCnt">${sessionScope.userDotoriCnt}</span>개</h5>
	       <div class="index-header-right">
	            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
	            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
	       </div>
      </div>
      
      <div id="divHiUser">
		  <p class="hello-message" id="helloMessage">
		    HelloWorld 에 오신 걸 환영합니다.
		  </p>
	  </div>
	  
      <div class="divIndexMain">
         <div id="divHome" class="divLogin">
            <div >
               <form class="frmLogin" id="frmLogin" method="POST" action="/index/member/login">
                  <!-- <label for="userEmail">아이디: </label> -->
                  <input type="email" id="userEmail" name="userEmail" placeholder="Email"><br>
                  <br>
<!--                   <label for="userPw">비밀번호: </label> -->
                  <input type="password" id="userPassword" name="userPassword" placeholder="Password"><br>
                  <br>
                  <input type="button" id="btnLogin" value="로그인"><br>
                  <br>
                  <!-- 슬라이드 이미지 추가하면 주석 풀기 <input type="button" style="width: 200px" id="btnNotice" value="공지사항"><br>
                  <br> -->
               </form>
            </div>
            <div >
               <a class="signUpATag" href="/index/member/signUp">회원가입</a>
               <a href="/index/member/findId">아이디</a>/ 
               <a href="/index/member/findPwView">비밀번호 찾기</a>
            </div>
            
         </div>
         
<!--          로그인후 시점 -->
         <div id="divLogin" class="divLogin">
         	<div class="my-title">
        	</div>
         	<div class="" id="divMainMinimi">
	          	<img class="index-my-minimi" id="mainMinimi" src="<c:url value='${sessionScope.userMinimi}'/>"/>
        	</div>
    	    <form id="logoutForm" action="<c:url value='/main/member/logout' />" method="post">
	         	<div class="my-btn">
		    	    <input type="button" class="mainBtn1" id="btnGoMinihome" value="내 미니홈피">
		        	<input type="button" class="mainBtn2" id="btnLogout" value="로그아웃">
		        </div>
	        </form>
         </div>
<!--          로그인후 종점 -->

         <div id="divMainSlide">
            <div class="slideshow-container">
   
               <div class="mySlides fade">
                 <img src="<c:url value="/resources/images/mainSlideImg1.jpg"/>" >
               </div>
               
               <div class="mySlides fade">
                 <img src="<c:url value="/resources/images/sildeImg1.png"/>" >
               </div>
               <div class="divdot">
                 <span class="dot"></span> 
                 <span class="dot"></span> 
                    <!-- <span class="dot"></span>  -->
               </div>
               <%-- <div class="mySlides fade">
                 <img src="<c:url value="/resources/images/mainSlideImg1.jpg"/>" style="width:100%">
               </div> --%>
            
            </div>
            
         </div>
         
      </div>
         
    </div>
      
	<div class="bottom-fix">
		<hr>
		<h1>team core</h1>
		<a href="/mnHome/mainView" target="_blank" style="width:1200px; height:720px;">미니홈피 가기</a>
            <!-- ★★★추후 새창으로 변환 예정★★★ -->
<!--      <button id="targetElement" 
               onclick="window.open('/helloworld/minihome/main'
               , 'window_name', 'width=1200px, height=720px, location=no, status=no, scrollbars=yes');">미니홈피</button>
-->             
      </div>
      
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
    <script>
    // Ajax 유저 로그인
     document.getElementById('frmLogin').addEventListener('keydown', function (e) {
         if (e.key === 'Enter') {
            loginUser();
         }
     });
    
     document.getElementById('btnLogin').addEventListener('click', loginUser);

     function loginUser() {
        let userEmail = document.getElementById('userEmail').value;
        let userPassword = document.getElementById('userPassword').value;

        let jsonData = {
           "userEmail": userEmail,
           "userPassword": userPassword
        };

        $.ajax({
           method: 'POST',
           url: "<c:url value='/index/member/login' />",
           contentType: 'application/json',
           data: JSON.stringify(jsonData)
        }).done(function (json) {
        	console.log(json);
        	
           let helloMessage = document.getElementById('helloMessage');
           let userDotori = document.getElementById('userDotori');
           let userMinimiElement = document.getElementById('mainMinimi');

           if (json.resultCode === '1') {
              helloMessage.innerText = json.userNickname + '  님 환영합니다.';
              userDotori.innerText = '내 도토리 : ' + json.userDotoriCnt + ' 개';
              userMinimiElement.src = "<c:url value='" + json.contentPath + "'/>";
              divHome.style.display = 'none';
              divLogin.style.display = 'block';
           } else {
              alert('아이디와 비밀번호를 다시 확인해 주세요.');
              helloMessage.innerText = '안녕하세요. HelloWorld에 오신 걸 환영합니다.';
              divHome.style.display = 'block';
              divLogin.style.display = 'none';
           }
        });
     }
       
       let slideIndex = 0;
       showSlides();
 
       function showSlides() {
         let i;
         let slides = document.getElementsByClassName("mySlides");
         let dots = document.getElementsByClassName("dot");
         for (i = 0; i < slides.length; i++) {
           slides[i].style.display = "none";  
         }
         slideIndex++;
         if (slideIndex > slides.length) {slideIndex = 1}    
         for (i = 0; i < dots.length; i++) {
           dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex-1].style.display = "block";  
         dots[slideIndex-1].className += " active";
         setTimeout(showSlides, 2000); // Change image every 2 seconds
       }
       
       $(function() {
           let userEmail = '<c:out value="${sessionScope.userId.userEmail}" />';
           let userNickname = '<c:out value="${sessionScope.userId.userNickname}" />';
           let helloMessage = document.getElementById('helloMessage');
           let divHome = document.getElementById('divHome');
           let divLogin = document.getElementById('divLogin');
           
           if (userEmail === '') {
               divHome.style.display = 'block';
               divLogin.style.display = 'none';
           } else {
          	 helloMessage.innerText = '안녕하세요. ' + userNickname + '님!!';
               divHome.style.display = 'none';
               divLogin.style.display = 'block';
           }
       });
    
    document.getElementById('btnGoMinihome').addEventListener('click', function() {
       location.href = "<c:url value="/mnHome/mainView" />"
    });
    
    document.getElementById('btnLogout').addEventListener('click', function() {
       location.href = "<c:url value="/index/member/logout" />"
    });
    
    window.onload = function() {
        let userDotoriElement = document.getElementById('userDotori');
        let userDotoriCnt = '${sessionScope.userDotoriCnt}';

        if (userDotoriElement) {
            if (userDotoriCnt.trim() !== '' && userDotoriCnt !== 'null') {
                userDotoriElement.innerHTML = '내 도토리 : ' + userDotoriCnt + ' 개';
                userDotoriElement.style.display = 'block';
            } else {
                userDotoriElement.innerHTML = '0 개'; // 또는 다른 기본값
                userDotoriElement.style.display = 'none';
            }
        }
    };
	</script>
   </body>
</html>
