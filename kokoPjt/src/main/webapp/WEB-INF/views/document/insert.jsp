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

      			<div class="panel-heading">글쓰기</div>
      			<!-- /.panel-heading -->

      			<div class="panel-body">     			
        			<form role="form" action="/document/insert" method="post">
					<input type="hidden" name='m_id' value='${login.m_id}' />
          			<div class="form-group">
            			<label>글쓴이</label> <input class="form-control" name='m_name' value='${login.m_name}' readonly="readonly">
          			</div>
          			
          			<div class="form-group">
            			<label>제목</label> <input class="form-control" name='doc_title'>
          			</div>
          			
          			<div class="form-group">
            			<label>내용</label> <textarea class="form-control" rows="3" name='doc_content'></textarea>
          			</div>
     			
         			<button type="submit" class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">Register</button>
         			
          			<button type="reset" class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">Reset</button>
          			
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

</body>
</html>