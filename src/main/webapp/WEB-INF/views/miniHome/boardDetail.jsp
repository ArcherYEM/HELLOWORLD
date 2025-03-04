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
<link rel="stylesheet" href="../../../../resources/css/minihome/board.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/album.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
						<div class="left-1">
							<div class="profile-image">
                      			<c:set var="imagePath" value="/resources/images/${image}" />
                        		<img class="profile-image-img" src="/../../../../resources/images/download/${image}" alt="프로필 이미지" />
                     		</div>
                     	</div>
                     	<div class="profile-dot">-----------------------------------</div>
                    	 <div class="left-2">
	                    	 <div class="profile-text font-kyobohand">
	                        	<c:out value="${msg}" escapeXml="false"/>
	                     	</div>
	                     	<div class="profile-history">
	                        	<c:if test="${sessionScope.userId.userNickname eq userNickname }">
		                           <a 
		                             class="profile-edit" 
		                             onclick="openNewWindowMinihomeProfileEdit()">Edit
		                           </a>
		                        </c:if>
		                        <form action="/mnHome/miniroomHistoryView" method="POST" id="frmHistory" target="miniroomWindow">
		                        	<input type="hidden" name="targetNickname" id="targetNickname" value=${userNickname }>
		                        </form>
		                        <a
		                          class="profile-hs"
		                          onclick="openNewWindowMiniroomHistory()">History                        
		                        </a>
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
								http://corehelloworld.shop/mnHome/mainView/${userNickname }</div>
						</div>
					<div class="box content-box">
					<div class="board-outer-container">
						<div class="board-detail-title">
							${list.get(0).title}
						</div>
						<input type="hidden" value="${seq }" id="boardSeq">
						<input type="hidden" value="${sessionScope.userNickname }" id="userNickname">
					</div>
					<div class="board-write-container">
						<span class="board-writer">${list.get(0).userNickname}</span>
						<span class="board-write-date"><fmt:formatDate value="${list.get(0).create_date}" pattern="yyyy-MM-dd HH:mm" /></span>						
					</div>
					<div class="board-content-container">
						${list.get(0).content}
					</div>
					<div class="board-detail-right">
						<button class="btn-boardlist" id="btnBoardView" data-boardView="<c:url value='/mnHome/boardView/${userNickname}'/>">목록</button>
						<c:if test="${sessionScope.userId.userNickname eq userNickname }">
							<button class="btnBoardWrite" data-boardWrite="<c:url value='/mnHome/boardModifyView/${userNickname}/${seq }'/>">수정</button>

						</c:if>
					</div>
					<c:if test="${check == 1 }">
					<div class="board-comment-write">
						<span>
							댓글
						</span>
						<input type="text" class="comment-content-write" id="inputComment">
						<input type="button" value="확인" id="btnComment" onclick="btnComment()">
					</div>
					</c:if>
					<div class="board-comment-container" id="board-comment-container">
					<c:forEach items="${comment}" var="comment">
						<div class="board-comment">
							<input type="hidden" value=${comment.seq } id="board-seq">
							<div class="comment-info">
							<a href="<c:url value="/mnHome/mainView/${comment.userNickname }" />"><span class="board-comment-writer">
								${comment.userNickname }
							</span></a>
							<span class="board-comment-content">
								${comment.content }
							</span>
							<span class="board-comment-date">
								${comment.update_date_format }
							</span>
							</div>
							<c:if test="${sessionScope.userId.userNickname eq comment.userNickname }">
							<div class="board-comment-actions">
								<span class="board-comment-delete" onclick = "btnCommentDelete(event)">
									삭제
								</span>
							</div>
							</c:if>
						</div>
					</c:forEach>
					
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
