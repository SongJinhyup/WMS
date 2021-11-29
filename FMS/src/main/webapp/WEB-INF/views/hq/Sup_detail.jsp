<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<c:if test="${from eq 'modify'}">
	<script>
	alert("정상적으로 수정되었습니다.");
	</script>	
	</c:if>

  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;">


  <!-- Content Wrapper. Contains page content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공급업체 상세</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>공급업체
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	상세보기
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
						<!-- 	<button type="button" id="saveBtn" class="btn btn-warning" onclick="save_go();">SAVE</button>		 -->				
							<button type="button" id="modifyFormBtn" class="btn btn-warning" onclick="modify_go();">수정</button>						
						    <!-- <button type="button" id="removeBtn" class="btn btn-danger" onclick="remove_go();">REMOVE</button> -->
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">닫기</button>
					    </div>
					</div>
					<div class="card-body">
						<div class="card card-primary">
              <!-- <div class="card-header">
                <h3 class="card-title" style="margin-left: 43%;" >공급업체 정보</h3>
              </div> -->
              <!-- /.card-header -->
              <!-- form start -->
             <form role="form" method="post" action="<%=request.getContextPath() %>/hq/com/supdetail.do" name="modifyForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">업체명</label>
                    <input type="text" class="form-control" id="supName" readonly value="${sup.sup_name }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">공급업체코드</label>
                   <input type="text" class="form-control" id="supCode" readonly value="${sup.sup_code }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">지역코드</label>
                  <input type="text" class="form-control" id="supLocalCode" readonly value="${sup.sup_local_num }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">대표자</label>
                <input type="text" class="form-control" id="supOwner" readonly value="${sup.sup_owner }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">전화번호</label>
                   <input type="text" class="form-control" id="supTel" readonly value="${sup.sup_tel }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">이메일</label>
                   <input type="text" class="form-control" id="supEmail" readonly value="${sup.sup_email }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">사업자번호</label>
                   <input type="text" class="form-control" id="supBusinessNo" readonly value="${sup.sup_business_no }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">우편번호</label>
                   <input type="text" class="form-control" id="supZip" readonly value="${sup.sup_zip }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">주소</label>
                   <input type="text" class="form-control" id="supAddr" readonly value="${sup.sup_addr }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">상세주소</label>
                  <input type="text" class="form-control" id="supDetailAddr" readonly value="${sup.sup_detail_addr }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">종목</label>
                  <input type="text" class="form-control" id="supProd" readonly value="${sup.sup_prod }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">계약상태</label>
                  <input type="text" class="form-control" id="supContractSt" readonly value="${sup.sup_contract_st }" />
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">등록상태</label>
                 <select class="form-control" name="sup_reg_st" disabled="disabled">
                    <option value="1" ${sup.sup_reg_st == 1 ? 'selected' : '' } >임시</option>
                    <option value="2" ${sup.sup_reg_st == 2 ? 'selected' : '' }>정식</option>
                    </select>
                  </div>
                 
                 
                <!-- /.card-body -->

               
              </form>
            </div>
													
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    
    </section>
    
    
    
    
    
    
    </div>
    
    <!-- /.content -->
  <!-- /.content-wrapper -->

<form role="form">
	<input type="hidden" name="scode" value="${sup.sup_code}" />
</form>

<script>
var formObj = "";
window.onload=function(){
	formObj = $("form[role='form']");
}
function modify_go(){
// 	alert("modify");
	formObj.attr('action', '<%=request.getContextPath()%>/hq/com/supmodifyForm.do').submit();
}

</script>
</body>