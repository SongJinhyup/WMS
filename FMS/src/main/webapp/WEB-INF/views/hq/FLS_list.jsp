<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker1.cri }" />
<c:set var="cri2" value="${pageMaker2.cri }" />
<c:set var="cri3" value="${pageMaker3.cri }" />
<head>
<style>
.th{
	background-color: silver;

}
.tab {
	width: 1000px;
	margin-left: 10%;
	
}
body {
	font-family: 'Gothic A1', sans-serif;
}

.table {
    font-size: 13px;
    text-align: center;
}
.search-group, .form-control {
	font-size : 12px;
	text-align : right;
}
.search-group {
	padding-top: 6px;
}
.search-card {
	padding-top : 5ps;
	padding-bottom : 0px; 	
}
.search-body{
	padding-bottom : 3px; 	
}
.input-padding-bottom {
	margin-bottom : 17px;
}
.custom-checkbox {
	padding-left : 140px;
}
#btn-goods {
	height : 31px;
}
.custom-control-label {
	padding-top: 3px;
}

</style>
<script src="<%=request.getContextPath()%>/resources/js/common.js" ></script>
</head>

<title>업체조회</title>

<body>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>업체조회</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>업체관리
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	검색
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
   	<section class="content">
   		<div class="card">
   			<div class="card-header with-border">
   				<!-- <button type="button" class="btn btn-primary" onclick="OpenWindow('registForm.do', '업체등록', '800', '700');" >업체등록</button> -->
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">	
   					 	
   					 	<!-- search bar -->
   					 	
   					 	
   					 	<!--  sort num -->
   					 	<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
   					 		<option value="10" >정렬개수</option>
   					 		<option value="2" ${cri1.perPageNum == 2 ? 'selected' : '' }>2개씩</option>
   					 		<option value="3" ${cri1.perPageNum == 3 ? 'selected' : '' }>3개씩</option>
   					 		<option value="5" ${cri1.perPageNum == 5 ? 'selected' : '' }>5개씩</option>
   					 	</select>
   					 	
   					 	<!-- search bar -->
   					 	<select class="form-control col-md-3" name="searchType" id="searchType">
   					 		<option value="" ${cri1.searchType eq '' ? 'selected' : '' }>검색구분</option>
   					 		<option value="i" ${cri1.searchType eq 'i' ? 'selected' : '' }>점주명</option>
   					 		<option value="p" ${cri1.searchType eq 'p' ? 'selected' : '' }>가맹점번호</option>
   					 		<option value="e" ${cri1.searchType eq 'e' ? 'selected' : '' }>전화번호</option>
   					 	</select>
   					 	
   					 	<!-- keyword -->
   					 	<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri1.keyword }"/>
   					 	
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" 
									id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
  		</div>
   	</section>

	<div class="row">
		<div class="col-12 col-sm-12">
			<div class="card card-secondary card-tabs">
				<div class="card-header p-0 pt-1">
				  <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
					<li class="nav-item">
					  <a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">가맹점</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">물류센터</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill" href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false">공급업체</a>
					</li>
					
				  </ul>
				</div>
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-one-tabContent">
						<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
							<!-- <div class="card-body" style="text-align:center;"> -->
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tr>
											<th>가맹점번호</th>
											<th>가맹점명</th>
											<th>점주명</th>
											<th>전화번호</th>
											<th>주소</th>
											<th>운영상태</th>
											<th>등록상태</th>
										</tr>

										<c:forEach items="${franList }" var="fran">
											<tr onclick="OpenWindow('frandetail.do?fcode=${fran.fran_code}','','550','900');" style="cursor: pointer;">
												<td>${fran.fran_code }</td>
												<td>${fran.fran_name }</td>
												<td>${fran.fran_owner }</td>
												<td>${fran.fran_tel }</td>
												<td>${fran.fran_addr }&nbsp;${fran.fran_detail_addr }</td>
												<td>${fran.fran_st }</td>
												<td>${fran.fran_reg_st }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination1.jsp"%>
							</div>
						</div>
						<!-- card-body -->


						<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tr>
											<th>물류센터코드</th>
											<th>물류센터명</th>
											<th>센터장</th>
											<th>전화번호</th>
											<th>주소</th>
											<th>계약상태</th>
											<th>등록상태</th>
										</tr>

										<c:forEach items="${logisList }" var="logis">
											<tr onclick="OpenWindow('logisdetail.do?lcode=${logis.logis_code}','','550','900');" style="cursor: pointer;">
												<td>${logis.logis_code }</td>
												<td>${logis.logis_name }</td>
												<td>${logis.logis_owner }</td>
												<td>${logis.logis_tel }</td>
												<td>${logis.logis_addr }&nbsp;${logis.logis_detail_addr }</td>
												<td>${logis.logis_contract_st }</td>
												<td>${logis.logis_reg_st }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
							<div class="card-footer">
								<%@ include file="/WEB-INF/views/common/pagination2.jsp"%>
							</div>
						</div>


						<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
							<table border="1" class="tab" style="margin-bottom: 20px;">
								<tr>
									<th class="th">키워드 검색</th>
									<th><select class="form-control" style="width: 300px; float: left; margin-left: 20px; margin-top: 5px;">
											<option>공급업체코드</option>
											<option>지역코드</option>
											<option>공급업체명</option>
									</select>

										<div class="row" style="width: 600px; float: left;">
											<div class="col-md-8 offset-md-2">
												<form action="simple-results.html">
													<div class="input-group">
														<input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
														<div class="input-group-append">
															<button type="submit" class="btn btn-lg btn-default">
																<i class="fa fa-search"></i>
															</button>
														</div>
													</div>
												</form>
											</div>
										</div></th>
								</tr>
								<tr>
									<th class="th">등록상태</th>
									<th>
										<div class="form-check" style="margin-left: 10px; float: left;">
											<input class="form-check-input" type="checkbox"> <label class="form-check-label">임시</label>
										</div>
										<div class="form-check" style="margin-left: 10px; float: left;">
											<input class="form-check-input" type="checkbox"> <label class="form-check-label">정식</label>
										</div>
										<button type="button" class="btn btn-block btn-primary btn-sm" style="margin-left: 20px; width: 80px;">검색</button>
									</th>
								</tr>

							</table>

							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tr>
											<th>공급업체코드</th>
											<th>지역번호</th>
											<th>대표자</th>
											<th>공급업체명</th>
											<th>등록상태</th>
											<th>계약상태</th>
										</tr>
										<c:forEach items="${supList }" var="sup">
											<tr onclick="OpenWindow('supdetail.do?scode=${sup.sup_code}','','550','900');" style="cursor: pointer;">
												<td>${sup.sup_code }</td>
												<td>${sup.sup_local_num }</td>
												<td>${sup.sup_owner }</td>
												<td>${sup.sup_name }</td>
												<td>${sup.sup_reg_st }</td>
												<td>${sup.sup_contract_st }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
							<div class="card-footer">
								<%-- 							<%@ include file="/WEB-INF/views/common/pagination3.jsp" %>    			 --%>
							</div>
						</div>
					</div>
					
					
					<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
					<!-- 주경이꺼 -->
					 <!-- <table border="1" class="tab" style="margin-bottom: 20px;">
					 	<tr>
					 		<th class="th">키워드 검색</th>
					 		<th>
					 		<select class="form-control" style="width: 300px; float: left; margin-left: 20px; margin-top: 5px;">
                          <option>공급업체코드</option>
                          <option>지역코드</option>
                          <option>공급업체명</option>
                        </select>
                        
					 <div class="row" style="width: 600px; float: left;">
               		 	<div class="col-md-8 offset-md-2">
		                    <form action="simple-results.html">
		                        <div class="input-group">
	                            <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
	                            <div class="input-group-append">
	                                <button type="submit" class="btn btn-lg btn-default">
	                                    <i class="fa fa-search"></i>
	                                </button>
	                            </div>
	                        </div>
		                    </form>
		                </div>
		            </div>
			 		</th>					 	
					 	</tr>
					 	<tr>
					 		<th  class="th">등록상태</th>
					 		<th>
					 		<div class="form-check" style="margin-left: 10px; float: left;">
                          <input class="form-check-input" type="checkbox">
                          <label class="form-check-label">임시</label> 
                        </div>
					 		<div class="form-check" style="margin-left: 10px;  float: left;">
                          <input class="form-check-input" type="checkbox">
                          <label class="form-check-label">정식</label> 
                        </div>
                       	<button type="button" class="btn btn-block btn-primary btn-sm" style="margin-left: 20px; width: 80px;">검색</button>
					 		</th>					 	
					 	</tr>
					 	
					 </table> -->
					 <!-- 주경이꺼 -->
					   
						<div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		                	<th>공급업체코드</th>
		                	<th>지역번호</th>
		                	<th>대표자</th>
		                	<th>공급업체명</th>
		                	<th>등록상태</th> 
		                	<th>계약상태</th> 
		               	</tr>
					<c:forEach items="${supList }" var="sup">
						<tr onclick="OpenWindow('supdetail.do?scode=${sup.sup_code}','','800','900');" style="cursor:pointer;">
							<td>${sup.sup_code }</td>
							<td>${sup.sup_local_num }</td>
			        		<td>${sup.sup_owner }</td>
			        		<td>${sup.sup_name }</td>
			        		<td>${sup.sup_reg_st }</td>
			        		<td>${sup.sup_contract_st }</td>
		               	</tr>
					</c:forEach>
		            </table>
    		     </div> <!-- col-sm-12 -->
    	       </div> <!-- row -->
		   		<div class="card-footer">
									<%@ include file="/WEB-INF/views/common/pagination3.jsp" %>    			
		   		</div>
	     </div>
<!-- 		</div> -->
					</div>
					
				  </div>
				</div>
			</div>
		</div>
	</div>
<c:if test="${from eq 'logis' }" >
	<script defer>
		logistab();
	</script>
</c:if>
<c:if test="${from eq 'sup' }" >
	<script defer>
		suptab();
	</script>
</c:if>
</body>