<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>
 <body>  
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공급업체정보 수정하기</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>공급업체정보
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	수정하기
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
  <!-- Main content -->
    
  <section class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title"></h3>
						<div class="card-tools">
							<button type="button" id="modifyBtn" class="btn btn-primary" onclick="modify_go();">확인</button>						
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">닫기</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="card card-primary">
              
              <!-- /.card-header -->
              <!-- form start -->
            <form role="form" method="post" action="supmodify.do" name="modifyForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">업체명</label>
                    <input type="text" class="form-control" id="supName" readonly value="${sup.sup_name }" name="sup_name" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">공급업체코드</label>
                   <input type="text" class="form-control" id="sup_code" readonly value="${sup.sup_code }" name="sup_code"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">지역코드</label>
                  <input type="text" class="form-control" id="supLocalCode"  readonly value="${sup.sup_local_num }" name="sup_local_num" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">대표자</label>
                <input type="text" class="form-control" id="supOwner"  value="${sup.sup_owner }" name="sup_owner" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">전화번호</label>
                   <input type="text" class="form-control" id="supTel" value="${sup.sup_tel }" name="sup_tel" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">이메일</label>
                   <input type="text" class="form-control" id="supEmail" value="${sup.sup_email }" name="sup_email" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">사업자번호</label>
                   <input type="text" class="form-control" id="supBusinessNo" value="${sup.sup_business_no }" name="sup_business_no"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">우편번호</label>
                   <input type="text" class="form-control" id="supZip" value="${sup.sup_zip }"name="sup_zip" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">주소</label>
                   <input type="text" class="form-control" id="supAddr" value="${sup.sup_addr }" name="sup_addr"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">상세주소</label>
                  <input type="text" class="form-control" id="supDetailAddr" value="${sup.sup_detail_addr } " name="sup_detail_addr"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">종목</label>
                  <input type="text" class="form-control" id="supProd" value="${sup.sup_prod } " name="sup_prod" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">계약상태</label>
                  <input type="text" class="form-control" id="supContractSt" value="${sup.sup_contract_st } " name="sup_contract_st"/>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">등록상태</label>
                    <select class="form-control" name="sup_reg_st">
                          <option value="1" ${sup.sup_reg_st == 1 ? 'selected' : '' } >임시</option>
                          <option value="2" ${sup.sup_reg_st == 2 ? 'selected' : '' }>정식</option>
                        </select>
                    
                <%--  <input type="text" class="form-control" id="supRegSt" value="${sup.sup_reg_st }" name="sup_reg_st"/> --%>
                  </div>
                 
                 
                <!-- /.card-body -->

               
              </form>
            </div>
													
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    
    </section>
    
    
    <!-- /.content -->
<%--     <%@ include file="/WEB-INF/views/common/summernote.jsp" %> --%>

<script>
window.onload = function(){
	Summernote_start($('#content'));
}

function modify_go(){
	$("form[role='form']").submit();
}
</script>
</body>