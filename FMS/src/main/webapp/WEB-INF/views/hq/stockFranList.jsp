<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />
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
	top : 94vh;
	left : 35rem;
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
</style>
</head>

<title>재고조회</title>

<body>
	<div class="">
	 <!-- Main content -->
		<div class="col-12 body-top">
			<div class="card card-secondary card-tabs" style="overflow-x: hidden;" >
				<div class="card-header p-0 pt-1">
					<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">가맹점 재고</a></li>
						<li class="nav-item" onclick="javascript:logis_go();"><a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">물류센터 재고</a></li>
					</ul>
				</div>
				
				<div class="card-body search-card">
					<div class="card">
						<div class="card-body search-body">
			            	<div class="search-group">
			   					<div class="input-group">
			   					 	<!-- keyword -->
			   					 	<div class="input-group col-sm-6">
									 	<div class="input-group input-padding-bottom col-sm-6">
											<span class=" search-group col-sm-4">지역번호</span>
											<div class="input-group input-group-sm col-sm-8">
												<input type="text" id="fms-local" name="fms-local" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-local" name="btn-local" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
												</span>
											</div>
										</div>
										<div class="input-group input-padding-bottom col-sm-6">
											<span class=" search-group col-sm-4">가맹점</span>
											<div class="input-group input-group-sm col-sm-8">
												<input type="text" id="fms-fran" name="fms-fran" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-fran" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
												</span>
											</div>
										</div>
										<div class="input-group input-padding-bottom col-sm-6">
											<span class=" search-group col-sm-4">대분류</span>
											<div class="input-group input-group-sm col-sm-8">
												<input type="text" id="fms-laca" name="fms-laca" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-laca" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
												</span>
											</div>
										</div>
										<div class="input-group input-padding-bottom col-sm-6">
											<span class=" search-group col-sm-4">소분류</span>
											<div class="input-group  input-group-sm  col-sm-8">
												<input type="text" id="fms-smca" name="fms-smca" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-smca" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
												</span>
											</div>
										</div>
									</div>
									<div class="input-group col-sm-3">
										<div class="input-group input-padding-bottom col-sm-12">
											<span class=" search-group col-sm-4">물품</span>
											<div class="input-group input-group-sm col-sm-8">
												<input type="text" id="fms-goods" name="fms-goods" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-goods" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
												</span>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-5">
										
											</div>				
											<div class="col-sm-7" style="position: absolute; left: 5rem; top: -1.3em;">
												<button type="button" style="font-family: none; font-size: 0.7rem; margin-left: 1rem;"class="btn btn-block bg-gradient-secondary" onclick="refresh();">검색조건초기화</button>
											</div>												
										</div>
									</div>
									<div class="input-group col-sm-3">
										<div class="input-group input-padding-bottom col-sm-6">
											<div class="input-group input-group-sm col-sm-8">
												<span>
													<button onclick="javascript:searchGoStockF();" type="button" id="btn-search" class="btn btn-block btn-outline-secondary btn-lg btn-fms-search"><i class="fas fa-sw fa-search">&nbsp;&nbsp;&nbsp;search</i></button>
												</span>
											</div>
										</div>
									</div>
								</div>
		   					</div>
			             </div>
					</div>
				</div>
					<!-- /.card-header -->
              	<div class="card-body table-responsive p-0 list-line" style="min-height: 38rem;">
	                <table class="table table-hover">
	                	<thead>
		                    <tr>
								<th>no</th>
								<th>지역</th>
								<th>가맹코드</th>
								<th>가맹점</th>
								<th>분류1</th>
								<th>분류2</th>
								<th>제품명</th>
								<th>제품코드</th>
								<th>현재고</th>
								<th>안전</th>
								<th>적정</th>
								<th>입고단가</th>
								<th>출고단가</th>
								<th>최대발주량</th>
								<th>재고금액</th>
							 </tr>
	                  	</thead>
						<tbody id="fran-stock-list">
		                    <c:forEach items="${franStockList }" var="stock">
		                    	<c:set var="i" value="${i+1 }"/>
								<tr class="fran-stock" style="cursor: pointer;">
									<td>${i }</td>
									<td>${stock.fran_local_num }</td>
									<td>${stock.fran_code }</td>
									<td>${stock.fran_name }</td>
									<td>${stock.sup_goods_laca }</td>
									<td>${stock.sup_goods_smca }</td>
									<td>${stock.sup_goods_name }</td>
									<td>${stock.hq_goods_code }</td>
									<c:if test="${stock.fran_goods_stock le  stock.fran_safe_stock}">
									<td><fmt:formatNumber value="${stock.fran_goods_stock}" pattern="#,###" /></td>
									</c:if>
									<c:if test="${stock.fran_goods_stock gt  stock.fran_safe_stock}">
									<td style="color:red;"><fmt:formatNumber value="${stock.fran_goods_stock}" pattern="#,###" /></td>
									</c:if>
									<td><fmt:formatNumber value="${stock.fran_safe_stock}" pattern="#,###" /></td>
									<td><fmt:formatNumber value="${stock.fran_suit_stock}" pattern="#,###" /></td>
									<td><fmt:formatNumber value="${stock.goods_delivery_price}" pattern="#,###" /></td>
									<td><fmt:formatNumber value="${stock.goods_retail_price}" pattern="#,###" /></td>
									<td><fmt:formatNumber value="${stock.goods_max_order}" pattern="#,###" /></td>
									<td><fmt:formatNumber value="${stock.fran_goods_stock * stock.goods_delivery_price }" pattern="#,###" /></td>
								</tr>
							</c:forEach>
		                 </tbody>
					</table>
             	</div>
			</div><!-- /.card-->
			<div class="card-body search-navi">
				<%@ include file="/WEB-INF/views/common/paginationHqStockFran.jsp"%>
			</div>
			<div class="tab-content" id="custom-tabs-one-tabContent">
				<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab"></div>
				<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab"></div>
			</div>
		</div>
	</div>
	<!-- </div> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
var data = "";
var fms_local = "";
var fms_fran = "";
var fms_laca = "";
var fms_smca = "";
var fms_goods = "";
var page = 1;

function searchGoStockF(realpage, url){
	fms_local = $('#fms-local').val();
	fms_laca = $('#fms-laca').val();
	fms_smca = $('#fms-smca').val();
	fms_goods = $('#fms-goods').val();
	
	
	if(!realpage) page = 1;
	if(!url) url= 'searchfran.do';
	
	data = {"fms_local": fms_local, "fms_fran": fms_fran, "fms_laca": fms_laca, "fms_smca": fms_smca, "fms_goods": fms_goods, "page" : page}
	$.ajax({
		url:'searchfran.do'
		, method : 'post'
		, data : JSON.stringify(data)
		, contentType : 'application/json; charset=UTF-8'
		, dataType : 'json'
		, success : function(dataMap) {
			page = realpage;
			printData(dataMap.franStockList, $('#fran-stock-list'),$('#franstock-list-template'), $('.fran-stock'));
			printPagination(dataMap.pageMaker,$('nav.pagination-nav'),$('#stockfran-pagination-template'));
		}
	})
}
function enterkey() {
	if (window.event.keyCode == 13) {
		searchGoStockF();
    }
}
Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ 
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"signActive":function(pageNum){
		if(pageNum == stockpage) return 'active';
	},
	"ifCond": function(v1, v2, options){
		if(v1 < v2) {
   			return options.inverse(this);
 		}
 			return options.fn(this);
	}
});
function safeStock() {
	if($('#customCheckbox2-label').attr('role') =='false'){
		
		$('#customCheckbox2-label').attr('role','true');
	} else {
		$('#customCheckbox2-label').attr('role','false');
	}
}

function logis_go() {
	location.href="<%=request.getContextPath()%>/hq/stock/logisdetail";
}
</script>
<script>
function printData(dataArr, target, templateObject, removeClass){
	var template = Handlebars.compile(templateObject.html());
	var html = template(dataArr);
	$(removeClass).remove();
	target.append(html);
}
function printPagination(pageMaker,target,templateObject, removeClass){
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	$(removeClass).remove();
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}
function refresh() {
	
	fms_local = "";
	fms_fran = "";
	fms_laca = "";
	fms_smca = "";
	fms_goods = "";
	document.querySelector('#fms-local').value = "";
	document.querySelector('#fms-fran').value = "";
	document.querySelector('#fms-laca').value = "";
	document.querySelector('#fms-smca').value = "";
	document.querySelector('#fms-goods').value = "";
}
</script>
<!-- 지역검색 영역 -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-local" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">지역</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered local-list" id="modal-fms-local">
				<tr>
						<th>no</th>
						<th>지역번호</th>
				</tr>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="local-list-template">
	{{#each .}}  
			<tr class="local" id="local{{math @key '+' 1}}" onclick="javascript:localKey('{{this}}');">
				<td>{{math @key '+' 1}}</td>
				<td>{{this}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//local modal
	$('#btn-local').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/local.do',
			type:'get',
			success:function(goodsList){
				printData(goodsList, $('.local-list'), $('#local-list-template'), $('.local'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-local').modal('show');
			}
		})
	});
	
	// 지역을 선택하면 해당 값이 키워드로
	function localKey(data){
		document.querySelector('#fms-local').value = data;
		$('#modal-local').modal('hide');
	}

</script>
<!-- 지역검색 끝 -->
<!-- 가맹점검색  -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-fran" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">가맹점</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered fran-list" id="modal-fms-local">
				<tr>
						<th>코드</th>
						<th>가맹점명</th>
						<th>대표</th>
						<th>주소</th>
				</tr>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="fran-list-template">
	{{#each .}}  
			<tr class="fran" id="fran{{math @key '+' 1}}" onclick="javascript:franKey('{{fran_name}}', '{{fran_code}}');">
				<td>{{fran_code}}</td>
				<td>{{fran_name}}</td>
				<td>{{fran_owner}}</td>
				<td>{{fran_addr}} {{fran_detail_addr}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//fran modal
	$('#btn-fran').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/fran.do',
			type:'get',
			success:function(goodsList){
				printData(goodsList, $('.fran-list'), $('#fran-list-template'), $('.fran'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-fran').modal('show');
			}
		})
	});
	
	// 가맹점을 선택하면 해당 값이 키워드로
	function franKey(name, code){
		document.querySelector('#fms-fran').value = name;
		fms_fran = code;
		$('#modal-fran').modal('hide');
	}

</script>
<!-- 가맹점검색 끝 -->
<!-- 대분류 검색 -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-laca" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">대분류</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered laca-list" id="modal-fms-laca">
				<tr>
						<th>no</th>
						<th>분류</th>
				</tr>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="laca-list-template">
	{{#each .}}  
			<tr class="laca" id="laca{{math @key '+' 1}}" onclick="javascript:lacaKey('{{this}}');">
				<td>{{math @key '+' 1}}</td>
				<td>{{this}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//laca modal
	$('#btn-laca').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/laca.do',
			type:'get',
			success:function(lacaList){
				printData(lacaList, $('.laca-list'), $('#laca-list-template'), $('.laca'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-laca').modal('show');
			}
		})
	});
	
	// 물품을 선택하면 해당 값이 키워드로
	function lacaKey(data){
		document.querySelector('#fms-laca').value = data;
		$('#modal-laca').modal('hide');
	}

</script>
<!-- 대분류 검색 끝 -->
<!-- 소분류 검색 -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-smca" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">소분류</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered smca-list" id="modal-fms-smca">
				<tr>
						<th>no</th>
						<th>분류</th>
				</tr>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="smca-list-template">
	{{#each .}}  
			<tr class="smca" id="smca{{math @key '+' 1}}" onclick="javascript:smcaKey('{{this}}');">
				<td>{{math @key '+' 1}}</td>
				<td>{{this}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//smca modal
	$('#btn-smca').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/smca.do',
			type:'get',
			success:function(smcaList){
				printData(smcaList, $('.smca-list'), $('#smca-list-template'), $('.smca'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-smca').modal('show');
			}
		})
	});
	
	// 물품을 선택하면 해당 값이 키워드로
	function smcaKey(data){
		document.querySelector('#fms-smca').value = data;
		$('#modal-smca').modal('hide');
	}

</script>
<!-- 소분류 검색 끝 -->
<!-- 본사물품 검색  -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-goods" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">본사 물품</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered goods-list" id="modal-fms-goods">
				<tr>
						<th>물품코드</th>
						<th>물품명</th>
						<th>공급업체</th>
						<th>가격</th>
						<th>등록날짜</th> <!-- yyyy-MM-dd  -->
				</tr>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="hqgoods-list-template">
	{{#each .}}  
			<tr class="hqgoods" id="goods{{math @key '+' 1}}" onclick="javascript:hqgoodsKey('{{sup_goods_name}}');">
				<td>{{sup_goods_code}}</td>
				<td>{{sup_goods_name}}</td>
				<td>{{sup_name}}</td>
				<td>{{goods_retail_price}}</td>
				<td>{{last_update}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//goods modal
	$('#btn-goods').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/hqgoods.do',
			type:'get',
			success:function(goodsList){
				printData(goodsList, $('.goods-list'), $('#hqgoods-list-template'), $('.hqgoods'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-goods').modal('show');
			}
		})
	});
	
	// 물품을 선택하면 해당 값이 키워드로
	function hqgoodsKey(data){
		document.querySelector('#fms-goods').value = data;
		$('#modal-goods').modal('hide');
	}
</script>
<!-- 본사물품 검색 끝 -->
<!-- 키워드 검색 끝 -->
<script type="text/x-handlerbars-template" id="franstock-list-template">
	{{#each .}}  
			<tr class="fran-stock" style="cursor: pointer;">
				<td>{{math @key "+" 1}}</td>
				<td>{{fran_local_num }}</td>
				<td>{{fran_code }}</td>
				<td>{{fran_name }}</td>
				<td>{{sup_goods_laca }}</td>
				<td>{{sup_goods_smca }}</td>
				<td>{{sup_goods_name }}</td>
				<td>{{hq_goods_code }}</td>
			{{#ifCond fran_goods_stock fran_safe_stock }}
				<td style="color:red;">{{fran_goods_stock }}</td>
			{{else}}
				<td>{{numberFormat fran_goods_stock }}</td>
			{{/ifCond}}
				<td>{{numberFormat fran_safe_stock }}</td>
				<td>{{numberFormat fran_suit_stock }}</td>
				<td>{{numberFormat goods_delivery_price }}</td>
				<td>{{numberFormat goods_retail_price }}</td>
				<td>{{numberFormat goods_max_order }}</td>
				<td>{{math fran_goods_stock "*" goods_delivery_price }}</td>
			</tr>
	{{/each}}
</script>
<!-- 키워드 검색 끝 -->
<!-- 키워드 페이지네이션 -->
<script type="text/x-handlebars-template"  id="stockfran-pagination-template" >
<ul class="pagination justify-content-center m-0">
	<li class="paginate_button page-item">
		<a href="javascript:searchGoStockF(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="{{#if prev}}javascript:searchGoStockF({{prevPageNum}}){{else}}javascript:searchGoStockF(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}} ">
		<a href="javascript:searchGoStockF({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}

	<li class="paginate_button page-item ">
		<a href="{{#if next}}javascript:searchGoStockF({{nextPageNum}}){{else}}javascript:searchGoStockF(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:searchGoStockF({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>
</ul>
</script>
<!-- 키워드 페이지네이션 끝 -->
</body>