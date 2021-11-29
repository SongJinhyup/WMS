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
		<div class="col-12 body-top">
			<div class="card card-secondary card-tabs" style="overflow-x: hidden;" >
				<div class="card-header p-0 pt-1">
					<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
						<li class="nav-item" onclick="javascript:fran_go();"><a href="detail" class="nav-link" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">가맹점 재고</a></li>
						<li class="nav-item"><a class="nav-link active" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">물류센터 재고</a></li>
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
											<span class=" search-group col-sm-4">물류센터</span>
											<div class="input-group input-group-sm col-sm-8">
												<input type="text" id="fms-logis" name="fms-logis" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
												<span class="input-group-append">
													<button type="button" id="btn-logis" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
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
													<button onclick="javascript:searchGoStockL();" type="button" id="btn-search" class="btn btn-block btn-outline-secondary btn-lg btn-fms-search"><i class="fas fa-sw fa-search">&nbsp;&nbsp;&nbsp;search</i></button>
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
	                <div class="card-body">
		                <table class="table table-hover" >
		                	<thead>
			                    <tr>
									<th>no</th>
									<th>지역</th>
									<th>센터코드</th>
									<th>센터명</th>
									<th>창고</th>
									<th>분류1</th>
									<th>분류2</th>
									<th>제품명</th>
									<th>제품코드</th>
									<th>현재고</th>
									<th>안전</th>
									<th>적정</th>
									<th>출고단가</th>
									<th>최대발주량</th>
									<th>재고금액</th>
								 </tr>
		                  	</thead>
							<tbody id="logis-stock-list">
			                    <c:forEach items="${logisStockList }" var="stock">
			                    	<c:set var="i" value="${i+1 }"/>
									<tr class="logis-stock" style="cursor: pointer;">
										<td>${i }</td>
										<td>${stock.logis_local_num }</td>
										<td>${stock.logis_code }</td>
										<td>${stock.logis_name }</td>
										<td>${stock.wh_name }</td>
										<td>${stock.sup_goods_laca }</td>
										<td>${stock.sup_goods_smca }</td>
										<td>${stock.sup_goods_name }</td>
										<td>${stock.hq_goods_code }</td>
										<c:if test="${stock.logis_goods_stock lt stock.logis_safe_stock}">
											<td style="color:red;"><fmt:formatNumber value="${stock.logis_goods_stock}" pattern="#,###" /></td>
										</c:if>
										<c:if test="${stock.logis_goods_stock ge stock.logis_safe_stock}">
											<td><fmt:formatNumber value="${stock.logis_goods_stock}" pattern="#,###" /></td>
										</c:if>
										<td><fmt:formatNumber value="${stock.logis_safe_stock}" pattern="#,###" /></td>
										<td><fmt:formatNumber value="${stock.logis_suit_stock}" pattern="#,###" /></td>
										<td><fmt:formatNumber value="${stock.goods_delivery_price}" pattern="#,###" /></td>
										<td><fmt:formatNumber value="${stock.goods_max_order}" pattern="#,###" /></td>
										<td><fmt:formatNumber value="${stock.logis_goods_stock * stock.goods_delivery_price }" pattern="#,###" /></td>
									</tr>
								</c:forEach>
			                 </tbody>
						</table>
						</div>
             	</div>
			</div><!-- /.card-->
			<div class="card-body search-navi">
				<%@ include file="/WEB-INF/views/common/paginationHqStockLogis.jsp"%>
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
var fms_logis = "";
var fms_laca = "";
var fms_smca = "";
var fms_goods = "";
var page = 1;
//물류센터 재고조회 ajax
function searchGoStockL(realpage, url){
	fms_local = $('#fms-local').val();
	fms_logis = $('#fms-logis').val();
	fms_laca = $('#fms-laca').val();
	fms_smca = $('#fms-smca').val();
	fms_goods = $('#fms-goods').val();
	
	
	if(!realpage) page = 1;
	if(!url) url= 'searchlogis.do';
	
	data = {"fms_local": fms_local, "fms_logis": fms_logis, "fms_laca": fms_laca, "fms_smca": fms_smca, "fms_goods": fms_goods, "page" : page}
	$.ajax({
		url:'searchlogis.do'
		, method : 'post'
		, data : JSON.stringify(data)
		, contentType : 'application/json; charset=UTF-8'
		, dataType : 'json'
		, success : function(dataMap) {
			page = realpage;
			console.log(dataMap.pageMaker);
			printData(dataMap.logisStockList, $('#logis-stock-list'),$('#logisstock-list-template'), $('.logis-stock'));
			printPagination(dataMap.pageMaker,$('nav.pagination-nav'),$('#stocklogis-pagination-template'));
		}
	})
}

function safeStock() {
	if($('#customCheckbox2-label').attr('role') =='false'){
		
		$('#customCheckbox2-label').attr('role','true');
	} else {
		$('#customCheckbox2-label').attr('role','false');
	}
}

function fran_go() {
	location.href="<%=request.getContextPath()%>/hq/stock/detail";
}
//엔터키 이벤트
function enterkey() {
	if (window.event.keyCode == 13) {
		searchGoStockL();
    }
}

function refresh() {
	fms_local = "";
	fms_logis = "";
	fms_laca = "";
	fms_smca = "";
	fms_goods = "";
	document.querySelector('#fms-local').value = "";
	document.querySelector('#fms-logis').value = "";
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
<div class="modal fade" id="modal-logis" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">가맹점</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered logis-list" id="modal-fms-local">
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
<script type="text/x-handlerbars-template" id="logis-list-template">
	{{#each .}}  
			<tr class="logis" id="logis{{math @key '+' 1}}" onclick="javascript:logisKey('{{logis_name}}', '{{logis_code}}');">
				<td>{{logis_code}}</td>
				<td>{{logis_name}}</td>
				<td>{{logis_owner}}</td>
				<td>{{logis_addr}} {{logis_detail_addr}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//logis modal
	$('#btn-logis').on('click', function(){
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/logis.do',
			type:'get',
			success:function(goodsList){
				printData(goodsList, $('.logis-list'), $('#logis-list-template'), $('.logis'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-logis').modal('show');
			}
		})
	});
	
	// 가맹점을 선택하면 해당 값이 키워드로
	function logisKey(name, code){
		document.querySelector('#fms-logis').value = name;
		fms_logis = code;
		$('#modal-logis').modal('hide');
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
<script type="text/x-handlerbars-template" id="logisstock-list-template">
	{{#each .}}  
			<tr class="logis-stock" style="cursor: pointer;">
				<td>{{math @key "+" 1 }}</td>
				<td>{{logis_local_num }}</td>
				<td>{{logis_code }}</td>
				<td>{{logis_name }}</td>
				<td>{{wh_name }}</td>
				<td>{{sup_goods_laca }}</td>
				<td>{{sup_goods_smca }}</td>
				<td>{{sup_goods_name }}</td>
				<td>{{hq_goods_code }}</td>
			{{#ifCond logis_goods_stock logis_safe_stock }}
				<td>{{numberFormat logis_goods_stock }}</td>
			{{else}}
				<td style="color:red;">{{numberFormat logis_goods_stock }}</td>
			{{/ifCond}}
				<td>{{numberFormat logis_safe_stock }}</td>
				<td>{{numberFormat logis_suit_stock }}</td>
				<td>{{numberFormat goods_delivery_price}}</td>
				<td>{{numberFormat goods_max_order }}</td>
				<td>{{math logis_goods_stock "*" goods_delivery_price }}</td>
			
			</tr>
	{{/each}}
</script>
<!-- 키워드 검색 끝 -->
<!-- 키워드 페이지네이션 -->
<script type="text/x-handlebars-template"  id="stocklogis-pagination-template" >
<ul class="pagination justify-content-center m-0">
	<li class="paginate_button page-item">
		<a href="javascript:searchGoStockL(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="{{#if prev}}javascript:searchGoStockL({{prevPageNum}}){{else}}javascript:searchGoStockL(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}} ">
		<a href="javascript:searchGoStockL({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}

	<li class="paginate_button page-item ">
		<a href="{{#if next}}javascript:searchGoStockL({{nextPageNum}}){{else}}javascript:searchGoStockL(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:searchGoStockL({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>
</ul>
</script>
<!-- 키워드 페이지네이션 끝 -->
</body>