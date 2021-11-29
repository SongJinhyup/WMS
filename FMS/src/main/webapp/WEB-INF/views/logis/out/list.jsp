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
#out-plan-detail td {
	padding: 0.25rem;
}
#out-plan-detail tr {
	padding: 0.25rem;
}
.search-group, .form-control {
	font-size : 13px;
	text-align : right;
	padding-top: 6px;
}
span.search-group {
	padding-top: 5px;
}
.search-card {
	padding-top : 5px;
    padding-bottom: 0px;
	height : 75px;
    width: 1270px;
    margin: auto;
}
.search-body{
	padding : 10px 5px;
	height : 65px;
}
.search-navi{
	position : fixed;
	top : 27.5rem;
	left : 34rem;	
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
.bg-gradient-primary {
	background-color: #378DFC;
}

</style>
</head>
<body>
	<div class="">
	 <!-- Main content -->
		<div class="card search-card" style="margin-left : 5px; margin-bottom : 5px; height: 70px;">
			<div class="card-body search-body" style="height: 100px;">
	           	<div class="search-group">
					<div class="input-group">
						<!-- keyword -->
						<div class="input-group col-sm-10">
							<div class="input-group col-sm-6" style="position: relative; left: -4vh;">
								<span class=" search-group col-sm-2">기간</span>
								<div class="input-group input-group-sm col-sm-9">
									<div class="input-group-prepend">
										<button type="button" id="btn-period" style="height: 31px;" class="btn bg-gradient-primary btn-flat btn-fms-search">
											<i class="far fa-calendar-alt"></i>
										</button>
									</div>
									<input type="text" class="form-control float-right" id="reservation">
								</div>
							</div>
							<div class="input-group col-sm-4" style="position: relative; left: -7vh;">
								<div class="form-group col-sm-11">
									<select class="select2bs4" style="width: 100%;" data-placeholder="도착지명" data-select2-id="17" tabindex="-1" aria-hidden="true">
				                    		<option hidden ="true"></option>
				                    		<option >전체</option>
				                   		<c:forEach items="${outLocaFran }" var="fran">
				                    		<option value="${fran.out_loca }">${fran.out_loca } : ${fran.fran_name }</option>
				                    	</c:forEach>
				                    	<c:forEach items="${outLocaLogis }" var="logis">
				                    		<option value="${logis.out_loca }">${logis.out_loca } : ${logis.logis_name }</option>
				                    	</c:forEach>
				                	</select>
				                </div>
							</div>
							<div class="input-group col-sm-2" style="position: relative; left: -8vh;">
								<span class=" search-group col-sm-4">상태</span> <select class="form-control col-md-8" name="searchType" id="searchType" style="height: 31px;">
									<option value="" ${cri.searchType eq 'b' ? 'selected' : '' }>전체</option>
									<option value="1" ${cri.searchType eq 'b' ? 'selected' : '' }>출고</option>
									<option value="2" ${cri.searchType eq 'b' ? 'selected' : '' }>미출고</option>
								</select>
							</div>
						</div>
						<div class="input-group col-sm-2" style="position : relative; left : -1.5rem; top : -0.8rem;">
							<div class="input-group col-sm-2" style="height: 31px; top: -0.5rem; margin-top: 10px;">
								<span>
									<button style="height: 48px;" onclick="javascript:searchGo(1);" type="button" id="btn-search" class="btn btn-block btn-outline-primary btn-lg btn-fms-search">
										<i class="fas fa-sw fa-search">&nbsp;&nbsp;&nbsp;search</i>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
	        </div>
		</div>
		<div class="card col-12" style="max-width : 1270px; margin-left: 5px; min-height: 25.4rem; margin-bottom : 0.2rem;">
			<div class="card card-secondary card-tabs list-line" style="overflow-x: hidden;" >
				<!-- /.card-header -->
             	<div class="card-body table-responsive p-0">
                <table class="table table-hover" >
                	<thead>
	                    <tr>
							<th>no</th>
							<th>출고번호</th>
							<th>도착지</th>
							<th>출고일자</th>
							<th>출고상태</th>
						    <th>출고수량</th> 
						 </tr>
                  	</thead>
					<tbody id="out-plan-list">
		                    <c:forEach items="${outList }" var="out">
		                    	<c:set var="i" value="${i+1 }"/>
								<tr class="out-plan" onclick="javascript:out_go('${out.out_code }');" style="cursor: pointer;">
									<td>${i }</td>
									<td>${out.out_code }</td>
									<td>${out.out_loca_name }</td>
									<td><fmt:formatDate value="${out.out_date}" pattern="yyyy-MM-dd" /></td>
									<td>
										<c:if test="${out.out_st eq 1}">
												미출고
										</c:if>
										<c:if test="${out.out_st eq 2}">
											출고
										</c:if>
									</td>
									<td>${out.out_num  }</td> 
								</tr>
							</c:forEach>
	                 </tbody>
				</table>
            	</div>
		</div><!-- /.card-->
		<div class="card-body search-navi">
			<%@ include file="/WEB-INF/views/common/paginationFran.jsp"%>
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
							<th>물품코드</th>
							<th>물품명</th>
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
$(function(){
	 $('.select2bs4').select2({
	      theme: 'bootstrap4'
	    })
	 $('.select2bs3').select2({
	      theme: 'bootstrap4'
	    })
})
var data = "";
var out_code = "";
var fms_st = "";
var page = 1;

function searchGo(num){
	out_code = $('.select2-selection__rendered').text().slice(0,4);
	if ((out_code == '전체')||(out_code == '도착지명')) {
		out_code = '';
	}
	fms_st = $('#searchType').val();
	var period = $('#reservation').val();
	page = num;
	if(!num || num == '') page = 1;
	//날짜계산준비
	var dateArr = period.split(' ');
	for (var i=0; i < dateArr.length ; i++) {
		dateArr[i] = dateArr[i].slice(0, -1);
	}
	//시작날짜, 종료날짜
	start_date = dateArr[0] + dateArr[1] + dateArr[2];
	end_date = dateArr[4] + dateArr[5] + dateArr[6];
	data = {"out_code": out_code,"fms_st": fms_st, "page" : page, "start_date" : start_date, "end_date" : end_date};
	console.log(data);
	$.ajax({
		url : 'out/search.do', 
		method : 'POST',
		data : JSON.stringify(data),		
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success : function(dataMap) {
			printData(dataMap.outList, $('#out-plan-list'),$('#outplan-list-template'), $('.out-plan'));
			printPagination(dataMap.pageMaker,$('nav.pagination-nav'),$('#outplan-pagination-template'));
		}
	});
}

$(document).on('click', '.out-plan', function(e){
    e.preventDefault();
  $(this).css('background-color', 'gold');
   $('.out-plan').not($(this)).css('background-color', '#fff');
})
function out_go(data) {
	$.ajax({
		url : 'out/detail.do'
		, method : 'post'
		, data : data
		, success : function(outList) {
			
			$.each(outList, function(i,v){
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
			
			printData(outList, $('#out-plan-detail'),$('#outplan-detail-template'), $('.out-detail'));
		}
		, error : function(xhs) {
			alert('실사 데이터를 받아오지 못 했습니다.')
		}
		
	})
}
/* window.onload=function(){
	  $('#out-1').css('background-color', 'gold');
	  out_go($('#tr-1').text());
}  */
</script>
<script>
//F8 이벤트
function keyEvent() {
	if (window.event.keyCode == 119) {
		searchGo();
    }
}
</script>

<!-- 본문 내용 출력 -->
<script type="text/x-handlerbars-template" id="outplan-list-template">
	{{#each .}}  
			<tr class="out-plan" id="outPlan{{math @key '+' 1}}" onclick="javascript:out_go('{{out_code }}');" style="cursor: pointer;">
				<td>{{math @key "+" 1}}</td>
				<td>{{out_code }}</td>
				<td>{{out_loca_name }}</td>
				<td>{{prettifyDate out_date}}</td>
				<td>{{out_st }}</td>
				<td>{{out_num }}</td>
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
	{{#each .}}  
			
				<tr style="cursor: pointer;" class="out-detail" id="table-body-{{@key }}">	
				<td>{{out_code }}<input type="hidden" id="outCode{{@key }}" value="{{out_code }}"></td>
				<td>{{hq_goods_code }} <input type="hidden" id="goodsCode{{@key }}" value="{{hq_goods_code }}"></td>
				<td>{{hq_goods_name }}</td>
				<td>{{out_loca_name }}</td>
				{{#ifeq out_date }}
				<td>{{prettifyDate out_date }}</td>
				{{else}}
				<td>출고예정</td>
				{{/ifeq}}
				<td>{{out_st_name}}</td>
				<td class="contentable" id="f{{@key }}" name="out_num" value="{{out_num }}">{{out_num}}</td>
				<td id="modifytd{{@key }}" style="display:none;"><input type="text" id="outNum{{@key }}" name="out_num" class="form-control" value="{{out_num }}"style="width:100px;"></td>
				<td class="i{{@key }}"><button type="button" class="btn btn-warning" id="modifyBtn{{@key }}" onclick="modifyGo('{{@key }}', '{{out_num}}')" style="margin-top: 4px; font-size: 3px; width: 50px;">수정</button></td>
				<td class="i{{@key }}"><button type="button" class="btn btn-primary" id="saveBtn{{@key }}" onclick="saveGo('{{@key }}');" style="font-size: 3px; margin-top: 4px; display:none; position: relative; right: 100px; width: 50px;">저 장</button></td>
				<td class="i{{@key }}"><button type="button" class="btn btn-primary" id="cancelBtn{{@key }}" onclick="cancelGo('{{@key }}')" style="margin-top: 4px; display:none; font-size: 3px; position: relative; right: 150px; width: 50px;">취소</button></td>
				</tr>
	{{/each}}
</script>
<script>
function modifyGo(idx, num) {

	$('#modifyBtn' + idx).hide();
	$('#saveBtn' + idx).show();
	$('#cancelBtn' + idx).show();
	$('#modifytd' + idx).show();
	$('#f' + idx).hide();
}
function cancelGo(idx) {
	
	$('#modifyBtn' + idx).show();
	$('#cancelBtn' + idx).hide();
	$('#saveBtn' + idx).hide();
	$('#modifytd' + idx).hide();
	$('#f' + idx).show();
}

function saveGo(idx){
	var outCode = $("#outCode" + idx).val();
	var goodsCode = $("#goodsCode" + idx).val();
	var fmxNum = $("#outNum" + idx).val();
	
	
	
	data = {"out_code" : outCode, "out_num" : fmxNum , "hq_goods_code":goodsCode}
	console.log(data);
	$.ajax({
		url:'out/modify.do'
		, type : 'post'
		, data : JSON.stringify(data)
		, contentType : 'application/json; charset=UTF-8'
		, dataType : 'text'
		, success : function(result) {
			
			if(result == 'success'){
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
		<a href="javascript:searchGo(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="{{#if prev}}javascript:searchGo({{prevPageNum}}){{else}}javascript:searchGo(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}} ">
		<a href="javascript:searchGo({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}

	<li class="paginate_button page-item ">
		<a href="{{#if next}}javascript:searchGo({{nextPageNum}}){{else}}javascript:searchGo(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:searchGo({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>
</ul>
</script>
<!-- 페이지네이션 끝 -->
</body>