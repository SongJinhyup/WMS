<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="appliList" value="${dataMap.appliList }" />

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
<title>가맹점신청서게시판</title>
<body>

	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>가맹점신청목록</h1>  				
	  			</div>
	  		</div>
	  	</div>
	</section>
	<!-- Main content -->
    <section class="content">		
		<div class="card">
		<div class="card-header with-border">
<!-- 				<button type="button" class="btn btn-primary" id="registBtn" onclick="OpenWindow('registForm.do','글등록',800,700);">자유게시판등록</button>			 -->
				<div id="keyword" class="card-tools" style="width:450px;">
					<div class="input-group row">
						<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
					  		onchange="list_go_regist();">
					  		<option value="10" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  	</select>						
						<select class="form-control col-md-4" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
						</select>
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" onclick="list_go_regist(1);" 
							data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>						
			</div>
			<div class="card-body" style="height: 700px;">
		<div class="col-12 col-sm-12">
          <div class="card-body">
                <table class="table table-hover text-center" >					
                  <tr style="font-size:0.95em;">
                    <th style="width:3%;">번 호</th>
                    <th style="width:5%;">신청코드</th>
                    <th style="width:15%;">주소</th>
                    <th style="width:5%;">신청자</th>
                    <th style="width:5%;">신청일자</th>
                    <th style="width:4%;">등록상태</th>
                    <th style="width:4%;">신청상태</th>
                    <!-- <th style="width:7%;">비 고</th> -->
                  </tr>				
                  <c:if test="${empty appliList }" >
                    <tr>
                      <td colspan="6">
                        <strong>해당 내용이 없습니다.</strong>
                      </td>
                    </tr>
                  </c:if>						
                  <c:forEach items="${appliList }" var="appli">
                  <c:set var="i" value="${i+1 }" />
                    <tr onclick="OpenWindow('detail.do?fran_applidoc_code=${appli.fran_applidoc_code }','상세보기', '800', '990');"
                                style='font-size: 1em;' style="cursor:pointer;">
                      <td>${i }</td>
                      <td>${appli.fran_applidoc_code }</td>
                      <td>${appli.fran_addr }</td>
                      <td>${appli.fran_owner }</td>
                      <td>
                        <fmt:formatDate value="${appli.fran_appli_date }" pattern="yyyy-MM-dd"/>
                      </td>
                      <c:if test="${appli.fran_reg_st eq 1 }">
                      <td><div class="bg-red color-palette" style="text-align: center;"><span>미등록</span></div></td>
                      </c:if>
                      <c:if test="${appli.fran_reg_st ne 1 }">
                      <td><div class="bg-primary color-palette" style="text-align: center;"><span>임시등록</span></div></td>
                      </c:if>
                      <c:if test="${appli.fran_applidoc_appr_st eq 1 }">
                      <td><div class="bg-warning color-palette" style="text-align: center;"><span>대기중</span></div></td>
                      </c:if>
                      <c:if test="${appli.fran_applidoc_appr_st ne 1 }">
                      <td><div class="bg-primary color-palette" style="text-align: center;"><span>승인</span></div></td>
                      </c:if>
                    </tr>
                  </c:forEach>
                </table>
              </div>
              <div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab" style="text-align: center;">
					<strong>해당 내용이 없습니다.</strong>
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/paginationREGIST.jsp" %>				
			</div>
		
    </section>
    <!-- /.content -->

</body>







