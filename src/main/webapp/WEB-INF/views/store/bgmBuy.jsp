<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>헬로월드</title>
	<link href="/resources/css/index/main.css" rel="stylesheet">
	<link href="/resources/css/index/store.css" rel="stylesheet">
	<link href="/resources/css/index/bgm.css" rel="stylesheet">
	<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
	<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	
	
</head>
<body>
	<div class="bgmBuy-frame">
		<div class="bgmBuy-title-group">
			<div class="bgmBuy-title font-kyobohand">
				BGM 구매
			</div>
			<div class="bgmBuy-carImg">
				<img alt="쇼핑카트 이미지" src="/resources/images/default/cart.png">
			</div>
		</div>
		<div class="bgmBuy-list-cnt font-kyobohand">
			<span class="bgmBuy-list-cnt-left">구매 곡 수 :</span> 
			<span class="bgmBuy-list-cnt-right">
			    <c:set var="itemCount" value="0" />
			    <c:forEach items="${selectedData}" var="bgmItem">
			        <c:set var="itemCount" value="${itemCount + 1}" />
			    </c:forEach>
			    ${itemCount}
			</span>
		</div>
		<div class="bgmBuy-list-group">
		    <table class="bgmBuy-list-table">
		        <thead>
		            <tr>
		                <th class="bgmBuy-data-title">제목</th>
		                <th class="bgmBuy-data-artist">아티스트</th>
		                <th class="bgmBuy-data-price">가격</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach items="${selectedData}" var="bgmItem" varStatus="status">
					    <tr id="row${status.index}">
					        <td>${bgmItem.title}</td>
					        <td>${bgmItem.artist}</td>
					        <td>${bgmItem.price}</td>
					    </tr>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
		<div class="bgmBuy-total font-kyobohand">
			<span class="bgmBuy-total-left">결제 예정 도토리 수 :</span>
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${selectedData}" var="bgmItem">
			    <c:set var="totalPrice" value="${totalPrice + bgmItem.price}" />
			</c:forEach>
			<span class="bgmBuy-total-right">${totalPrice}</span>
		</div>
		
		<div class="bgmBuy-btn-group">
		    <div class="bgmBuy-btn-n">
		        <input type="button" value="취소" onclick="cancelBgmBuy()">
		    </div>
		    <div class="bgmBuy-btn-y">
		        <form id="bgmBuyForm" action="/store/bgmBuyOk" method="post">
		            <input type="button" value="구매" onclick="sendSelectedDataToController()">
		            <input type="hidden" name="selectedData" id="selectedDataField">
		            <input type="hidden" name="totalPrice" value="${totalPrice}">
		        </form>
		    </div>
		</div>
		
	</div>
	
<script>
var selected = [];
var userNickname = '${sessionScope.userId.userNickname}';

<c:forEach items="${selectedData}" var="bgmItem">
	var title = '<c:out value="${bgmItem.title}" />';
	var artist = '<c:out value="${bgmItem.artist}" />';
	var price = '<c:out value="${bgmItem.price}" />';
selected.push({ title: title, artist: artist, price: price });
</c:forEach>


function openNewWindowBgmBuy() {
    var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbar=no, menubar=no, left=100, top=50';
    window.open('/store/bgmBuy', '_blank', windowSettings);
}

function cancelBgmBuy() {
    renderSelectedItems();
    window.close();
    
    if (window.opener && !window.opener.closed) {
        window.opener.reloadParentWindow();
    }
}

function renderSelectedItems() {
    var resultHtml = '';

    $.each(selected, function (i, item) {
        resultHtml += '<div class="bgm-list bgm-grid" id="ajaxTable">';
        resultHtml += '<div>' + (i + 1) + '</div>';
        resultHtml += '<div>' + item.title + '</div>';
        resultHtml += '<div>' + item.artist + '</div>';
        resultHtml += '<div>' + item.runningTime + '</div>';
        resultHtml += '<div>' + item.bgmPrice + '</div>';
        resultHtml += '</div>';
    });

    $('#test').html(resultHtml);
}

// form 전송
function sendSelectedDataToController() {
	
    var form = document.getElementById("bgmBuyForm");

    var selectedDataField = document.getElementById("selectedDataField");
    selectedDataField.value = JSON.stringify(selected);
    
    form.submit();
}

</script>
</body>
</html>