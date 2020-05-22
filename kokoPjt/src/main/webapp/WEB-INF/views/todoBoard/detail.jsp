<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/resources/todoBoard/css/main.css"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 -->
<style type="text/css">
* {
	justify-content: center;
}

li {
	list-style: none;	
}

#replyForm div{
	display:inline-display;
}

</style>
</head>
<body>

	<div class="col-sm-9 page">

		<div class="row">
<%-- 			<div class="col-lg-12">
				<h2 class="page-header"><c:out value="${project.p_name }"/></h2>
			</div> --%>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="container col-lg-9">
				<div class="board-detail panel panel-default">

					<div class="card-board-header"><c:out value="${board.b_seq }"/>번 게시글 상세보기</div>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='b_title'
								value='<c:out value="${board.b_title }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='m_id'
								value='<c:out value="${board.m_id }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>공개범위</label> <input class="form-control" name='b_scope'
								value='<c:out value="${board.b_scope }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>유형</label> <input class="form-control" name='b_type'
								value='<c:out value="${board.b_type }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control detail-content" rows="10" name='b_contents' readonly="readonly"><c:out value="${board.b_contents}" /></textarea>
						</div>
						
						<!-- 파일 -->
						<div class="row">
						  <div class="col-lg-12">
						    <div class="panel panel-default">
						
						      <div class="panel-heading">Files</div>
						      <!-- /.panel-heading -->
						      <div class="panel-body">
						       
						        <div class='uploadResult'> 
						          <ul class="space">
						          </ul>
						        </div>
						      </div>
						      <!--  end panel-body -->
						    </div>
						    <!--  end panel-body -->
						  </div>
						  <!-- end panel -->
						</div>
						<!-- /.row -->
						
						
						<button data-oper='list' class="btn board-form-btn">목록</button>
						<c:if test="${login.m_id == board.m_id }">
							<button data-oper='update' class="btn board-form-btn">수정</button>
							<button data-oper='delete' class="btn board-form-btn">삭제</button>
						</c:if>
					
						
						<form id='operForm' action="/todoBoard/update" method="get">
							<%-- <input type='hidden' id='b_seq' name='b_seq'
								value='<c:out value="${board.b_seq}"/>'> --%>

							<input type='hidden' name='p_no' value='<c:out value="${board.p_no}"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						</form>
					</div>
					<!--  end panel-body -->

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
		<!-- /.row -->
		
			<!-- Reply -->
	
	<div class='row'>
	
	  <div class="container col-lg-9">
	
	    <!-- /.panel -->
	    <div class="panel panel-default">
	      
	      <div class="card-board-header">
	        <i class="fa fa-comments fa-fw"></i> Reply
	      </div>      
	      	      
	      <!-- /.panel-heading -->
	      <div class="panel-body">        
	     
	        <ul class="chat">
	
	        </ul>

	        <!-- ./ end ul -->
	        <!-- reply 추가 폼 -->
	        <form id="replyForm" action="" method="post">
	        	<input type="hidden" id = "m_id" value = "${login.m_id }">
	        	<textarea class="form-control reply-text" name="b_contents" id="b_contents" rows="3" placeholder="댓글 내용을 입력하세요."></textarea>
	        	
	        	<br><button type="submit" id="replyBtn" name="reply"
											class="btn board-form-btn pull-right">등록</button>
	        </form>
	      </div>
	      
	    <div class="reply-footer">
		
		</div>
			
		<br><br><br><br>
	
		</div>
	  </div>
	  <!-- ./ end row -->
	</div>
		
		
</div>
	
	

	
<script type="text/javascript" src="/resources/js/reply.js"></script>
	
<script>

$(document).ready(function () {
	
	//////////////// Board ////////////////
	var operForm = $("#operForm");

	/* $("button[data-oper='update']").on("click", function(e) {
			
		operForm.attr("action", "/todoBoard/update").submit();

	});
	
	$("button[data-oper='list']").on("click", function(e) {
		
		operForm.attr("action", "/todoBoard/list").submit();

	}); */
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		var str ="";
		
		console.log(operation);
		
		if(operation === 'update') {
			str += "<input type='hidden' id='b_seq' name='b_seq' value='<c:out value="${board.b_seq}"/>'>";
			operForm.append(str);
			operForm.attr("action", "/todoBoard/update").attr("method", "get").submit();
		}else if (operation === 'list') {
			
			operForm.attr("action", "/todoBoard/list").attr("method", "get").submit();
			
		} else if (operation === 'delete') {
			str += "<input type='hidden' id='b_seq' name='b_seq' value='<c:out value="${board.b_seq}"/>'>";
			operForm.append(str);
			operForm.attr("action", "/todoBoard/delete").attr("method", "post").submit();
		}
	});
	
	//////////////// Reply ////////////////
	var b_seqValue = '<c:out value="${board.b_seq}"/>';
	var replyUL = $(".chat");
	var m_id = '<c:out value="${login.m_id }"/>';
	
	showList(1);
	
	
	function showList(page) {
		
		console.log("show list: "+page);
		
		replyService.getList({b_seq:b_seqValue ,page: page|| 1 }, function(data) {
	        var replyCnt = data.replyCnt;
	        var list = data.list;
	        console.log("replyCnt: "+ data.replyCnt );
	        console.log("list: " + list);
    
	         if(page == -1){
	          pageNum = Math.ceil(replyCnt/10.0);
	          showList(pageNum);
	          return;
	        }
	        
	        var str="";
	        var test ="";
	         
	         if(list == null || list.length == 0){
	           replyUL.html("");
	           return;
	         }
	         
	         for (var i = 0, len = list.length || 0; i < len; i++) {
	             
	             str +="<li class='left clearfix' data-br_seq='"+list[i].br_seq+"'>";
	             str +="  <div><div class='header'><strong class='primary-font'>"
	          	   +list[i].m_id+"</strong>";
	             str +="    <small class='pull-right text-muted'>"
	                 +replyService.displayTime(list[i].br_lastUpdate)+"</small></div>";
	             str += "<div class='body'>";	 
 	             if(list[i].m_id == m_id){
 	            	 str += "<a href='"+list[i].br_seq+"' class='pull-right' id='replyUpdateBtn' style='color: #333'>수정</a>";
		         	str += "<a href='"+list[i].br_seq+"' class='pull-right' id='replyDeleteBtn' style='color: #333'>삭제</a>";
 	             }
		         
	             str +="    <p>"+list[i].br_contents+"</p></div></div></li>";

	         }

	           replyUL.html(str);
	           
	           showReplyPage(replyCnt);

	       });//end function
	         
	     }//end showList
	
	// 댓글 페이지 번호 화면 출력 로직
	var pageNum = 1;
    var replyPageFooter = $(".reply-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      console.log(endNum);
      console.log(startNum);
      console.log(pageNum);
      console.log(pageNum);
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        var active = pageNum == i? "active":"";
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      console.log(str);
      replyPageFooter.html(str);
    }
    
    // 페이지 번호 클릭 시 새로운 댓글 가져오기
     replyPageFooter.on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      });
	
		// 댓글 추가
	   $("#replyBtn").on("click", function(e){
	 		e.preventDefault();
	 		var form = $("#replyForm");
	 		var m_id = '<c:out value = "${login.m_id}"/>';
	 		var contents = $("#b_contents").val();

	 		replyService.add(
	 				{"b_seq":b_seqValue, "br_contents":contents, "m_id":m_id}
	 			    ,
	 			    function(result){ 
	 			      showList(pageNum);
	 			     $("#b_contents").val(""); // 댓글창 리셋
	 		});
	    });
	     
	     
	     // 댓글 수정/삭제
	     $(".chat").on("click", "li a", function(e){
	    	 e.preventDefault();
	    	 var li = $(this).closest("li");
	    	 var br_seq = $(this).attr("href");
	    	 var content = li.find(".body");
	    	 var content_back = content.html();
	    	 var str ="";
	    	 var btn = $(this).attr("id");
			
	    	 console.log(content_back);
	    	 
	    	 // 수정 버튼 클릭시
	    	 if(btn == 'replyUpdateBtn'){
	    		 
	    		// 댓글 수정창
	             str += "<c:if test='${login.m_id == board.m_id }'>";
		         str += "<a href='"+br_seq+"' class='pull-right' id='replyUpdateBackBtn' style='color: #333'>수정취소</a>";
		         str += "</c:if>";
		         
		    	 str += "<textarea class='form-control' rows='2' name='update_content'>";
		    	 str += content.find("p").text()+"</textarea>";
		    	 str += "<button  id='replyUpdateDoneBtn' class='btn btn-default pull-right'>수정</button>"
		    	 
		    	 content.html(str);
		    	 
		    	 // 수정 취소 버튼 클릭시
				$("#replyUpdateBackBtn").on("click", function(e){
					e.preventDefault();
					content.html(content_back);
				});
		    	 
		    	// 수정(완료) 버튼 클릭시
		    	$("#replyUpdateDoneBtn").on("click", function(e){
					e.preventDefault();
					var update_content = $("textarea[name='update_content']").val();
					replyService.update({"br_seq":br_seq, "br_contents":update_content},
	   			 		function(result){
	   		 	 		showList(pageNum);
	   	 			});
				});
	    	 } else if(btn == 'replyDeleteBtn'){
	    		 // 삭제 버튼 클릭시
	    		 replyService.remove(br_seq, function(count) {

	    			  console.log(count);
					  showList(pageNum);
	    			  if (count === "success") {
	    			    alert("댓글 삭제 완료");
	    			  }
	    			}, function(err) {
	    			  alert('댓글 삭제에 실패했습니다.');
	    			});
	    	 }

	     });	     
	     // 댓글 삭제	     
});

</script>

<script type="text/javascript">


//var b_seqValue = '<c:out value="${board.b_seq}"/>';
//for replyService add test
/* replyService.add(
    
	{"b_seq":820, "br_contents":"Hello Reply", "m_id":"bbb"}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
);  */

//reply List Test
/* replyService.getList({b_seq:b_seqValue, page:1}, function(list){
    
	  for(var i = 0,  len = list.length||0; i < len; i++ ){
	    console.log(list[i]);
	  }
}); */

//2번 댓글 삭제 테스트 
/* replyService.remove(5, function(count) {

  console.log(count);

  if (count === "success") {
    alert("REMOVED");
  }
}, function(err) {
  alert('ERROR...');
});
 */
 
//12번 댓글 수정 
/* replyService.update({
   br_seq : 2,
   b_seq : 800,
   br_contents : "Modified Reply...."
 }, function(result) {

   alert(result);
 });  
 */
 
// 특정 댓글
/* replyService.get(2, function(data){
	console.log(data);
}) */

</script>

<!-- 파일 스크립트 영역 -->
<script>


$(document).ready(function(){
  
  (function(){
  
    var b_seq = '<c:out value="${board.b_seq}"/>';
    
    $.getJSON("/todoBoard/getFileList", {b_seq: b_seq}, function(arr){
       var str = "";      
       $(arr).each(function(i, file){
    	   str += "<li data-path='"+file.bf_uploadPath+"' data-uuid='"+file.bf_uuid+
    	          "' data-filename='"+file.bf_name+"' data-type='"+file.bf_type+"' ><div>";
           str += "<a><span> "+ file.bf_name+"</span><br/>";
           //str += "<img src='/resources/img/attach.png'></a>";
           str += "</a>";
           str += "</div>";
           str +"</li>";
       });
       
       $(".uploadResult ul").html(str);
       
     });//end getjson  
     
  })();//end function
  
  $(".uploadResult").on("click","li", function(e){
      
    var liObj = $(this);    
    var path = encodeURIComponent(liObj.data("path")+"/"+
    		   liObj.data("uuid")+"_" + liObj.data("filename"));   
    self.location ="/todoBoard/download?bf_name="+path;
  });  
  
});

</script>
</body>
</html>