<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hello World</title>
		<link  href="/resources/css/index/main.css" rel="stylesheet">
	</head>
		
	<body style="background-color: white">
		<div class="grid-container">
		  <div class="grid-item"></div>
		  <div class="grid-item">
		  	<div id="divUserInfo">
		  		<div id="signUplogo">
					<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				</div>
				
			  	<h2 style="text-align : center">회원가입</h2>
			  	
				<form id="frmSignUp" method="POST" action="/index/member/signUpConfirm">
					<label for="userName">이름</label><br>
					<input type="text" id="userName" name="userName" placeholder="이름" class="widthFull"><br>
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" name="userBirth" placeholder="생년월일 ex)19931013" class="widthFull">
					성별 : <input type="button" id="btnMale" value="남자">
					<input type="button" id="btnFemale" value="여자"><br>
					<label for="userEmail">이메일주소</label><br>
					<input type="email" id="userEmail" name="userEmail" placeholder="이메일주소" class="widthFull"><br>
					<label for="userPassword">비밀번호</label><br>
					<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()"><br>
					<label for="userPassword2">비밀번호 확인</label><br>
					<input type="password" id="userPassword2" name="userPassword2" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()"><br>
					<div id="passwordMatchMessage"></div>
					<label for="userNickName">닉네임</label><br>
					<input type="text" id="userNickname" name="userNickname" placeholder="닉네임" class="widthFull"><br>
					<label for="userPhone">핸드폰번호</label><br>
					<input type="text" id="userPhone" name="userPhone" placeholder="핸드폰번호" class="widthFull"><br>
					<textarea style="width: 100%; height: 200px; margin-top:20px;resize: none;" value="안내문">개인정보수집동의</textarea>
					<br>
		
					 <input type="radio"  name="confirm" value="confirm"><label for="confirm">동의</label>
					 <input type="radio"  name="confirm" value="noConfirm"><label for="confirm">비동의</label><br>
					<br>
					<input style="width: 100%; height: 50px; " type="button" id="btnSignUp" value="회원가입">
				</form>
		  	</div>
			  	
		  </div>
		  <div class="grid-item"></div>  
		</div>
		

		
		<script>
			document.getElementById('btnSignUp').addEventListener('click', function() {
					document.getElementById('frmSignUp').submit();
			});
			
			let selectedBtn = null;

			  document.getElementById('btnMale').addEventListener('click', function() {
				  btnClick('btnMale');
			  });

			  document.getElementById('btnFemale').addEventListener('click', function() {
				  btnClick('btnFemale');
			  });

			  function btnClick(btnId) {
			    if (selectedBtn) {
			    	selectedBtn.classList.remove('selected');
			    }

			    selectedBtn = document.getElementById(btnId);
			    selectedBtn.classList.add('selected');
			  }
			  
			  function checkPasswordMatch() {
				    var password = document.getElementById('userPassword').value;
				    var confirmPassword = document.getElementById('userPassword2').value;

				    if (password === confirmPassword) {
				        document.getElementById('passwordMatchMessage').innerHTML = '<span style="color: #008000;">비밀번호가 일치합니다.</span>';;
				        document.getElementById('btnSignUp').disabled = false;
				    } else {
				        document.getElementById('passwordMatchMessage').innerHTML ='<span style="color: red;">비밀번호가 일치하지 않습니다.</span>';;
				        document.getElementById('btnSignUp').disabled = true;
				    }
				}
		</script>
	</body>
</html>