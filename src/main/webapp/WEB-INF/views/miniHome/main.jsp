<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
<meta charset="UTF-8">
<title>미니홈피</title>
<link rel="stylesheet" href="../../../../resources/css/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">

</head>
<body>
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="profile-container">
					<div class="header profile-title font-neo">TODAY 404 | TOTAL
						500</div>
					<div class="box profile-box">
						<div class="profile-image">
							<img class="profile-image-img"
								src="../../../../resources/images/profile.jpg" alt="프로필 이미지" />
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-text font-kyobohand">
							안녕하세요 이주빈 입니다.<br /> 미모최강 풀스택 개발자 입니다.
						</div>
						<div class="profile-history">
							<a href="#" class="profile-hs-edit">▶Edit</a> <a href="#"
								class="profile-hs-hs">▶History</a>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-username font-kyobohand">이주빈&#128698;</div>
						<div class="profile-dropDown">
							<select>
								<option value="" disabled selected hidden>파도타기</option>
								<option value="temp1">이정은(jungeun@gmail.com)</option>
								<option value="temp2">이진우(junwoo@naver.com)</option>
								<option value="temp3">채승원(seungwon@daum.net)</option>
								<option value="temp4">양은모(eunmo@nate.com)</option>
							</select>
						</div>
					</div>
				</div>
				<div class="content-container">
					<div class="header content-title">
						<div class="content-title-name">지구 최강 미모 이주빈 입니다</div>
						<div>
							<button class="btn-edit">수정</button>
						</div>
						<div class="content-title-url">
							https://www.helloworld.com/minihome/leejubin</div>
					</div>
					<div class="box content-box">
						<div class="box-title">
							Updated news <span class="box-title2">TODAY STORY</span>
						</div>
						<div class="news-flex-box">
							<div class="news-box">
								<div class="news-row">
									<div class="news-category category-post">게시판</div>
									<div class="news-title">
										<a href="#">HTML, CSS, JAVASCRIPT</a>
									</div>
								</div>
								<div class="news-row">
									<div class="news-category category-pic">사진첩</div>
									<div class="news-title">
										<a href="#">2023을 보내며...</a>
									</div>
								</div>
								<div class="news-row">
									<div class="news-category category-post">게시판</div>
									<div class="news-title">
										<a href="#">스프링이란 무엇인가</a>
									</div>
								</div>
								<div class="news-row">
									<div class="news-category category-post">사진첩</div>
									<div class="news-title">
										<a href="#">Maven 과 Gradle 의 차이</a>
									</div>
								</div>
							</div>
							<div class="update-box">
								<div class="menu-row">
									<div class="menu-item">
										<a href="#">다이어리<span class="menu-num">0/51</span></a>
									</div>
									<div class="menu-item">
										<a href="#">사진첩<span class="menu-num">1/88</span></a> <img
											src="../../../../resources/images/icon/minihome/newIcon.png"
											alt="new Icon" class="minihome-nIcon">
									</div>
								</div>
								<div class="menu-row">
									<div class="menu-item">
										<a href="#">게시판<span class="menu-num">3/17</span></a> <img
											src="../../../../resources/images/icon/minihome/newIcon.png"
											alt="new Icon" class="minihome-nIcon">
									</div>
									<div class="menu-item">
										<a href="#">방명록<span class="menu-num">25/500</span></a> <img
											src="../../../../resources/images/icon/minihome/newIcon.png"
											alt="new Icon" class="minihome-nIcon">
									</div>
								</div>
							</div>
						</div>
						<div class="miniroom">
							<div>
								<span class="box-title miniroom-title">Miniroom</span>
								<button class="btn-edit miniroom-edit">미니룸 설정</button>
							</div>
							<div class="miniroom-gif-box">
								<img src="../../../../resources/images/aquariumBg.png" />
							</div>
						</div>
						<br>
						<div class="main-cmt">
							<div class="main-cmt-write">
								일촌평 <input type="text" class="main-cmt-input">
								<button type="submit" value="확인">확인</button>
							</div>
							<div class="main-cmt-content">
								<ul>
									<li>GIF Anti-Aliasing 은 안하는게 더 고전적인 느낌을 주는거같아요 <span
										class="main-cmt-info"><a href="#">(이정은)</a> 2023.12.05</span>
									</li>
									<li>JSP 파일만 30개가 넘는다면서요?ㅋㅋ <span class="main-cmt-info"><a
											href="#">(채승원)</a> 2023.12.05</span>
									</li>
									<li>Git 으로 형상관리 하고계시죠? <span class="main-cmt-info"><a
											href="#">(이진우)</a> 2023.12.05</span>
									</li>
									<li>AWS 로 DB Server 풀 가동 하시는거죠? <span
										class="main-cmt-info"><a href="#">(양은모)</a> 2023.12.05</span>
									</li>
									<li>뭐라고요? 이주빈은 @Bean 을 2주동안 만들어서 이주빈이라고요? <span
										class="main-cmt-info"><a href="#">(금민재)</a> 2023.12.05</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="menu-frame">
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/mainView">홈</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/diaryView">다이어리</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/albumView">사진첩</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/boardView">게시판</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/visitView">방명록</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/settingView">관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="audioPlayerContainer">
		<audio id="audioElement" autoplay></audio>
		<div class="audioPlayingContainer">
			<div class="audioPlayingDiv">
				<img id="audioPlayingImg" src="../../../../resources/images/audioPlayer/nowPlaying.png">
			</div>
			<div class="audioPlayingMargin">				
			</div>			
		    <div class="nowPlaying">
	    	    <div class="audioTitle" id="songTitle">노래 제목</div>
	    	</div>
	    </div>
    	<div class="audioControlsContainer">
	    	<div class="audioBtnContainer">
				<button class="audioBtn" id="audioPrev">
					<img src="../../../../resources/images/audioPlayer/audioPrev.png">
				</button>
				<button class="audioBtn" id="audioPlay">
					<img src="../../../../resources/images/audioPlayer/audioPlay.png">
				</button>
				<button class="audioBtn" id="audioPause">
					<img src="../../../../resources/images/audioPlayer/audioPause.png">
				</button>
				<button class="audioBtn" id="audioNext">
					<img src="../../../../resources/images/audioPlayer/audioNext.png">
				</button>
			</div>
			<div class="audioVolumeContainer">
				<button id="audioVolumeBtn">
					<img src="../../../../resources/images/audioPlayer/audioVolume.png" style="margin-right:5px;">
				</button>
				<input type="range" id="audioVolumeControl" min="0" max="100" value="50" step="1">
			</div>
		</div>
	</div>
	<script src="../../../../resources/js/default.js"></script>
</body>
</html>
