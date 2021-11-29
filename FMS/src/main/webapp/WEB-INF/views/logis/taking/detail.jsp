<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="detail" value="${detailList }" />

<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
body {
   font-family: 'Noto Sans KR', sans-serif;
}
.content-header{
   padding : 8px .5em;
}
.card-body{
    padding: 0.25rem;
}
.table {
    font-size: 13px;
    text-align: center;
}
.search-group, .form-control {
   font-size : 13px;
   text-align : right;
}
.search-group {
   padding-top: 2px;
}
.search-card {
   padding-top : 5px;
    padding-bottom: 0px;
   height : 85px;
    width: 1260px;
    margin: auto;
}
.search-body{
   padding : 5px 30px;
   height : 80px;
}
.search-navi{
   position : fixed;
   top : 92vh;
   left : 71vh;
   font-size : 13px;   
}
.search-navi{
   position : fixed;
   top : 35rem;
   left : 34rem;   
   font-size : 13px;
}
.input-padding-bottom {
   margin-bottom : 5px;
}
.custom-checkbox {
   padding-left : 108px;
}
#btn-goods {
   height : 31px;
}
.custom-control-label {
   padding-top: 3px;
}
.btn-fms-search{
   height: 30px;
}
#btn-search {
   height : 65px; margin-left : 26px;
}
.body-top {
   margin-top : 5px;
}
#custom-tabs-one-profile-tab{
   background-color: white;
}
#tab{
background-color: #5ea4ff;
}
.table td{
padding: 6.8px;
}
</style>
</head>

<title>재고실사</title>

<body>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(window).on("beforeunload", function() { 
    return if(confirm("Do you realwant to close?")) disconnect(); 
}) 
</script>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h5>${loginLogis.logis_name } 재고실사 실시간 모니터링</h5>
	  				<span>${whName }</span>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
	<section class="content">
		
<!-- <div class="row"> col-6 -->
		<div class="card-body" style="max-height: 728.88px;">
			<table class="table table-hover text-center">
				<tr style="font-size: 1.2em;">
					<th style="width: 5%;">번 호</th>
					<th style="width: 7%;">물품코드</th>
					<th style="width: 10%;">물품명</th>
					<th style="width: 6%; text-align: right;">전산재고</th>
					<th style="width: 6%; text-align: right;">실사재고</th>
					<th style="width: 6%; text-align: right;">차이수량</th>
					<th style="width: 6%; text-align: right;">조정수량</th>
					<th style="width: 6%; text-align: right;">현재고</th>
					<th style="width: 6%;">비고</th>
				</tr>
				<c:if test="${empty detailList }">
					<tr id="emptyTr">
						<td id="emptyTd" colspan="9"><h2>실사를 진행할 수 있습니다.<br><br>모바일웹을 확인하세요.</h2></td>
					</tr>
				</c:if>
				<c:forEach items="${detailList }" var="detail">
					<c:set var="i" value="${i+1 }" />
					 <tr style='font-size: 1em;' style="cursor:pointer;">
						<td>${i }</td>
						<td>${detail.hq_goods_code }</td>
						<td>${detail.hq_goods_name }</td>
						<td><fmt:formatNumber value="${detail.computer_stock }" pattern="#,###" /></td>
						<td style="text-align: right;"><fmt:formatNumber value="${detail.actual_stock }" pattern="#,###" /></td>
						<td style="color: red; text-align: right;"><fmt:formatNumber value="${detail.deff_quantity }" pattern="#,###" /></td>
						<td style="text-align: right;"><fmt:formatNumber value="${detail.adjust_quantity }" pattern="#,###" /></td>
						<td style="text-align: right;"><fmt:formatNumber value="${detail.logis_goods_stock }" pattern="#,###" /></td>
						<td>${detail.note }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>

<script>
var ws = "";
var idx = 0;
var takingCode = sessionStorage.getItem('takingCode');
var logis_code = '${logis_code}';
var wh_code = '${wh_code}';
var url = "wss://192.168.45.40:8001/fms/takingSocket"
const d = new Date();
// var url = "wss://1.245.0.189:8001/fms/takingSocket"
ws = new WebSocket(url); 
ws.onopen = function (message) {
};
ws.onmessage = function (event) {
	
	if ($('#emptyTr').hasClass() === false){
		$('#emptyTr').remove();
	}
	var text = "";
	var msg = JSON.parse(event.data);
	text = msg.takingData;
	text = JSON.parse(text);
	text.takingCode = takingCode;
	text.logis_code = logis_code;
	text.wh_code= wh_code;
	console.log('파싱한 데이터' + text);
	console.log(JSON.stringify(text));
	if (text.st == 'insert') {
		$.ajax({
			url : '<%=request.getContextPath()%>/logis/stockcheck/regist.do'
			, method : 'POST'
			, data : JSON.stringify(text)
			, contentType : 'application/json; charset=UTF-8'
			, success : function() {
				console.log('실사데이터 입력성공');
				appendData(text.goodsCode, text.goodsName, text.comquan, text.realquan, idx++);
			}
			, error : function() {
				console.log('insert 실패')
			}
		})
	}
	if (text.st == 'update') {
		$.ajax({
			url : '<%=request.getContextPath()%>/logis/stockcheck/update'
			, method : 'POST'
			, data : JSON.stringify(text)
			, contentType : 'application/json; charset=UTF-8'
			, success : function () {
				console.log('실사데이터 수정 성공');
				appendData(text.goodsCode, text.goodsName, text.comquan, text.realquan, idx++);
			}
			, error : function() {
				console.log('업데이트 실패')
			}
		})
	}
	
	if (text.st == 'finish') {
		//실사테이블에 데이터 insert & 임시저장에 있는 데이터 지우기
		$.ajax({
			url : '<%=request.getContextPath()%>/logis/stockcheck/savetaking.do'
			, method : 'POST'
			, data : JSON.stringify(text)
			, contentType : 'application/json; charset=UTF-8'
			, success : function() {
				console.log('실사테이블에 inset, 임시저장 delete 성공');
				appendFinish();
			}
			, error : function(xhr) {
				console.log(xhr + '에러남');
			}
		})
	}
	
};
function disconnect() { 
	ws.close(); 
	ws = null; 
}

function appendData(goodsCode, goodsName, comquan, realquan, num) {
	var list = "";
	list +='<tr style="font-size: 1em;">';
	list +='	<td>'+num+'</td>';
	list +='	<td>'+goodsCode+'</td>';
	list +='	<td>'+goodsName+'</td>';
	list +='	<td>'+comquan+'</td>';
	list +='	<td style="text-align: right;">'+realquan+'</td>';
	list +='	<td style="color: red; text-align: right;">'+(+realquan - comquan)+'</td>';
	list +='	<td style="color: red; text-align: right;">'+(+realquan - comquan)+'</td>';
	list +='	<td style="text-align: right;">'+realquan+'</td>';
	list +='	<td></td>';
	list +='</tr>';
	$('.table-hover').append(list);
}
function appendFinish() {
	var list = "";
	list +='<tr style="font-size: 1.4em;">';
	list +='	<td colspan="9">실사가 종료되었습니다. 재고현황을 확인하세요.</td>';
	list +='</tr>';
	$('.table-hover').append(list);
}
</script>

</body>
