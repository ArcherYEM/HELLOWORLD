<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>헬로월드</title>
		<link  href="/resources/css/index/main.css" rel="stylesheet">
		<link  href="/resources/css/index/storeMMS.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
		<script src="../../../../resources/js/jquery-3.7.1.min.js"></script>
		<script src="<c:url value="/resources/js/storeCart.js" />"></script>
	</head>
	<body>
	<div class="index-frame">
		<div class="divIndexMenu index-header">
	    	<div class="index-header-left">
	        	<a class="logoATag" href="<c:url value='/'/>">
	        		<img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	         	</a>
	        </div>
	       <div class="index-header-right">
				<h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"><span id="userDotoriCnt">${dotori}</span>개</h5>
	            <a href="<c:url value='/store/minimiView'/>" class="index-a-store press-btn">상점</a>
	            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
	            <a href="<c:url value='/index/mapView'/>" class="index-a-map">찾아오는 길</a>
	            <c:if test="${sessionScope.userId ne null }">
	            	<a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
	            </c:if>
	        </div>
      </div>
		<div id="divHiUser">
			<a class="storeAtag" href="/store/minimiView">미니미</a>
			<a class="storeAtag present" href="/store/skinView">스킨</a>
			<a class="storeAtag" href="/store/menuView">메뉴</a>
			<a class="storeAtag" href="/store/dotoriView">도토리</a>
			<a class="storeAtag" href="/store/bgmView">bgm</a>
		</div>
		
		<div class="products">
			<div class="product-title">
	        	스킨 상품 목록
	        </div>
			<div class="content-container">
				<div class="productList">
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="black" data-product-name="검정" data-product-price="10">
							<div class="divProduct" style="background-color: black;" >
								<h5></h5>
							</div>
							<div class="product-name">검정</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="red" data-product-name="빨강" data-product-price="10">
							<div class="divProduct" style="background-color: red;">
								<h5></h5>
							</div>
							<div class="product-name">빨강</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="yellow" data-product-name="노랑" data-product-price="10">
							<div class="divProduct" style="background-color: yellow;">
								<h5></h5>
							</div>
							<div class="product-name">노랑</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="green" data-product-name="초록" data-product-price="10">
							<div class="divProduct" style="background-color: green;">
								<h5></h5>
							</div>
							<div class="product-name">초록</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="grey" data-product-name="회색" data-product-price="10">
							<div class="divProduct" style="background-color: grey;">
								<h5></h5>
							</div>
							<div class="product-name">회색</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="lime" data-product-name="라임" data-product-price="10">
							<div class="divProduct" style="background-color: lime;">
								<h5></h5>
							</div>
							<div class="product-name">라임</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="white" data-product-name="하양" data-product-price="10">
							<div class="divProduct" style="background-color: white;">
								<h5></h5>
							</div>
							<div class="product-name">하양</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="purple" data-product-name="보라" data-product-price="10">
							<div class="divProduct" style="background-color: purple;">
								<h5></h5>
							</div>
							<div class="product-name">보라</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="blue" data-product-name="파랑" data-product-price="10">
							<div class="divProduct" style="background-color: blue;">
								<h5></h5>
							</div>
							<div class="product-name">파랑</div>
							<div class="product-price">도토리10개</div>
					</div>
					<div class="divOneProduct" data-product-cate="스킨" data-product-table-cate="skin" 
						data-product-contentPath="navy" data-product-name="네이비" data-product-price="10">
							<div class="divProduct" style="background-color: navy;">
								<h5></h5>
							</div>
							<div class="product-name">네이비</div>
							<div class="product-price">도토리10개</div>
					</div>
				</div>
				
				<div class="cart-widget">
				  <h2>장바구니</h2>
				    <div class="cart-list-over">
				        <table id="cart-list">
				            <thead>
				                <tr>
				                    <th>카테고리</th>
				                    <th>상품명</th>
				                    <th>가격</th>
				                </tr>
				            </thead>
				            <tbody></tbody>
				        </table>
				    </div>
				  <div class="cart-list-under">
					  <input type="button" class="btnCart" id="btnCartClear" value="비우기">
					  <input type="button" class="btnCart" id="btnCartBuy" value="구매" onclick="buyCart()">
				  </div>
				</div>
			</div>
		</div>
		</div>
		 <jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
		<script>
	function openMiniHomepage() {
	    // URL 정의
	    var url = "<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />";

	    // 크기 정의
	    var width = 1200;
	    var height = 720;

	    // 화면 중앙에 새 창을 위치시키기 위해 위치 계산
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;

	    // 새 창 열기
	    var newWindow = window.open(url, 'MiniHomepage', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

	    // 새 창이 열린 후, 현재 창을 그대로 유지하기 위해 기본 링크 동작 방지
	    if (newWindow) {
	        newWindow.focus(); // 새 창을 포커스합니다.
	    }
	    return false;
	}
	
// 	부모창 리로드 명령
	function reloadParentWindow() {
		location.href = "<c:url value="/index/member/logout" />"
	    location.reload();
	}
	</script>
	<script>
		window.onload = function() {
			var currentPage = getParameterByName('page');
	        var pageLinks = document.querySelectorAll('.spanPage');
	        
	        for (var i = 0; i < pageLinks.length; i++) {
	            var pageLink = pageLinks[i];
	            var pageNumber = pageLink.getAttribute('data-page');

	            if (pageNumber === currentPage) {
	                pageLink.style.color = 'blue';
	                pageLink.style.fontWeight = 'bold';
	            }
	        }
	        
	        if (currentPage === null) {
	            var firstPageLink = document.querySelector('.spanPage[data-page="1"]');
	            if (firstPageLink) {
	                firstPageLink.style.color = 'blue';
	            }
	        }
		
	        let userDotoriElement = document.getElementById('userDotori');
	        let storeLoginMyhome = document.getElementById('storeLoginMyhome');
	        let storeLoginLogout = document.getElementById('storeLoginLogout');
	        let userDotoriCnt = '<c:out value="${dotori}" />' || '';
	
	        if (userDotoriCnt.trim() !== '') {
	            userDotoriElement.style.display = 'block';
	            storeLoginLogout.style.display = 'block';
	        } else {
	            userDotoriElement.style.display = 'none';
	            storeLoginMyhome.style.display = 'none';
	            storeLoginLogout.style.display = 'none';
	        }
	        
	        function getParameterByName(name, url) {
	            if (!url) {
	                url = window.location.href;
	            }
	            name = name.replace(/[\[\]]/g, '\\$&');
	            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
	                results = regex.exec(url);
	            if (!results) return null;
	            if (!results[2]) return '';
	            return decodeURIComponent(results[2].replace(/\+/g, ' '));
	        }
	        
		}
		showUserInfo();
		function showUserInfo() {
		    let userEmail = '<c:out value="${sessionScope.userId.userEmail}" />';
		    let userDotoriElement = document.getElementById('userDotori');
		    let userDotoriCnt = '${dotori}';

		    if (userEmail.trim() !== '') {
		       document.getElementById('indexDotoriImg').style.display = 'inline-block';
		    } else {
		        document.getElementById('indexDotoriImg').style.display = 'none';
		    }

		    if (userDotoriElement) {
		       if (userDotoriCnt.trim() !== '' && userDotoriCnt !== 'null') {
		           userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> ' + userDotoriCnt + ' 개';
		           userDotoriElement.style.display = 'block';
		       } else {
		           userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> 0 개';
		           userDotoriElement.style.display = 'none';
		       }
		    }
		}
		document.getElementById('btnCartClear').addEventListener('click',function() {
			clearCart();
		});
	</script>
	</body>
</html>