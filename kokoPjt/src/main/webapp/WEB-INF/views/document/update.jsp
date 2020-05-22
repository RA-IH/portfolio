<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 글등록</title>

<!-- document(자료실) 폴더 경로 체크하기 -->
<link href="/resources/docjs/jquery.bsPhotoGallery-min.css" rel="stylesheet">
<script src="/resources/docjs/jquery.bsPhotoGallery-min.js"></script>

<!-- document(자료실) 목록 정렬 js -->
<script>
	$(document).ready(function() {
		$('ul.first').bsPhotoGallery({
			"classes" : "col-xl-3 col-lg-2 col-md-4 col-sm-4",
			"hasModal" : true,
			"shortText" : false
		});
	});
</script>
</head>
<!-- 배경화면 -->
<style>
body {
	background: #ebebeb;
}
</style>
<body>
	<div class="col-sm-9 page">
		<div class="container">
	    	<div class="row" style="text-align:center; border-bottom:1px dashed #ccc; padding:30px 0 20px 0; margin-bottom:40px;">
	        	<div class="col-lg-12">
	            <h3 style="font-size:30px;">
	            	<a style="text-decoration: none; color: #36A0FF; font-family: 'Jua', sans-serif;">Document</a>
	            </h3>
	            </div>
	        </div>
	        
	        <div class="row">
  				<div class="col-lg-12">
    			<div class="panel panel-default">

      			<div class="panel-heading">글쓰기 수정</div>
      			<!-- /.panel-heading -->

      			<div class="panel-body">     			
         			<form role="form" method="post">
         			
         			<input type="hidden" name='m_id' value='${login.m_id}' /> 

          			<div class="form-group">
            			<label>글번호</label> <input class="form-control" name='doc_seq' value='<c:out value="${document.doc_seq}"/>' readonly="readonly">
          			</div>
          			
          			<div class="form-group">
            			<label>작성자</label> <input class="form-control" value="<c:out value='${login.m_name}'/>" readonly="readonly">
          			</div>
          			
          			<div class="form-group">
            			<label>제목</label> <input class="form-control" name='doc_title' value='<c:out value="${document.doc_title}"/>'>
          			</div>
          			
          			<div class="form-group">
            			<label>내용</label> <textarea class="form-control" rows="3" name='doc_content' ><c:out value="${document.doc_content}"/></textarea>
          			</div>
     			
         			<button type="submit" id='updateBtn' data-oper='update' class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">Modify</button>
         			<button type="submit" id='delBtn' data-oper='delete' class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">Delete</button>
          			<button type="submit" id='listBtn' data-oper='list' class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">List</button>
          			
          			</form>
      			</div><!--  end panel-body -->
		    	</div>
		    	<!--  end panel-body -->
		 	</div>
		  	<!-- end panel -->
		</div>
		<!-- /.row -->
	        </div> <!-- container 끝 -->
	       </div>
	       <!-- "col-sm-9 page 끝-->
	      
	 <!-- jQuery -->     
	<script type="text/javascript">
		$(document).ready(function() {
	 		var formObj = $("form");
	 		
	 		
	  		/* $('button').on("click", function(e){    
	    		e.preventDefault();    
			    var operation = $(this).data("oper");
			    
			    console.log(operation);
			    
			    if(operation === 'delete'){
			      formObj.attr("action", "/document/delete");
			      
			    }else if(operation === 'list'){
			      //move to list
			      formObj.attr("action", "/document/list").attr("method","get");
			      formObj.empty();
			    }else if(operation === 'update'){
				      //move to update
				      formObj.attr("action", "/document/update").attr("method","post");
				      formObj.empty();

			      //formObj.attr("action", "/document/list").attr("method","get");
			      
			      /* var pageNumTag = $("input[name='pageNum']").clone();
			      var amountTag = $("input[name='amount']").clone();
			      var keywordTag = $("input[name='keyword']").clone();
			      var typeTag = $("input[name='type']").clone();      
			      
			      formObj.empty();
			      
			      formObj.append(pageNumTag);
			      formObj.append(amountTag);
			      formObj.append(keywordTag);
			      formObj.append(typeTag);	        
			    }
			    
			    formObj.submit();
		  }); 
	  		*/
	  		
	  	$('#listBtn').on('click',function(e){
	  		 formObj.attr("action", "/document/list").attr("method","get");
		     formObj.empty();
		     formObj.submit();
	  		
	  	});
	  	
		$('#updateBtn').on('click',function(e){
			 //move to update
			 
			/*  var doc_seq = '${document.doc_seq}';
			 var doc_title = '${document.doc_title}';
			 var doc_content = '${document.doc_content}';
			 var doc_regdate = '${document.doc_regdate}';
			 var m_id = '${login.m_id}';
			 var m_name = '${login.m_name}';
			 var c_name= '${document.c_name}';
			 
			 var formData = new FormData();
   			 
			 formData.append('doc_seq',doc_seq);
			 formData.append('doc_title',doc_title);
			 formData.append('doc_content',doc_content);
			 formData.append('doc_regdate',doc_regdate);
			 formData.append('m_id',m_id);
			 formData.append('m_name',m_name);
			 formData.append('c_name',c_name);		 */	 
			 
		      formObj.attr("action", "/document/update").attr("method","post");
		      formObj.submit();
	  	});
	  	
		$('#delBtn').on('click',function(e){
			formObj.attr("action", "/document/delete");
	  		formObj.submit();
		});
	
	});
</script>

</body>
</html>