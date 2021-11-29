<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
 <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>


<title>자료실 수정페이지</title>

<body>   
    <!-- Content Header (Page header) -->
     <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-12">
                <h1 style="text-align: center;">반품신청수정</h1>
              </div>
               
               <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
              </ol>
              </div>
           </div>	     	
          </div>
      </section>
  
      <section class="content container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
                   <button type="button" class="btn btn-secondary" id="cancelBtn" onclick="history.go(-1);" style="float: right;">취 소</button>
             		<button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_submit();" style="float: right;">수 정</button>
                   </div>
                   <form enctype="multipart/form-data" role="form" method="post" action="modify.do" name="modifyForm">
                      
                    <div class="card-body">
                      <div class="form-group">
                        <input type="text" id="return_title" name='return_title' class="form-control" value="${returnVO.return_title }">
                      </div>
                    <input type="hidden" name="return_code" value="${returnVO.return_code }" />
                    <label for="return_reason_code">반품하실 물품을 검색하세요.</label>
              <div class="input-group mb-3">
                <input class="form-control" type="text" id="goods" style="text-align:right;">
                          <span class="input-group-append">
                            <button type="button" id="searchBtn" onclick="search_goodsName()" class="btn btn-info btn-flat">검색</button>
                          </span>
                          <select class="form-control" name="hq_goods_code" id="hq_goods_code">
                            <option value="" style="text-align:center;" >물품명</option>
                          </select>
                          <select class="form-control" name="return_reason_code" id="return_reason_select">
                            <option value="" style="text-align:center;">구분(필수)</option>
                            <option value="1" style="text-align:center;">오배송</option>
                            <option value="2" style="text-align:center;">결품</option>
                            <option value="3" style="text-align:center;">기타</option>
                         </select>
                         <input type="text" class="form-control" id="return_quan" name="return_quan" style="text-align:right;"
                         value="${returnVO.returnDetailVO.return_quan }" />
			              </div>
			              <label for="return_reason_code">반품사유</label>
			              <div class="form-group">
			                <textarea cols="88" rows="5" id="return_reason" name="return_reason" placeholder="반품사유를 입력하세요."></textarea>
			              </div>
                      
                     
                      <div class="form-group">
                         <label for="fran_name">가맹점명</label> 
                         <input type="text" id="fran_name" name='fran_name' class="form-control" readonly style="text-align:right;" value="${returnVO.franVO.fran_name }">
                         <input type="hidden" id="fran_code" name='fran_code'  value="${returnVO.fran_code }">
                      </div>
                      
                      <div class="form-group">                        
                            <div class="card-header">
                              <h5 style="display:inline;line-height:40px;">첨부파일</h5>
                               &nbsp;&nbsp;<button class="btn btn-primary" type="button" id="addFileBtn">Add File</button>
                            </div>                           
                            <div class="card-footer fileInput">
                               <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                                  
                                  <c:forEach items="${returnVO.attachList }" var="attach" >
                                  <li class="attach-item">                                                         
                                     <div class="mailbox-attachment-info">
                                        <a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.file_name }" attach-no="${attach.attach_no }"
                                           <%-- href="<%=request.getContextPath()%>/pds/getFile.do?ano=${attach.ano }"  --%> >                                       
                                           <i class="fas fa-paperclip"></i>
                                           ${attach.file_name }&nbsp;&nbsp;
                                           <button type="button" style="border:0;outline:0;" class="badge bg-red">X</button>                                                                           
                                        </a>                                       
                                     </div>
                                  </li>   
                                  </c:forEach>
                               </ul>
                               <br/>                                          
                            </div>
                         </div>
                      </div>
                   </form>
                </div><!--end card-body  -->
                <div class="card-footer" style="text-align: center;">
                   <button type="button" class="btn btn-warning" id="modifyBtn" onclick="modify_submit();">수 정</button>
                   &nbsp;&nbsp;&nbsp;&nbsp;
                   <button type="button" class="btn btn-secondary" id="cancelBtn" onclick="history.go(-1);">취 소</button>
                </div><!--end card-footer  -->
             </div><!-- end card -->            
          </div><!-- end col-md-12 -->
       </div><!-- end row -->
     </section>
    <!-- /.content -->

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
window.onload=function(){
   Summernote_start($('#content'));
   
   //첨부파일===================================
   $('a[name="attachedFile"] > button').click(function(event){
      //alert("remove file btn");      
      var parent = $(this).parent('a[name="attachedFile"]');
      
      //alert(parent.attr("attach-fileName")+" 파일을 삭제합니다.");
      if(!confirm(parent.attr("attach-fileName")+"파일을 삭제하시겠습니까?")){
         return false;
      }

      var attach_no=parent.attr("attach-no");
      
      $(this).parents('li.attach-item').remove();
      
      var input=$('<input>').attr({"type":"hidden",
                             "name":"deleteFile",
                             "value":attach_no
                           }); 
      
      $('form[role="form"]').prepend(input);
      
      return false;
   });
   
   $('button#addFileBtn').on('click',function(event){
      //alert('click add file btn');
      
      var attachedFile=$('a[name="attachedFile"]').length;
      var inputFile=$('input[name="uploadFile"]').length;   
      var attachCount=attachedFile+inputFile;
      
      if(attachCount >=5){
         alert("파일추가는 5개까지만 가능합니다.");
         return;
      }
      
      
      var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
      var div=$('<div>').addClass("inputRow");
      div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button");
      div.appendTo('.fileInput');
   });
   
   $('.fileInput').on('change','input[type="file"]',function(event){
      if(this.files[0].size>1024*1024*40){
         alert("파일 용량이 40MB를 초과하였습니다.");
         this.value="";
         $(this).focus();
         return false;
      } 
   });
   
   $('div.fileInput').on('click','div.inputRow > button',function(event){        
      //alert("X btn click;");
      $(this).parent('div.inputRow').remove();   
   });
   
}
function search_goodsName(){
   $.ajax({
      url : "<%=request.getContextPath() %>/fr/goodsList.do",
      data : {"goods" : $("#goods").val() },
      dataType : "json",
      success : function(res){
         console.log(res);
            let htmlCode = "<option value='' style='text-align:center;' >검색한 물품을 선택해주세요.</option>";
            $.each(res, function(i,v){
               htmlCode += "<option value='" + v.hq_goods_code+ "' style='text-align:center;' >" + v.hq_goods_name + "</option>"
            });
            $("#hq_goods_code").html(htmlCode);
         
//            let htmlCode = "<table>";
//            $.each(res, function(i,v){
//               htmlCode += "<tr id='" + v.hq_goods_code+ "'><td>" + v.hq_goods_name  + "</td></tr>" 
//            });
//            htmlCode += "</table>";
//            $("#result").html(htmlCode);



      },
      error : function(e){
         alert("오류...");
      }
   });
}

//submit =============================================
function modify_submit(){
   //alert("click modify btn");
   
   var form=document.modifyForm;
   
   //제목 유효성확인
   if($("input[name='uploadFile']").val()==""){
      alert(input.name+"은 필수입니다.");
      $("input[name='title']").focus();
      return;
   }
   
   //파일 첨부확인
   var files = $('input[name="uploadFile"]');
   for(var file of files){
      console.log(file.name+" : "+file.value);
      if(file.value==""){
         alert("파일을 선택하세요.");
         file.focus();
         return false;
      }
   }   
   
   form.submit();
}
</script>

</body>


