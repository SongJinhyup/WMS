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
.card {
	line-height: 0.3;
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
	padding-top: 6px;
}
span.search-group {
	padding-top: 10px;
}
.search-card {
	padding-top : 5px;
    padding-bottom: 0px;
	height : 75px;
    width: 1260px;
    margin: auto;
}
.search-body{
	padding : 10px 5px;
	height : 65px;
}
.search-navi{
	position : fixed;
	top : 94vh;
	left : 26vh;	
	font-size : 13px;
}
.input-padding-bottom {
	margin-bottom : 17px;
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
input.form-control {
text-align: left;
}
</style>
</head>

<title>재고실사</title>

<body>
	<div class="content-wrapper">
	 <!-- Main content -->
	<div class="card" style="max-width : 1270px; margin-left : 5px; margin-bottom : 5px;">
		<div class="card card-secondary card-tabs" style="overflow-x: hidden; margin-bottom : 1px; margin-top : 3px;" >
			<div class="card-header p-0 pt-1">
				<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="custom-tabs-one-home-tab" style="height: 2.3rem; padding-top: 13px;" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">출고</a></li>
				</ul>
			</div>
		</div>
			
			<div class ="card-tools">
					<button type="button" class="btn btn-block bg-gradient-primary btn-sm" style="width: 7%; margin-left: 90%; margin-top: 5px;" onclick="OpenWindow('outRegistForm.do','글등록',800,900);">등록</button>							
					&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="card-body search-card">
				<div class="card">
					<div class="card-body search-body">
		            	<div class="search-group">
		   					<div class="input-group">
		   					 	<!-- keyword -->
		   					 	<div class="input-group col-sm-12">
								 	<div class="input-group col-sm-4">
										<span class=" search-group col-sm-2">기간</span>
										<div class="input-group input-group-sm col-sm-9">
											<div class="input-group-prepend">
												<button type="button" id="btn-period" class="btn bg-gradient-secondary btn-flat btn-fms-search">
													<i class="far fa-calendar-alt"></i>
												</button>
											</div>
											<input type="text" class="form-control float-right" id="reservation">
										</div><!-- /.input group -->
									</div>
									<div class="input-group col-sm-3" style="position: relative; left: -6vh;">
										<span class=" search-group col-sm-4">물류센터</span>
										<div class="input-group input-group-sm col-sm-8">
											<input type="text" id="fms-logis" name="fms-logis" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
											<span class="input-group-append">
												<button type="button" id="btn-logis" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
											</span>
										</div>
									</div>
									<div class="input-group col-sm-3" style="position: relative; left: -11vh;">
										<span class=" search-group col-sm-4">창고</span>
										<div class="input-group input-group-sm col-sm-8">
											<input type="text" id="fms-wh" name="fms-wh" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
											<span class="input-group-append">
												<button type="button" id="btn-wh" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
											</span>
										</div>
									</div>
									<div class="input-group col-sm-2" style="height: 31px; top : -0.5rem;">
										<span>
											<button style="height : 48px;" onclick="javascript:searchGoStockL();" type="button" id="btn-search" class="btn btn-block btn-outline-secondary btn-lg btn-fms-search"><i class="fas fa-sw fa-search">&nbsp;&nbsp;&nbsp;search</i></button>
										</span>
									</div>
								</div>
							</div>
	   					</div>
		             </div>
				</div>
			</div>
		</div>
		<div class="card col-6 float-left" style="max-width : 630px; margin-left: 3px; min-height: 38.4rem;">
			<div class="card card-secondary card-tabs list-line" style="overflow-x: hidden; margin-top : 10px;" >
					<!-- /.card-header -->
              	<div class="card-body table-responsive p-0">
	                <table class="table table-hover" >
	                	<thead>
		                    <tr>
								<th>no</th>
								<th>실사코드</th>
								<th>센터코드</th>
								<th>센터명</th>
								<th>창고명</th>
								<th>창고코드</th>
								<th>실사날짜</th>
							 </tr>
	                  	</thead>
						<tbody id="logis-stock-list">
 		                    <c:forEach items="${logisStockTakingList }" var="stock">
		                    	<c:set var="i" value="${i+1 }"/>
								<tr class="logis-stock" onclick="javascipt:taking_go('${stock.taking_code }');" style="cursor: pointer;">
									<td>${i }</td>
									<td>${stock.taking_code }</td>
									<td>${stock.logis_code }</td>
									<td>${stock.logis_name }</td>
									<td>${stock.wh_code }</td>
									<td>${stock.wh_name }</td>
									<td><fmt:formatDate value="${stock.taking_date}" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
		                 </tbody>
					</table>
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
		<div class="card col-6  float-left" style="margin-left: 3px; min-height: 38.4rem; overflow-y: auto;">
			<div class="card card-secondary card-tabs" style="overflow-x: hidden; margin-top : 10px;" >
					<!-- /.card-header -->
              	<div class="card-body table-responsive p-0">
	                <table class="table table-hover" >
	                	<thead>
		                    <tr>
								<th>no</th>
								<th>물품코드</th>
								<th>물품명</th>
								<th>전산재고</th>
								<th>실사재고</th>
								<th>차이수량</th>
								<th>조정수량</th>
								<th>현재고</th>
								<th>비고</th>
							 </tr>
	                  	</thead>
						<tbody id="logis-stock-detail">
		                 </tbody>
					</table>
             	</div>
			</div><!-- /.card-->
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>

function registGo() {
	
	
}




var data = "";
var fms_logis = "";
var fms_wh = "";
var start_date = "";
var end_date ="";
var stockpage = 1;
//물류센터 재고조회 ajax
function searchGoStockL(page, url){
	fms_logis = $('#fms-logis').attr('role');
	fms_wh = $('#fms-wh').attr('role');
	var period = $('#reservation').val()
	if(!page) page = 1;
	if(!url) url= 'searchlogistaking.do';
	//날짜계산준비
	var dateArr = period.split(' ');
	for (var i=0; i < dateArr.length ; i++) {
		dateArr[i] = dateArr[i].slice(0, -1);
	}
	//시작날짜, 종료날짜
	start_date = dateArr[0] + dateArr[1] + dateArr[2];
	end_date = dateArr[4] + dateArr[5] + dateArr[6];
	data = {"fms_logis": fms_logis, "fms_wh": fms_wh, "page" : page, "start_date" : start_date, "end_date" : end_date};
	console.log(data);
	$.ajax({
		url : url
		, method : 'post'
		, data : JSON.stringify(data)
		, contentType : 'application/json; charset=UTF-8'
		, dataType : 'json'
		, success : function(dataMap) {
			stockpage = page;
			printData(dataMap.logisStockTakingList, $('#logis-stock-list'),$('#logisstock-list-template'), $('.logis-stock'));
			printPagination(dataMap.pageMaker,$('nav.pagination-nav'),$('#stocklogis-pagination-template'));
		}
	})
}

$(document).on('click', '.logis-stock', function(e){
    e.preventDefault();
  $(this).css('background-color', 'gold');
   $('.logis-stock').not($(this)).css('background-color', '#fff');
})
function taking_go(data) {
	$.ajax({
		url : 'logistakingdetail.do'
		, method : 'post'
		, data : data
		, success : function(takingList) {
			console.log(takingList);
			printData(takingList, $('#logis-stock-detail'),$('#logisstock-detail-template'), $('.taking-detail'));
		}
		, error : function(xhs) {
			swal('실사 데이터가 없습니다.');
		}
		
	})
}
</script>
<script>
//엔터키 이벤트
function enterkey() {
	if (window.event.keyCode == 13) {
		searchGoStockL();
    }
}
</script>
<!-- 물류센터 검색 -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-logis" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">물류센터</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body table-responsive p-0 table-scroll">
				<table class="table table-hover" id="modal-fms-logis">
					<thead>
						<tr>
								<th>no</th>
								<th>코드</th>
								<th>물류센터명</th>
								<th>대표</th>
								<th>주소</th>
						</tr>
					</thead>
					<tbody class="logis-list">
					<!-- modal이 뿌려질 영역 -->
					</tbody>
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
			<tr class="logis" id="logis{{@key}}" onclick="javascript:logisKey('{{logis_name}}','{{logis_code}}');">
				<td>{{math @key "+" 1}}</td>
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
			success:function(logisList){
				printData(logisList, $('.logis-list'), $('#logis-list-template'), $('.logis'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-logis').modal('show');
			}
		})
	});
	
	// 창고를 선택하면 해당 값이 키워드로
	function logisKey(name, code){
		document.querySelector('#fms-logis').value = name;
		document.querySelector('#fms-logis').setAttribute('role', code);
		$('#modal-logis').modal('hide');
	}

</script>
<!-- 물류센터 검색 끝 -->
<!-- 창고 검색  -->
<!-- 모달 영역 -->
<div class="modal fade" id="modal-wh" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">창고</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body table-responsive p-0 table-scroll">
				<table class="table table-hover" id="modal-fms-wh">
					<thead>
						<tr>
								<th>no</th>
								<th>코드</th>
								<th>창고명</th>
						</tr>
					</thead>
					<tbody class="wh-list">
					<!-- modal이 뿌려질 영역 -->
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>
<!-- 모달 끝 -->
<script type="text/x-handlerbars-template" id="wh-list-template">
	{{#each .}}  
			<tr class="wh" id="wh{{@key}}" onclick="javascript:whKey('{{wh_name}}','{{wh_code}}');">
				<td>{{math @key "+" 1}}</td>
				<td>{{wh_code}}</td>
				<td>{{wh_name}}</td>
			</tr>
	{{/each}}
</script>
<script>
	//goods modal
	$('#btn-wh').on('click', function(){
		fms_logis = $('#fms-logis').attr('role');
		if (!fms_logis) {
			alert('물류센터를 먼저 선택하세요.');
			return;
		}
		data = {"fms_logis" : fms_logis};
		console.log(data);
		$.ajax({
			url:'<%=request.getContextPath()%>/keyword/wh.do?',
			type:'post',
			data:JSON.stringify(data),	
			contentType:'application/json',
			success:function(whList){
				printData(whList, $('.wh-list'), $('#wh-list-template'), $('.wh'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-wh').modal('show');
			}
		})
	});
	
	// 물품을 선택하면 해당 값이 키워드로
	function whKey(name,code){
		document.querySelector('#fms-wh').value = name;
		document.querySelector('#fms-wh').setAttribute('role', code);
		$('#modal-wh').modal('hide');
	}
	
</script>
<!-- 창고검색 검색 끝 -->
<!-- 키워드 검색 끝 -->
<!-- 본문 내용 출력 -->
<script type="text/x-handlerbars-template" id="logisstock-list-template">
	{{#each .}}  
			<tr class="logis-stock" onclick="javascipt:taking_go('{{taking_code }}');" style="cursor: pointer;">
				<td>{{math @key "+" 1}}</td>
				<td>{{taking_code }}</td>
				<td>{{logis_code }}</td>
				<td>{{logis_name }}</td>
				<td>{{wh_code }}</td>
				<td>{{wh_name }}</td>
				<td>{{prettifyDate taking_date}}</td>
			</tr>
	{{/each}}
</script>
<!-- 본문 내용 출력 끝 -->
<!-- 상세 내용 출력 -->
<script type="text/x-handlerbars-template" id="logisstock-detail-template">
	{{#each .}}  
			<tr class="taking-detail" style="cursor: pointer;">
				<td>{{math @key "+" 1}}</td>
				<td>{{hq_goods_code }}</td>
				<td>{{hq_goods_name }}</td>
				<td>{{numberFormat computer_stock }}</td>
				<td>{{numberFormat actual_stock }}</td>
				<td>{{numberFormat deff_quantity }}</td>
				<td>{{numberFormat adjust_quantity }}</td>
				<td>{{numberFormat logis_goods_stock}}</td>
				<td>{{note}}</td>
			</tr>
	{{/each}}
</script>
<!-- 상세 내용 출력 끝 -->
<!-- 페이지네이션 -->
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
<!-- 페이지네이션 끝 -->
</body>