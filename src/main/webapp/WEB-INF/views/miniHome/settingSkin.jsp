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
<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/setting.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/settingSkin.css" />
<script type="text/javascript" src="../../../../resources/js/settingSkin.js"></script>
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="main-frame">
		<div class="bookcover">
			<div class="bookdot">
				<div class="page">
					<div class="profile-container">
						<div class="header profile-title font-neo">
							TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
						</div>
						<div class="box profile-box">
							<div class="setting-folder-group">
								<div>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										개인정보
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSetting" data-setting="/mnHome/settingView/${userNickname }">
													개인정보변경
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										미니홈피관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingBgm" data-bgm="/mnHome/settingBgm/${userNickname }">
													BGM설정
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingMenu" data-menu="/mnHome/settingMenu/${userNickname }">
													메뉴탭설정
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list set-on" id="spanSettingSkin" data-skin="/mnHome/settingSkin/${userNickname }">
													스킨설정
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										아이템/내역관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse/${userNickname }">
													도토리 사용내역
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge/${userNickname }">
													도토리 구매내역
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										인맥관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingFriends" data-friends="/mnHome/settingFriends/${userNickname }">
													일촌현황
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="profile-dot">-----------------------------------</div>
                     			 <div class="left-3">
		                 		    <div class="profile-username font-kyobohand mainpopup" onclick="popupFunction()"> 
										<c:if test="${sessionScope.userId.userNickname == userNickname}"></c:if>
										<c:if test="${sessionScope.userId.userNickname != userNickname}">
								   			<div class="mainpopuptext" id="myPopup" onclick="requestFriendship('${userNickname}')"> 
								        	일촌신청 
									        <input type="hidden" id="requestUser" name="requestUser" value="${sessionScope.userId.userNickname}">
									        <input type="hidden" id="responseUser" name="responseUser" value="${userNickname}">
									    </div>
									</c:if>
									<c:if test="${userGender eq 'M'}">
			                        	${userName }&#128102
									</c:if>
									<c:if test="${userGender eq 'F'}">
			                        	${userName }&#128103
									</c:if>
			                     </div>
		               		     <div class="profile-dropDown">
									<select id="friendSelect" onchange="redirectToMainView()">
			                           <option value="" disabled selected hidden="">파도타기</option>
									    <c:forEach var="friend" items="${friend}" varStatus="status">
									        <option value="${friend.Name}">
									        	${friend.Name}(${friend.userEmail})
									        </option>
									    </c:forEach>
									</select>
		                   		</div>
	                     	</div>
						</div>
					</div>
					<div class="content-container">
						<div class="header content-title">
							<div id="divHomeTitle" class="content-title-name">${title }</div>
							 <input id="newTitle" class="content-title-name"  type="hidden" value="${title }">
							 <input id="hiddenUserNickname" type="hidden" value="${userNickname }">
							 <c:if test="${sessionScope.userId.userNickname eq userNickname }">
									<div>
										<input type="button" id="btn-title-edit" class="btn-edit" value="수정">
										<input type="hidden" id="btn-title-save"class="btn-edit" value="저장">
									</div>
							</c:if>
							<div class="content-title-url">
								http://corehelloworld.shop/mnHome/mainView/${userNickname }
							</div>
						</div>
						
						<div class="box content-box">
							<div class="set-skin-frame">
							
								<div class="set-skin-selected">
									<div class="set-skin-selected-span">
										<span>적용중인 스킨</span>
									</div>
									<div class="set-skin-selected-skin" id="skin-item-color-select"
									     style="
									     		width: 200px;
									            height: 30px;
									            margin-bottom: 10px;
									            margin-right: 5px;
									            border: 2px solid black;
									            border-radius: 5px;
									            background-color:
								            <c:forEach var="onSkin" items="${onSkin}">
  												 <c:choose>
										        <c:when test="${onSkin.contentPath == 'red'}">red</c:when>
										        <c:when test="${onSkin.contentPath == 'yellow'}">yellow</c:when>
										        <c:when test="${onSkin.contentPath == 'black'}">black</c:when>
										        <c:when test="${onSkin.contentPath == 'blue'}">blue</c:when>
										        <c:when test="${onSkin.contentPath == 'purple'}">purple</c:when>
										        <c:when test="${onSkin.contentPath == 'white'}">white</c:when>
										        <c:when test="${onSkin.contentPath == 'green'}">green</c:when>
										        <c:when test="${onSkin.contentPath == 'lime'}">lime</c:when>
										        <c:when test="${onSkin.contentPath == 'navy'}">navy</c:when>
										        <c:when test="${onSkin.contentPath == 'rgb(42, 140, 168)'}">rgb(42, 140, 168)</c:when>
										    </c:choose>
										</c:forEach>;">
									</div>
								</div>
								
								<div class="set-skin-having">
								    <div class="set-skin-p">
								        <p>보유중인 스킨</p>
								    </div>
								    <div class="set-skin-list">
										<c:forEach var="skinItem" items="${skinMap}">
											<div class="skin-item-group" id="skin-item-group-select">
												<div class="skin-item-color" id="skin-item-color-select" 
												data-user-nickname="${skinItem.userNickname}"
												data-category="${skinItem.category}"
												data-product-name="${skinItem.productName}"
												onclick="logClick()" 
												style="
											       width: 200px;
											       height: 30px;
											       margin-bottom: 10px;
											       margin-left: 20px;
											       border: 2px solid black;
	    										   border-radius: 5px;	
											       background-color: 
													<c:choose>
						                                <c:when test="${skinItem.contentPath == 'red'}">red</c:when>
						                                <c:when test="${skinItem.contentPath == 'yellow'}">yellow</c:when>
						                                <c:when test="${skinItem.contentPath == 'black'}">black</c:when>
						                                <c:when test="${skinItem.contentPath == 'blue'}">blue</c:when>
						                                <c:when test="${skinItem.contentPath == 'purple'}">purple</c:when>
						                                <c:when test="${skinItem.contentPath == 'white'}">white</c:when>
						                                <c:when test="${skinItem.contentPath == 'green'}">green</c:when>
						                                <c:when test="${skinItem.contentPath == 'lime'}">lime</c:when>
						                                <c:when test="${skinItem.contentPath == 'grey'}">gray</c:when>
						                                <c:when test="${skinItem.contentPath == 'navy'}">navy</c:when>
						                                <c:when test="${skinItem.contentPath == 'rgb(42, 140, 168)'}">rgb(42, 140, 168)</c:when>
						                            </c:choose>;
											       " >
										   </div>
										   <div class="skin-item-name">${skinItem.productName}</div>
									   </div>
									</c:forEach>
								</div>
							</div>
								
							<form action="/mnHome/settingSkin/skinChoice" >
								<div class="set-skin-btn">
									<input type="hidden" name="selectedProductName" id="selectedProductName" class="set-skin-select" />
									<input type="hidden" name="selectedCategory" id="selectedCategory" class="set-skin-select"/>
									<input type="hidden" name="nickname" id="nickname" class="set-skin-select"/>
									<input type="submit" class="set-skin-select apply-skin-button" value="적용" />
								</div>
							</form>
								
							</div>
						</div>
						
					</div>
					
					<jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
