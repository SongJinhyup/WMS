<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="boardList" value="${dataMap.hqReturnList }" />
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

<body>
  	
    <!-- Content Header (Page header) -->
    <section class="content-header">
    	<div class="container-fluid">
    		<div class="row mb-2">
    			<div class="col-sm-6">
	      			<h1>반품신청목록</h1>
	      		</div>	      		
	    	
	       		
	       		<div class="col-sm-6">
			      <ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item"><a href="list.do"><i class="fa fa-dashboard"></i>자료실</a></li>
			        <li class="breadcrumb-item active">리스트</li>		        
			      </ol>
		      	</div>
	     	</div>	     	
      	</div>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:450px;">	
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
					  		<option value="10" ${cri.perPageNum==10 ? 'selected':'' } >정렬개수</option>
					  		<option value="20" ${cri.perPageNum==20 ? 'selected':'' }>20개씩</option>
					  		<option value="30" ${cri.perPageNum==30 ? 'selected':'' }>30개씩</option>
					  		<option value="50" ${cri.perPageNum==50 ? 'selected':'' }>50개씩</option>
					  		
					  	</select>		
						<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
						</select>	
										
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>						
				</div>			
			</div>
			<div class="card-body" style="height: 700px;" >
				<table class="table table-hover text-center">
					<tr style="font-size:1.2em;">
						<th style="width:5%;">번호</th>
						<th style="width:10%;">반품코드</th>
						<th style="width:15%;">제목</th>
						<th style="width:10%;">물품명</th>
						<th style="width:5%;">수량</th>
						<th style="width:10%;">반품사유</th>
						<th style="width:10%;">반품신청일자</th>
						<th style="width:10%;">첨부파일</th>
						<th style="width:10%;">승인여부</th>
					</tr>
					<c:forEach items="${boardList }" var="hqReturnList">
					<c:set var="i" value="${i+1 }" />
						<tr onclick="OpenWindow('detail.do?return_code=${hqReturnList.return_code }','','730','740');" style="cursor:pointer;" style='font-size:0.85em;'>
							<td>${i }</td>
							<td>${hqReturnList.return_code }</td>
							<td>${hqReturnList.return_title }</td>
							<td>${hqReturnList.hqGoodsVO.hq_goods_name }</td>
							<td>${hqReturnList.returnDetailVO.return_quan }</td>
							<c:if test="${hqReturnList.return_reason_code eq 1}">
								<td>오배송</td>
							</c:if>
							<c:if test="${hqReturnList.return_reason_code eq 2}">
								<td>결품</td>
							</c:if>
							<td><fmt:formatDate value="${hqReturnList.return_apply_date }" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${!empty hqReturnList.attachList }">
									<i class="nav-icon fas fa-file"></i>
								</c:if>
							</td>
							
							<c:if test="${hqReturnList.return_check_st eq '2'}">
								<td><div class="bg-primary color-palette" style="text-align: center;"><span>승인</span></div></td>
							</c:if>
							<c:if test="${hqReturnList.return_check_st eq '3'}">
								<td><div class="bg-warning color-palette" style="text-align: center;"><span>보류</span></div></td>
							</c:if>
							<c:if test="${hqReturnList.return_check_st eq '4'}">
								<td><div class="bg-red color-palette" style="text-align: center;"><span>반려</span></div></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>	
					</ul>
				</nav>
			</div>
		</div>
	</section>
   
</body>