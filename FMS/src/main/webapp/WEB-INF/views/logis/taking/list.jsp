<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="taking" value="${dataMap.takingStock }" />
<c:set var="lacaList" value="${dataMap.lacaList }" />
<c:set var="smcaList" value="${dataMap.smcaList }" />
<c:set var="whList" value="${dataMap.whComboList }" />
<c:set var="keyword" value="${dataMap.keyword }" />

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

	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h5>${loginLogis.logis_name } 재고실사</h5>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>재고실사
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	목록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
	<section class="content">
		<div class="card">
         <div class="card-body search-body" style="height: auto;">
            <div class="search-group">
               <div class="input-group">
					<select class="form-control col-md-3" name="wh" id="wh"
                       onchange="list_go_logis();" style="text-align: center;">
                    <c:if test="${!empty whList }" >
                       <option value="" >창고명으로 검색</option>
                       <c:forEach var="wh" items="${whList }" varStatus="i">
                       <option id="wh${i.index + 1}" value="${wh.wh_name }" ${wh.wh_name eq '${wh.wh_name}' ? 'selected':''} >${wh.wh_name }</option>
                       </c:forEach>
                    </c:if>
                    </select>
               <div style="float: center;">
               </div>
               	  <button style="margin-left: 900px;" type="button" class="btn btn-warning " id="takingbtn" onclick="javascript:taking_go('${loginLogis.logis_code}');">실사</button>
               </div>
            </div>
         </div>
		</div>
		<div class="card-body" style="height: 728.88px;">
			<table class="table table-hover text-center">
				<tr style="font-size: 1.2em;">
					<th style="width: 5%;">번 호</th>
					<th style="width: 7%;">실사코드</th>
					<th style="width: 7%;">창고코드</th>
					<th style="width: 10%;">창고명</th>
					<th style="width: 6%;">실사날짜</th>
					<th style="width: 7%;">상태</th>
				</tr>
				<c:if test="${empty dataMap.takingStock }">
					<tr>
						<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
					</tr>
				</c:if>
				<c:forEach items="${dataMap.takingStock }" var="taking">
					<c:set var="i" value="${i+1 }" />
					 <tr
                		  onclick="OpenWindow('detail.do?taking_code=${taking.taking_code }&logis_code=${loginLogis.logis_code }&wh_code=${taking.wh_code }','상세보기',980,700);"
                 		  style='font-size: 1em;' style="cursor:pointer;">
						<td>${i }</td>
						<td>${taking.taking_code }</td>
						<td>${taking.wh_code }</td>
						<td>${taking.wh_name }</td>
						<td>${taking.tdate }</td>
						<td>${taking.st }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="card-body col-6">
		
		</div>
		
<!-- </div> -->
		<div class="card-footer">
			<%@ include file="/WEB-INF/views/common/paginationLStock.jsp"%>
		</div>

	</section>
	<!-- /.content -->
<script>
var whCode = "";
var whName = ""; 
var takingCode = "";
//실사 진행 함수
function taking_go(logiscode) {
	data = {"fms_logis" : logiscode};
	$.ajax({
		url:'<%=request.getContextPath()%>/keyword/wh.do?',
		type:'post',
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(whList){
			printData(whList, $('.wh-list'), $('#wh-list-template'), $('.wh'))
		},
		complete:function(){
			$('#modal-wh').modal('show');
		}
	})

}

// 실사 진행 - 전화번호는 세션정보(변경가능), 창고정보는 서버통신을 통해서(option값을 가져와도 됨)
var phoneNum = "";
function whKey(name,code){
	phoneNum = $('#logisTel').val();
	whCode = code;
	whName = name;
	$('#modal-wh').modal('hide');
	swal({
			text : phoneNum + "번호로 \n" + code + ':' + name + '의 재고실사를 진행합니다.'
			, dangerMode : true
			, buttons: true
	})
	.then(function(result){
		if (result == true){
			newSeq();
		}
	});
}
function newSeq() {
	$.ajax({
		url : "<%=request.getContextPath()%>/logis/stockcheck/newSeq"
		, success : function(data) {
			takingCode = 'LT0' + data;
			sessionStorage.setItem('takingCode', takingCode);
			fn_serialNum(phoneNum, takingCode);
		}
	})
}
//휴대폰 인증 보내기 버튼
function fn_serialNum(phoneNum, code) {
	  sessionStorage.setItem('whCode', whCode);
	  sessionStorage.setItem('logisCode', '${loginLogis.logis_code}');
	  data = JSON.stringify({ "phoneNum" : phoneNum, "whCode" : whCode, "logisCode" : '${loginLogis.logis_code}', "takingCode" : code});
	  console.log(data);
      $.ajax({
         type: "POST",
         url: "<%=request.getContextPath()%>/logis/message",
         data: data,
         contentType : 'application/json; charset=UTF-8',
         success: function(res) {
         	if (res != "success") {
         		swal('잘못된 번호 입력으로 실사를 진행할 수 없습니다. \n 다시 진행해주세요.');
         		return;
         	}
         	OpenWindow('takingregist.do?takingCode='+takingCode+'&logis_code=${loginLogis.logis_code }&wh_code='+whCode+'&wh_name='+whName,'상세보기',900,850);
         }
	});
}


</script>
<!-- 실사진행용 모달 -->
<div class="modal fade" id="modal-wh" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 style="margin-top: 10px; margin-left: 180px;border-bottom-color: #378DFC; border-bottom-width: thin; text-align: center;">실사진행 </h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>	
				</button>
			</div>
			<div class="modal-header">
				<h6 class="modal-title" id="exampleModalLabel">전화번호를 입력하세요.</h6>
				<input type="number" id="logisTel" name="logisTel" value="${loginLogis.logis_tel}">
			</div>
			<div class="modal-header">
				<h6 class="modal-title" id="exampleModalLabel">아래 창고를 선택하세요.</h6>
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
<script type="text/x-handlerbars-template" id="wh-list-template">
	{{#each .}}  
			<tr class="wh" id="wh{{@key}}" onclick="javascript:whKey('{{wh_name}}','{{wh_code}}');">
				<td>{{math @key "+" 1}}</td>
				<td>{{wh_code}}</td>
				<td>{{wh_name}}</td>
			</tr>
	{{/each}}
</script>
</body>