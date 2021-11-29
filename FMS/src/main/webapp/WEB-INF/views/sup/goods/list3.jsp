<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="supGoodsList" value="${dataMap.supGoodsList }" />
<c:set var="lacaList" value="${dataMap.lacaList }" />
<c:set var="smcaList" value="${dataMap.smcaList }" />
<c:set var="keyword" value="${dataMap.keyword }" />
<head></head>

<title>물품목록</title>

<body>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.50/jquery.form.min.js"></script> -->
<script src="<%=request.getContextPath() %>/resources/js/common_kjy.js"></script>


	<c:if test="${from eq 'regist' }" >
		<script>
			alert("등록되었습니다.");
			window.reload();			
		</script>
	</c:if>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid" style="padding:0; margin:0">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
<!-- 	  				<h2>물품관리</h2>  				 -->
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>물품목록
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	물품구매
			        </li>		        
	    	  	</ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 <!-- Main content -->
    <section class="content">	
    
    <form id="searchFrom" action = "buy.do" method="get">
		<div class="card" style="margin-bottom:0px; padding-left: 190px;">
			<div class="card-body search-body" style="height: auto;">
				<div class="search-group row">
					<div class="input-group  col-md-3">
						<label style="padding: 6px 10px 0px 10px;">대분류</label>
						<select class="form-control" name="laca" id="idLaca"  style="text-align: center;border-radius: 5px;" onchange="getSmcaList();">
							<c:if test="${!empty lacaList}">
						  		<option value="">전체 </option>
						  		<c:forEach var ="lacaList" items="${lacaList}">
						  			<option value="${lacaList}" <c:if test="${map.laca eq lacaList}">selected</c:if> >${lacaList}</option>
						  		</c:forEach>
						  	</c:if>						
					  	</select>
					</div>
					<div class="input-group  col-md-3">
						<label style="padding: 6px 10px 0px 5px;">소분류</label>
						<select class="form-control" name="smca" id="idSmca"  style="text-align: center;border-radius: 5px;">
					  		<c:if test="${!empty smcaList}">
					  		<option value="" >전체</option>
					  		<c:forEach var ="smcaList" items="${smcaList}">
					  			<option value="${smcaList}"  <c:if test="${map.smca eq smcaList}">selected</c:if> >${smcaList}</option>
					  		</c:forEach>
				  			</c:if>
					  	</select>						
					</div>
					<div class="input-group  col-md-3">
						<input class="form-control" type="text" name="keyword" placeholder="물품명을 입력하세요." value="${param.keyword }"/>
					</div>
			       	<div class="input-group col-md-2">
		       			<span class="input-group-append">
							<button class="btn btn-primary" type="submit"  data-card-widget="search" style="border-radius: 5px;"><i class="fa fa-fw fa-search"></i></button>
						</span>
					</div>
				</div>
			</div>
		</div>
    </form>
		<!--card-body(검색창)  -->

			
			<div class="row" style="padding:0px 15px;">
				<div class="col-sm-10" style="padding:10px 5px 0px 15px;">검색결과<span style="color: red;"><b>${supGoodsList.size()}</b></span>건</div>
				<div class="col-sm-1" style="padding:10px 5px 0px 5px;float:right; margin:0;">
					<button type="button" class="btn btn-primary float-sm-right" id="registBtn" style="float:right" onclick="location.href='registForm.do'">개별등록</button>
	<!-- 				 onclick="OpenWindow('registForm.do','물품등록',800,750);">물품등록</button>	
			 -->
			 	</div>
			 	<div class="col-sm-1" style="padding:10px 10px 0px 5px; margin:0;">
					<form enctype="multipart/form-data" method="POST" name="excelUpForm" id="excelUpForm" action="<%=request.getContextPath()%>/sup/goods/excelImport" >
						<button type="button" class="btn btn-primary float-sm-right" id="ExcelImportBtn" style="float:right" onclick="location.href='excelForm.do'">일괄등록</button>
					</form>
				</div>
			</div>
			<!-- 버튼 -->
			
			<div class="card-body" style="height:75vh;overflow-y:scroll;overflow-x:hidden">
				<table class="table table-bordered text-center table-hover" >
					<thead>
					<tr style="font-size:0.95em;">
						<th style="width:10%;">물품코드</th>
						<th style="width:10%;">대분류</th>
						<th style="width:10%;">소분류</th>
						<th style="width:45%;">물품명</th>
						<th style="width:10%;">납품가(원)</th>
						<th>등록일</th>
					</tr>				
					</thead>				
					<c:if test="${empty supGoodsList }" >
						<tr>
							<td colspan="6">
								<strong>해당 내용이 없습니다.</strong>
							</td>
						</tr>
					</c:if>						
					<c:forEach items="${supGoodsList }" var="goodsList">
						<tr style='font-size:0.85em;' onclick="location.href='detail.do?sup_goods_code=${goodsList.sup_goods_code}'">
							<td>${goodsList.sup_goods_code}</td>
							<td>${goodsList.sup_goods_laca }</td>
							<td>${goodsList.sup_goods_smca }</td>
							<td style="text-align:left; overflow: hidden;white-space: nowrap; text-overflow: ellipsis;" >
									${goodsList.sup_goods_name }</td>
							<td>${goodsList.sup_goods_price }</td>
							<td>
								<fmt:formatDate value="${goodsList.sup_goods_regdate }" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
				</table>				
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/common/paginationGoods.jsp" %>				
			</div>
		
    </section>
    <!-- /.content -->
    
<!--     <form id="searchForm"> -->
<!--     	<input type="hidden" name="laca" id="goodlaca"> -->
<!--     	<input type="hidden" name="smca" id="goodsmca"> -->
<!--     	<input type="hidden" name="keyword" id="goodname"> -->
<!--     </form> -->
<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">

// 	window.onload=function(){
// 		$('#idLaca').change(function(event){
// 			alert($(this).val());
// 			searchList();
// 		});
// 		$('#idSmca').change(function(event){
// 			alert($(this).val());
// 			searchList();
// 		});
// 		$('input[name="goodsname"]').change(function(event){
// 			alert($(this).val());
// 			searchList();
// 		});
// 	}

// 	function searchList(){
// 		var searchForm = $("#searchForm").get(0);
// 		$("#goodlaca").val($('select[name="laca"]').val());
// 		$("#goodsmca").val($('select[name="smca"]').val());
// 		$("#goodname").val($('input[name="goodsname"]').val());
// 		searchForm.submit();
// 	}

</script>
    
<script type="text/javascript">
	function getSmcaList(){
		var form= $('#searchFrom');
		var url ="<%=request.getContextPath()%>/sup/goods/searchSmca";
		var param = $("#idLaca option:selected").val();
		
// 		console.log(param);
		
		$.ajax({
			url 	: url,
			type	:"post",
			data	:param,
			contentType:'application/json',
			success:function(data){	//성공하면 data가 넘어옴
				var res = "<option value=''>전체</option>";
				console.log(data);
				$.each(data, function(i,v){
					res+="<option value='"+data[i]+"'>"+data[i]+"</option>"
				})
				$('#idSmca').html(res);
			}
		})
	}

</script>
<script>
// 	function checkFileType(filePath){
// 		var fileFormat = filePath.split(".");
		
// 		if(fileFormat.indexOf("xls")>-1 || fileFormat.indexOf("xlsx")>-1){
// 			return true;
// 		}else{
// 			return false;
// 		}
// 	}
	
// 	function check(){
// 		var file = $("#excelFile").val();
		
// 		if(file==""|| file == null){
// 			alert("파일을 선택해주세요.");
			
// 			return false;
// 		}else if(!checkFileType(file)){
// 			alert("엑셀 파일만 업로드 가능합니다.");
// 			return false;
// 		}
		
// 		if(confirm("업로드 하시겠습니까?")){
// 			var options = {
// 				success:function(data){
// 					console.log(data);
// 					alert("모든 데이터가 업로드 되었습니다.");
// 				},
// 				type:"POST"
// 			};
// 			$("#excelUpForm").ajaxSubmit(options);
// 		}
// 	}

// 	$('#excelUpForm').change(function(){
// 		var form = $("#excelUpForm")[0];
		
// 		var data = new FormData(form);
// 		$.ajax({
// 			enctype:"multipart/form-data",
// 			method:"POST",
<%-- 			url:'<%=request.getContextPath()%>/sup/goods/excelUp.do', --%>
// 			processData:false,
// 			contentType:false,
// 			cache:false,
// 			data:data,
// 			success:function(result){
// 				alert("업로드 성공!!");
// 			}
// 		});
// 	});
	
</script>
</body>

