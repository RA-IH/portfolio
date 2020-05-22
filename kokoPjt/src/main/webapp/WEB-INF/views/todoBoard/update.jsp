<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/resources/todoBoard/css/main.css"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->

</head>
<body>
	<div class="col-sm-9 page">

		<div class="row">
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="container col-lg-9">
				<div class="panel panel-default">

					<div class="card-board-header">게시글 수정</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<form role="form" action="/todoBoard/update" method="post" enctype="multipart/form-data">
					
							<input type='hidden' name='p_no' value='<c:out value="${board.p_no }"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
								
								
							<div class="form-group">
								<label>번호</label> <input class="form-control" name='b_seq'
									value='<c:out value="${board.b_seq }"/>' readonly="readonly">
							</div>

							<div class="form-group">
								<label>제목</label> <input class="form-control" name='b_title'
									value='<c:out value="${board.b_title }"/>'>
							</div>

							<div class="form-group">
								<label>작성자</label> <input class="form-control" name='m_id'
									value='<c:out value="${board.m_id }"/>' readonly="readonly">
							</div>
							

							<div class="form-group">
								<label>공개범위</label>
								<select class="form-control" id="b_scope" name="b_scope">
								<option value="all">전체공개</option>
								<option value="admin">비공개</option>
								</select>
							</div>
							
							<div class="form-group">
								<label>유형</label>
								<%-- <input class="form-control" name='b_type'
									value='<c:out value="${board.b_type }"/>'> --%>
								<select class="form-control" id="b_type" name="b_type">
									<option value="요청">요청</option>
									<option value="피드백">피드백</option>
									<option value="진행중">진행중</option>
									<option value="완료">완료</option>
									<option value="보류">보류</option>
								</select>
							</div>
							
							<div class="form-group">
								<!-- <label>내용</label> -->
								<textarea class="form-control" rows="10" name='b_contents'><c:out value="${board.b_contents}" /></textarea>
							</div>
							
							<!-- 파일 -->
							<div class="row">
							  <div class="col-lg-12">
							    <div class="panel panel-default">
							
							      <div class="panel-heading">Files</div>
							      <!-- /.panel-heading -->
							      <div class="panel-body">
							      	<div class="form-group uploadDiv">
										<input type="file" name="uploadFile" multiple>
							        </div>
							        <div class='uploadResult'> 
							          <ul>
							          </ul>
							        </div>
							      </div>
							      <!--  end panel-body -->
							    </div>
							    <!--  end panel-body -->
							  </div>
							  <!-- end panel -->
							</div>

							<button data-oper='update' class="btn board-form-btn">완료</button>

							<!-- <form id='operForm' action="/boad/modify" method="get"></form> -->

						</form>
					</div>
					<!--  end panel-body -->

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		<!-- /.row -->
	</div>

<script>
$(document).ready(function() {
	 var formObj = $("form");
	 
	 $('button').on("click", function(e){
		    
		    e.preventDefault(); 
		    
		    var operation = $(this).data("oper");
		    
		    if(operation === 'update') {
		    	/* formObj.attr("action", "/todoBoard/update").attr("method", "post");
		    	var b_title = $("input[name='b_title']").clone();
			      var b_contents = $("input[name='b_contents']").clone();
			      var b_type = $("input[name='b_type']").clone();
			      var b_scope = $("input[name='b_scope']").clone();      
			      
			      formObj.empty();
			      
			      console.log(b_title);
			      formObj.append(b_title);
			      formObj.append(b_contents);
			      formObj.append(b_type);
			      formObj.append(b_scope);	 
					 */
				  var str = "";
				  $(".uploadResult ul li").each(function(i, obj){
					      
					      var jobj = $(obj);
					      
					      console.dir(jobj);
					      console.log("-------------------------");
					      console.log(jobj.data("filename"));
					      
					      
					      str += "<input type='hidden' name='fileList["+i+"].bf_name' value='"+jobj.data("filename")+"'>";
					      str += "<input type='hidden' name='fileList["+i+"].bf_uuid' value='"+jobj.data("uuid")+"'>";
					      str += "<input type='hidden' name='fileList["+i+"].bf_uploadPath' value='"+jobj.data("path")+"'>";
					      str += "<input type='hidden' name='fileList["+i+"].bf_type' value='"+ jobj.data("type")+"'>";
					      
					});
				  formObj.append(str);
			      formObj.submit();
			      //alert("수정완료");
			      /* formObj.find(".form-control").each(function(i, obj){
			    	  
			      }) */
		    }
	 });
});
</script>

<script>

$(document).ready(function() {
  (function(){
    
    var b_seq = '<c:out value="${board.b_seq}"/>';
    
    $.getJSON("/todoBoard/getFileList", {b_seq: b_seq}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, file){
            var fileCallPath =  encodeURIComponent( file.bf_uploadPath+ "/s_"+file.bf_uuid +"_"+file.bf_name);

            str += "<a><li data-path='"+file.bf_uploadPath+"' data-uuid='"+file.bf_uuid+"' data-filename='"+file.bf_name+"' data-type='"+file.bf_type+"' ><div>";
            str += "<span> "+ file.bf_name +"   </span></a>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " >x</button><br>";
            str += "</div>";
            str +"</li>";

       });     
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("파일을 삭제하시겠습니까?")){
    
      var targetLi = $(this).closest("li");
      targetLi.remove();
    }
  });  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/todoBoard/upload',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		/* if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.bf_uploadPath+ "/s_"+obj.bf_uuid +"_"+obj.bf_name);
			str += "<li data-path='"+obj.bf_uploadPath+"'";
			str +=" data-uuid='"+obj.bf_uuid+"' data-filename='"+obj.bf_name+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.bf_name+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?bf_name="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.bf_uploadPath+"/"+ obj.bf_uuid +"_"+obj.bf_name);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.bf_uploadPath+"' data-uuid='"+obj.bf_uuid+"' data-filename='"+obj.bf_name+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.bf_name+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		} */
		
    	var fileCallPath =  encodeURIComponent( obj.bf_uploadPath+"/"+ obj.bf_uuid +"_"+obj.bf_name);			      
	    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	      
		str += "<a><li "
		str += "data-path='"+obj.bf_uploadPath+"' data-uuid='"+obj.bf_uuid+"' data-filename='"+obj.bf_name+"' data-type='"+obj.image+"' ><div>";
		str += "<span> "+ obj.bf_name+"   </span></a>";
		str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
        str += " >x</button><br>";
		str += "</div>";
		str +"</li>";		

    });
    
    uploadUL.append(str);
  }
  
});

</script>
</body>
</html>

