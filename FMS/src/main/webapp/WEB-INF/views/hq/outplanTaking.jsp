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
	top : 35rem;
	left : 27rem;	
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
	<div class="">
	 <!-- Main content -->
	<div class="card" style="max-width : 1270px; margin-left : 5px; margin-bottom : 5px; height: 200px;">
		<div class="card card-secondary card-tabs" style="overflow-x: hidden; margin-bottom : 1px; margin-top : 3px;" >
			<div class="card-header p-0 pt-1">
				<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
					<li class="nav-item"><a class="nav-link disable" id="custom-tabs-one-home-tab" style="height: 2.3rem; padding-top: 13px;" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="false">입고</a></li>
					<li class="nav-item"><a class="nav-link active" id="custom-tabs-one-home-tab" style="height: 2.3rem; padding-top: 13px;" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">출고</a></li>
				</ul>
			</div>
		</div>
			
			<div class ="card-tools">
					  <button type="button" class="btn btn-block bg-gradient-primary btn-sm" style="width: 7%; margin-left: 90%; margin-top: 5px;" onclick="OpenWindow('outRegistForm.do','등록', '1280', '900');">등록</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="card-body search-card" style="width: 1100px;">
				<div class="card">
					<div class="card-body search-body" style="height: 100px;">
		            	<div class="search-group">
		   					<div class="input-group">
		   					 	<!-- keyword -->
		   					 	<div class="input-group col-sm-10" >
								 	
								 	<div class="input-group col-sm-6">
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
									
									<div class="input-group col-sm-6" style="position: relative; left: -6vh;">
										<span class=" search-group col-sm-4">물류센터</span>
										<div class="input-group input-group-sm col-sm-8">
											<input type="text" id="fms-logis" name="fms-logis" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
											<span class="input-group-append">
												<button type="button" id="btn-logis" class="btn bg-gradient-secondary btn-flat btn-fms-search"><i class="fas fa-sw fa-search"></i></button>
											</span>
										</div>
									</div>
								
								
									<div class="input-group col-sm-6" style="position: relative; left: -6vh; margin-top: 10px;">
										<span class=" search-group col-sm-4">가맹점</span>
										<div class="input-group input-group-sm col-sm-8">
											<input type="text" id="fms-fran" name="fms-fran" onkeyup="enterkey();" class="form-control form-fms-search" value="" >
											<span class="input-group-append">
												<button type="button" id="btn-fran" class="btn bg-gradient-secondary btn-flat btn-fms-search" style="height: 31px;"><i class="fas fa-sw fa-search"></i></button>
											</span>
										</div>
									</div>
									
									<div class="input-group col-sm-6" style="position: relative; left: -6vh; margin-top: 10px;">
									<span class=" search-group col-sm-4">출고상태</span>
									<select class="form-control col-md-8" name="searchType" id="searchType" style="height: 31px;">
			   					 		<option value="1" ${cri.searchType eq 'b' ? 'selected' : '' }>출고</option>
			   					 		<option value="2" ${cri.searchType eq 'b' ? 'selected' : '' }>미출고</option>
   					 				</select>
   					 				</div>
   					 			</div>
									
									<div class="input-group col-sm-2" style="margin-top: 10px;">
									<div class="input-group col-sm-2" style="height: 31px; top : -0.5rem; margin-top: 10px;">
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
		<div class="card col-12" style="max-width : 1270px; margin-left: 3px; min-height: 25.4rem;">
			<div class="card card-secondary card-tabs list-line" style="overflow-x: hidden; margin-top : 10px;" >
					<!-- /.card-header -->
              	<div class="card-body table-responsive p-0">
	                <table class="table table-hover" >
	                	<thead>
		                    <tr>
								<th>no</th>
								<th>출고번호</th>
								<th>물류센터코드</th>
								<th>도착지</th>
								<th>출고일자</th>
								<th>출고상태</th>
							    
							 </tr>
	                  	</thead>
						<tbody id="out-plan-list">
 		                    <c:forEach items="${outTakingList }" var="out">
		                    	<c:set var="i" value="${i+1 }"/>
								<%-- <tr onclick="OpenWindow('outdetail.do?ocode=${out.out_code}','','800','900');" style="cursor:pointer;"> --%>
								<tr class="out-plan" onclick="javascript:taking_go('${out.out_code }');" style="cursor: pointer;">
									<td>${i }</td>
									<td>${out.out_code }</td>
									<td>${out.logisVO.logis_name }</td>
									<td>${out.franVO.fran_name }</td> 
									<td><fmt:formatDate value="${out.out_date}" pattern="yyyy-MM-dd" /></td>
									<td>
									<c:if test="${out.out_st eq 1}">
											미출고
										</c:if>
										<c:if test="${out.out_st eq 2}">
											출고
										</c:if>
									</td>
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
		
		<div class="card col-12" style="margin-left: 3px; min-height: 25.4rem; height:5vh; overflow-y:scroll;">
			<div class="card card-secondary card-tabs" style="overflow-x: hidden;" >
					<!-- /.card-header -->
              	<div class="card-body table-responsive p-0">
	                <table class="table table-hover" >
	                	<thead>
		                    <tr>
								<th>출고번호</th>
								<th>본사물품코드</th>
								<th>물류센터코드</th>
								<th>도착지</th>
								<th>출고일자</th>
								<th>출고상태</th>
								<th>출고수량</th>
								<th>수정</th>
							 </tr>
	                  	</thead>
						<tbody id="out-plan-detail">
		                 </tbody>
					</table>
             	</div>
			</div><!-- /.card-->
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
var data = "";
var fms_logis = "";
var fms_fran = "";
var fms_st = "";
var start_date = "";
var end_date ="";
var stockpage = 1;

//물류센터 재고조회 ajax
function searchGoStockL(page, url){
	fms_logis = $('#fms-logis').attr('role');
	fms_fran = $('#fms-fran').attr('role');
	
	console.log(fms_logis, fms_fran);
	if(fms_logis==""){
		fms_logis = fms_fran;
	}
	
	fms_st = $('#searchType').val();
	var period = $('#reservation').val();
	if(!page) page = 1;
	if(!url) url= 'search.do';
	//날짜계산준비
	var dateArr = period.split(' ');
	for (var i=0; i < dateArr.length ; i++) {
		dateArr[i] = dateArr[i].slice(0, -1);
	}
	//시작날짜, 종료날짜
	start_date = dateArr[0] + dateArr[1] + dateArr[2];
	end_date = dateArr[4] + dateArr[5] + dateArr[6];
	data = {"fms_logis": fms_logis,/* "fms_fran" : fms_fran,*/ "fms_st": fms_st, "page" : page, "start_date" : start_date, "end_date" : end_date};
	console.log(data);
	$.ajax({
		url : url, 
		method : 'POST',
		data : JSON.stringify(data),		
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success : function(dataMap) {
			stockpage = page;														
			printData(dataMap.outTakingList, $('#out-plan-list'),$('#outplan-list-template'), $('.out-plan'));
			printPagination(dataMap.pageMaker,$('nav.pagination-nav'),$('#outplan-pagination-template'));
		}
	});
}


$(document).on('click', '.out-plan', function(e){
    e.preventDefault();
  $(this).css('background-color', 'gold');
   $('.out-plan').not($(this)).css('background-color', '#fff');
})


function taking_go(data) {
	//console.log(data);
	$.ajax({
		url : 'outtakingdetail.do'
		, method : 'post'
		, data : data
		, success : function(takingList) {
			
			console.log(takingList);
			$.each(takingList, function(i,v){
				if(v.out_loca_type==1){
					v.out_loca_type_name = "물류센터";
				}else{
					v.out_loca_type_name = "가맹점";
				}
				
				if(v.out_st==1){
					v.out_st_name = "출고";
				}else{
					v.out_st_name = "미출고";
				}
			});
			
			printData(takingList, $('#out-plan-detail'),$('#outplan-detail-template'), $('.taking-detail'));
		}
		, error : function(xhs) {
			swal('실사 데이터가 없습니다.');
		}
		
	})
}
/* window.onload=function(){
	  $('#taking-1').css('background-color', 'gold');
	  taking_go($('#tr-1').text());
}  */
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
	<div class="modal-dialog" role="document">
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
			url:'<%=request.getContextPath()%>/keyword/outLogis.do',
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

		document.querySelector('#fms-fran').value = '';
		document.querySelector('#fms-fran').setAttribute('role', '');
		
		
		$('#modal-logis').modal('hide');
	}

</script>
<!-- 물류센터 검색 끝 -->
<!-- 가맹점 검색 시작 -->
<!-- 모달 시작 -->
<div class="modal fade" id="modal-fran" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">가맹점</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
			<div class="modal-body table-responsive p-0 table-scroll">
				<table class="table table-hover" id="modal-fms-fran">
					<thead>
						<tr>
								<th>no</th>
								<th>코드</th>
								<th>가맹점명</th>
								<th>대표</th>
								<th>주소</th>
						</tr>
					</thead>
					<tbody class="fran-list">
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
<script type="text/x-handlerbars-template" id="fran-list-template">
	{{#each .}}  
			<tr class="fran" id="fran{{@key}}" onclick="javascript:franKey('{{fran_name}}','{{fran_code}}');">
				<td>{{math @key "+" 1}}</td>
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
			url:'<%=request.getContextPath()%>/keyword/outFran.do',
			type:'get',
			//data:JSON.stringify(data),	
			contentType:'application/json',
			success:function(franList){
				printData(franList, $('.fran-list'), $('#fran-list-template'), $('.fran'))
			},
			error:function(error){
				// alert('데이터를 불러오는데 실패했습니다.');
			},
			complete:function(){
				$('#modal-fran').modal('show');
			}
		})
	});
	
	// 창고를 선택하면 해당 값이 키워드로
	function franKey(name, code){
		document.querySelector('#fms-fran').value = name;
		document.querySelector('#fms-fran').setAttribute('role', code);
		
		document.querySelector('#fms-logis').value = '';
		document.querySelector('#fms-logis').setAttribute('role', '');
		$('#modal-fran').modal('hide');
	}


</script>
<!-- 창고검색 검색 끝 -->
<!-- 키워드 검색 끝 -->
<!-- 본문 내용 출력 -->
<script type="text/x-handlerbars-template" id="outplan-list-template">
	{{#each .}}  
			<tr class="out-plan" id="outPlan{{math @key '+' 1}}" onclick="javascript:taking_go('{{out_code }}');" style="cursor: pointer;">
				<td>{{math @key "+" 1}}</td>
				<td>{{out_code }}</td>
				<td>{{logisVO.logis_name }}</td>
				<td>{{franVO.fran_name }}</td>
				<td>{{prettifyDate out_date}}</td>
				<td>{{out_st }}</td>
			</tr>
	{{/each}}
</script>
<!-- 본문 내용 출력 끝 -->
<!-- 상세 내용 출력 -->
<!-- Handlebars.registerHelper('outLocaType', function(out_loca_type) {
  if(out_loca_type === 1) {
    return options.fn(this);
  }
  return options.inverse(this);
});
 -->
<script type="text/x-handlerbars-template" id="outplan-detail-template">
	<script type="text/x-handlerbars-template" id="outplan-detail-template">
   {{#each .}}  
            <tr style="cursor: pointer;" class="taking-detail" id="table-body-{{@key }}">   
            <td>{{out_code }}<input type="hidden" id="outCode{{@key }}" value="{{out_code }}"></td>
            <td>{{hqGoodsVO.hq_goods_name }}<input type="hidden" id="goodsCode{{@key }}" value="{{hq_goods_code }}"></td>
            <td>{{logisVO.logis_name }}</td>
            <td>{{franVO.fran_name }}</td>
            {{#ifeq out_date }}
            <td>{{prettifyDate out_date }}</td>
            {{else}}
            <td>출고예정</td>
            {{/ifeq}}
            <td>{{out_st_name}}</td>
            <td class="contentable" id="f{{@key }}" name="out_num" value="{{out_num }}">{{out_num}}</td>
            <td class="i{{@key }}">
			<button type="button" class="btn btn-warning" id="modifyBtn{{@key }}" onclick="modifyGo('{{@key }}', '{{out_num}}')" style="margin-top: 4px; font-size: 3px; width: 50px;">수정</button>
            <button type="button" class="btn btn-primary" id="saveBtn{{@key }}" onclick="saveGo('{{@key }}');" style="font-size: 3px; margin-top: 4px; display:none;  width: 50px;">저 장</button>
            <button type="button" class="btn btn-primary" id="cancelBtn{{@key }}" onclick="cancelGo('{{@key }}')" style="margin-top: 4px; display:none; font-size: 3px;  width: 50px;">취소</button>
			</td>
            </tr>
   {{/each}}
</script>
<!-- </script> -->
<script>
function modifyGo(idx) {

	$('#modifyBtn' + idx).hide();
	$('#saveBtn' + idx).show();
	$('#cancelBtn' + idx).show();
	//$('.contentable').attr('contenteditable', 'true');
	
	
	$('#f' + idx).append('<td style="position: relative; left: 30px;"><input type="text" id="outNum'+idx+'" name="out_num" class="form-control" style="width:100px;"></td>');
}
function cancelGo(idx) {
	
	
	$('#modifyBtn' + idx).show();
	$('#cancelBtn' + idx).hide();
	$('#saveBtn' + idx).hide();
	//$('.contentable').attr('contenteditable', 'false');

	
	$('td','#f' + idx).remove();
	
	
}
function saveGo(idx){
	var outCode = $("#outCode" + idx).val();
	var goodsCode = $("#goodsCode" + idx).val();
	var fmxNum = $("#outNum" + idx).val();
	
	
	
	data = {"out_code" : outCode, "out_num" : fmxNum , "hq_goods_code":goodsCode}
	
	$.ajax({
		url:'outmodify.do'
		, type : 'post'
		, data : JSON.stringify(data)
		, contentType : 'application/json; charset=UTF-8'
		, dataType : 'text'
		, success : function(result) {
			
			if(result == 'modify'){
				alert("수정되었습니다.");
				location.reload();
			}
		}
		, error:function(){
			if($("#outNum" + idx).val() == ""){ 
				alert("출고수량을 입력해주세요"); $("#outNum").focus(); return false; }
	    }	
	
	}) 
	
}
</script>
<!-- 상세 내용 출력 끝 -->
<!-- 페이지네이션 -->
<script type="text/x-handlebars-template"  id="outplan-pagination-template" >
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