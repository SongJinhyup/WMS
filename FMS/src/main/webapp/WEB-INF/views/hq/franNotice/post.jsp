<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>

  <!-- Content Wrapper. Contains page content -->
  <div  style="max-width:800px;min-width:420px;margin:0 auto;min-height:812px;">
   
   
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1 style="position: relative; left:75%;">가맹점 게시판</h1>  				
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
						<h3 class="card-title"><span style="color: orange;">[임시]</span><p style= "position: relative; left: 50px; bottom: 20px;">#${franNotice.fran_notice_title }</p></h3>
						<div class="card-tools">
						    <button type="button" id="listBtn" class="btn btn-primary" onclick="CloseWindow();">CLOSE</button>
					    </div>
					    <div>
					    <i class="fas fa-user-alt" style="position: relative; top:40px; right: 150px;"></i>
						<span style="position: relative; top:42px; right: 145px;">작성자: &nbsp;${franNotice.emp_name}</span>					    
					    </div>
					    
					    
					</div>
					<div class="card-body">
						<div class="form-group col-sm-4" style="float:left;">
							<label for="fran_owner" style="position: relative; left: 30px;">신청자 이름</label>
							<input type="text" class="form-control" id="fran_owner" readonly disabled value="${franNotice.franVO.fran_owner }" style="width: 200px;" />							
						</div>
						<div class="form-group col-sm-4" style="float:left;">
							<label for="fran_tel">연락처</label>
							<input type="text" class="form-control" id="fran_tel" readonly disabled value="${franNotice.franVO.fran_tel }" style="width: 200px;"/>							
						</div>
						<div class="form-group col-sm-4" style="float:left;">
							<label for="fran_email">이메일</label>
							<input type="text" class="form-control" id="fran_email" readonly disabled value="${franNotice.franVO.fran_email }" style="width: 200px;" />							
						</div>
						<div class="form-group col-sm-6" style="float:left;">
							<label for="fran_se">점포구분</label>
							<c:if test="${franNotice.franVO.fran_se eq 1}">
								<input type="text" class="form-control" id="fran_se" readonly disabled value="임대" style="width: 340px;"/>
											
							</c:if>
							<c:if test="${franNotice.franVO.fran_se eq 2}">
								<input type="text" class="form-control" id="fran_se" readonly disabled value="본인" style="width: 340px;"/>
											
							</c:if>
						</div>
						<div class="form-group col-sm-6" style="float:left;">
							<label for="fran_addr">주소</label>
							<input type="text" class="form-control" id="fran_addr" readonly disabled value="${franNotice.franVO.fran_addr } &nbsp; ${franNotice.franVO.fran_detail_addr }"  style="width: 360px;"/>							
						</div>
						<div class="form-group col-sm-4" style="float:left;">
								<label for="land_area">토지면적</label>
								<input type="text" class="form-control" id="land_area" readonly value="${franNotice.franVO.land_area }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">평</span>
						</div>	
						<div class="form-group col-sm-4" style="float:left;">
								<label for="dedicated_area">전용면적</label>
								<input type="text" class="form-control" id="dedicated_area" readonly value="${franNotice.franVO.dedicated_area }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">평</span>
						</div>	
						<div class="form-group col-sm-4" style="float:left;">
								<label for="floor">층</label>
								<input type="text" class="form-control" id="floor" readonly value="${franNotice.franVO.floor }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">층</span>
						</div>	
						<div class="form-group col-sm-4" style="float:left;">
								<label for="fran_gtn">보증금</label>
								<input type="text" class="form-control" id="fran_gtn" readonly value="${franNotice.franVO.fran_gtn }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">원</span>
						</div>	
						<div class="form-group col-sm-4" style="float:left;">
								<label for="fran_rent_charge">임대료</label>
								<input type="text" class="form-control" id="fran_rent_charge" readonly value="${franNotice.franVO.fran_rent_charge }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">원</span>
						</div>	
						<div class="form-group col-sm-4" style="float:left;">
								<label for="fran_manage_cost">관리비</label>
								<input type="text" class="form-control" id="fran_manage_cost" readonly value="${franNotice.franVO.fran_manage_cost }" style="width: 200px;"/><span style="position: relative; left:210px; bottom: 30px;">원</span>
						</div>	
						<div class="form-group col-sm-12">
							<label for="fran_memo">기타상세</label>
							<textarea  id="fran_memo" rows="5" cols="90"  readonly>${franNotice.franAppliDocVO.fran_memo }</textarea>
					</div>													
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->
    </section>
    <!-- /.content -->
        
    
    <!-- Reply content -->
    <section class="content container-fluid">
    	<!-- reply component start --> 
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">					
					<div class="card-body">
						<!-- The time line -->
						<div class="timeline">
							<!-- timeline time label -->
							<div class="time-label" id="repliesDiv">
								<span class="bg-info">댓글 목록 </span>							
							</div>
							
							
						</div>
						<div class='text-center'>
							<ul id="pagination" class="pagination justify-content-center m-0" >
								
							</ul>
						</div>
					</div>
					<div class="card-footer">
<!-- 						<label for="newReplyWriter">작성자</label> -->
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginEmp.emp_no }"> 
						<label for="newReplyText">댓글 내용</label>
						<input class="form-control" type="text"	placeholder="내용을 입력해 주세요" id="newReplyText">
						<br/>
						<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">작성</button>
					</div>				
				</div>			
				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
    </section>
  </div>
  <!-- /.content-wrapper -->

<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn" onclick="replyModify_go();">수정</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn" onclick="replyRemove_go();">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>



<form role="form">
	<input type="hidden" name="fran_notice_num" value="${franNotice.fran_notice_num }" />
</form>
	
  
<script>
	
	

	function modify_go(){
		var formObj = $("form[role='form']");
		//alert("click modify btn");
		formObj.attr({
			'action':'modifyForm.do',
			'method':'post'
		});
		formObj.submit();
	}
	function remove_go(){
		var formObj = $("form[role='form']");
		//alert("click remove btn");
		var answer = confirm("정말 삭제하시겠습니까?");
		if(answer){		
			formObj.attr("action", "remove.do");
			formObj.attr("method", "post");
			formObj.submit();
		}
	}
 	
	
</script>

<%@ include file="./reply_js.jsp" %>
 
</body> 
 
 
 
 
 
 
 
 
 
 