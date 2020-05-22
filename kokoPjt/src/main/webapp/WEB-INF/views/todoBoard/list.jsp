<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../includes/header.jsp"%>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/resources/todoBoard/css/main.css"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<!-- <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->

<!-- 업무리포트 chart script -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {	
	// 빨간 밑줄 오류 아님
	var data = google.visualization.arrayToDataTable(
	    [["유형","글갯수"],
	    ${result}]
	);
	var options = {
	    title: "업무 리포트"
	};
	var chart = new google.visualization.PieChart(document.getElementById("work_piechart"));
	chart.draw(data, options);
}
</script>

<!-- <script type="text/javascript" src="/resources/js/todoBoardChart.js"></script> -->

</head>
<body>
	<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
	</jsp:scriptlet>




	<!-- body 부분 -->
	<div class="container page">
    	<div class="row">

				<div class="report col-lg-9">
					<div class="cardbox">
						<div class="card-board-header">
							<div class="card-text"><b>업무 리포트</b></div>
						</div>
						<div class="panel-body">	
						<%-- - 요청: ${b_request } - 피드백: ${b_feedback } - 진행: ${b_doing } - 완료: ${b_done } - 보류: ${b_issue }	
						<input type="hidden" id="b_request" value="${b_request }">
						<input type="hidden" id="b_feedback" value="${b_feedback }">
						<input type="hidden" id="b_doing" value="${b_doing }">
						<input type="hidden" id="b_done" value="${b_done }">
						<input type="hidden" id="b_issue" value="${b_issue }"> --%>
						
						<div id="work_piechart" style="width: 500px; height: 250px; margin: 0 auto;"></div>
						</div>
					</div>
				 </div>
		</div>

		<div id="writeForm">
		
		<div class="row">
				<div class="col-lg-9">
					<div class="panel panel-default">
<!-- 						<div class="card-board-header">
							<div class="card-text"><b>업무 리포트</b></div>
						</div>
 -->
						<!-- /.panel-heading -->
						<div class="panel-body">
								
								<form id="boardForm" action="" method="post" enctype="multipart/form-data">

									<label style="padding-bottom: 10px;">작성자 ${login.m_name }</label>
									<!-- board의 시퀀스 알아야 한다 -->
									<input type="hidden" name="p_no"
										value='<c:out value="${cri.p_no}"/>'> <input
										type="hidden" name="m_id" value='<c:out value="${login.m_id }"/>'>
									
									<input class="form-control" type="text" id="b_title" name="b_title" placeholder="제목"><br>
									
									<textarea class="form-control" name="b_contents" id="b_contents" rows="20" cols="100"
										placeholder="내용을 입력하세요."></textarea>
									<!-- <div id="b_contents" >DragZone</div> -->
									<br>
									<div class="col-lg-3 pull-left">
									<label>공개범위</label>
									<select class="form-control" id="b_scope" name="b_scope">
										<option value="all">전체공개</option>
										<option value="admin">비공개</option>
									</select>
									</div>
									<div class="col-lg-3 pull-left">
									<label>글유형</label>
									<select class="form-control" id="b_type" name="b_type">
										<option value="요청">요청</option>
										<option value="피드백">피드백</option>
										<option value="진행중">진행중</option>
										<option value="완료">완료</option>
										<option value="보류">보류</option>
									</select>
									</div>
									
									<div class="col-lg-12">
   										 <div class="panel panel-default">

									     <!-- <div class="panel-heading">File Attach</div> -->
										 <!-- /.panel-heading -->
										 <div class="panel-heading">
										 	파일
										 </div>
										 <div class="panel-body">
											<div class="form-group uploadDiv">
											<!-- <label>파일</label> -->
											<input type="file" name="uploadFile" multiple>
											<br>
											</div>
										<!-- </div> -->
										</div>
										<div class="uploadResult">
										<ul>
										
										</ul>
										</div>
										</div>
										<button type="submit" id="boardBtn" name="board"
											class="btn board-form-btn pull-right">올리기</button>
										<br> <br>			
									</div>
									<!-- uploadResult -->
					
									
								</form>

						</div>
						<!--  end panel-body -->
					</div>
					<!-- end panel -->
				</div>
			</div>
		</div>
		<!-- todoBoard 자리 -->
		<div id="board">
			<!-- 글 정렬 -->
			<div class="col-lg-3">
			<select class="form-control" id="boardSort" name="boardSort">
				<option value="none" selected>정렬기준</option>
				<option value="all">전체</option>
				<option value="요청">요청</option>
				<option value="피드백">피드백</option>
				<option value="진행중">진행중</option>
				<option value="완료">완료</option>
				<option value="보류">보류</option>
			</select>
			</div>
			<div class="row">
				<div class="col-lg-9">

							
							<div class="board">
								<c:if test="${todoBoardList == null }">
								<div class = "empty">
									<p>등록된 게시글이 없습니다.</p>
								</div>
								</c:if>
								<c:if test="${todoBoardList != null }">
								<c:forEach items="${todoBoardList }" var="board">
									<c:choose>
										<c:when test="${board.b_scope == 'admin' && board.m_id != login.m_id}">
										</c:when>
										<c:otherwise>
											<div class='move cardbox'  id="<c:out value="${board.b_seq}" />">

													<div class="card-header">
														<div class="card-text">
															<!-- <span><i style='font-size:32px' class='fas pull-left user-icon'>&#xf2bd;</i></span> -->
															<i class="glyphicon glyphicon-user pull-left" style='font-size:25px'></i>
															<b><c:out value="${board.m_id}" /></b>
															<small class="card-type text-muted" style="color: #7e35a6"><c:out value="${board.b_type}" /></small>
														</div>
														<div class="card-text"><small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_lastUpdate}" /></small>
															<c:if test="${board.b_scope == 'all'}">
																<span><i class="fa fa-globe" ></i></span>
															</c:if>
														</div>													
													</div>
													
													<div class ="card-body">
														<ul class="space">
															<%-- <li><c:out value="${board.b_seq}" /></li>
															<li><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_lastUpdate}" /></li> --%>
															<li class="card-title"><c:out value="${board.b_title}" /></li>
															<%-- <li><small class="text-muted" style="color: #c289f1"><c:out value="${board.b_type}" /></small></li> --%>
															<li><pre><c:out value="${board.b_contents}" /></pre></li>
															<li>
																<c:if test="${board.m_id == login.m_id }">
																	<!-- <button data-oper='update' class="btn btn-default">수정</button>
																	<button data-oper='remove' class="btn btn-default">삭제</button> -->
																</c:if>
															</li>
														</ul>
													</div>
												</div>

										</c:otherwise>
									</c:choose>
								</c:forEach>
								</c:if>
							</div>
							
							<div class='text-center'>
								<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li class="paginate_button previous"><a
										href="${pageMaker.startPage -1}">Previous</a></li>
								</c:if>
		
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
										<a href="${num}">${num}</a>
									</li>
								</c:forEach>
		
								<c:if test="${pageMaker.next}">
									<li class="paginate_button next"><a
										href="${pageMaker.endPage +1 }">Next</a></li>
								</c:if>
								</ul>
							</div>
				<!--  end Pagination -->


							<form id='operForm' action="/todoBoard/update" method="get">
								<input type='hidden' id='b_seq' name='b_seq'
									value='<c:out value="${board.b_seq}"/>'> <input
									type='hidden' name='b_title'
									value='<c:out value="${board.b_title}"/>'> <input
									type='hidden' name='b_scope'
									value='<c:out value="${board.b_scope}"/>'> <input
									type='hidden' name='b_type'
									value='<c:out value="${board.m_id}"/>'> <input
									type='hidden' name='b_contents'
									value='<c:out value="${board.b_contents}"/>'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
							</form>

							<form id='actionForm' action="/todoBoard/list" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='p_no' value='${pageMaker.cri.p_no }'>
								<%-- <input type='hidden' name='sort' value='${sort }'> --%>
							</form>
						
						

						</div>
						<!--  end panel-body -->
					</div>
					<!-- end panel -->
				</div>


			</div>

<script>
$(document).ready(function() {
				var boardUL = $("#boardForm");
				var actionForm = $("#actionForm");
				var str = "";
				
				var result = '<c:out value="${result}"/>';

				history.replaceState({}, null, null);
				
			
				// board insert
				$("button[id ='boardBtn']").on("click", function(e) {
					e.preventDefault();
					var str = "";
	  				var m_id = "<c:out value='${login.m_id}'/>";
	  				var p_no = "<c:out value='${project.p_no }'/>";

	  			    // 권한 검사 먼저
					$.ajax({
						
						  url: '/todoBoard/authority',
						  type: 'POST',
						  data: {m_id : m_id, p_no : p_no},
						  //dataType: 'json',
					      success: function(result){
					          if (result == "y"){
					        	  // 권한이 있으면
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
								boardUL.append(str);
								boardUL.attr("action", "/todoBoard/insert").submit();
								alert("글이 등록됐습니다.");
					          } else {
					        	  alert("글 작성 권한이 없습니다.");
					          }
					      }
					    }); //$.ajax

				});

				// board update
				var operForm = $("#operForm");

				$("button[data-oper='update']").on("click", function(e) {
					e.preventDefault();
					operForm.attr("action", "/todoBoard/update").submit();

				});
				
				// board detail
				$(".move").click(function() {
							//var b_seq = $(this).find("p:nth-child(1)").text();
							var b_seq = $(this).attr("id");
							console.log(b_seq);
							actionForm.append("<input type='hidden' name='b_seq' value='"
							+ b_seq
							+ "'>");
							actionForm.attr("action", "/todoBoard/detail");
							actionForm.submit();

				});
				
				// paging 버튼 클릭
				$(".paginate_button a").on("click", function(e) {
							e.preventDefault();
							actionForm.find("input[name='pageNum']")
									.val($(this).attr("href"));
							actionForm.submit();
				});
				
				// 정렬 기준 선택 시 (select)
				$("select[ id='boardSort']").change(function(e){
					e.preventDefault();
					var b_type = $(this).val();
					var p_no = actionForm.find("input[name='p_no']").val();
					if (b_type != "all"){
						actionForm.append("<input type='hidden' name='b_type' value='"
								+ b_type
								+ "'>");
						actionForm.attr("action", "/todoBoard/sortList").submit();
					} else {
						actionForm.empty();

						actionForm.append("<input type='hidden' name='p_no' value='"
								+ p_no
								+ "'>");
						actionForm.attr("action", "/todoBoard/main3").submit();
					}
				
				});

				
		////////////// 파일 첨부 //////////////
		
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
				  
				  // 파일 첨부되면
				  $("input[type='file']").change(function(e){

				    var formData = new FormData();
				    
				    var inputFile = $("input[name='uploadFile']");
				    
				    var files = inputFile[0].files;
				    
				    for(var i = 0; i < files.length; i++){

				      if(!checkExtension(files[i].name, files[i].size) ){
				        return false;
				      }
				      console.log(files[i]);
				      formData.append("uploadFile", files[i]);
				      
				    }
				    
				    $.ajax({
				      url: '/todoBoard/upload',
				      processData: false, 
				      contentType: false,
					  data:formData,
					  type: 'POST',
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
					    
					        /* //image type
					        if(obj.image){
					          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					          str += "<li><div>";
					          str += "<span> "+ obj.fileName+"</span>";
					          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					          str += "<img src='/display?fileName="+fileCallPath+"'>";
					          str += "</div>";
					          str +"</li>";
					        }else{
					          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
					            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					              
					          str += "<li><div>";
					          str += "<span> "+ obj.fileName+"</span>";
					          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					          str += "<img src='/resources/img/attach.png'></a>";
					          str += "</div>";
					          str +"</li>";
					        } */
							//image type
							if(obj.image){
								var fileCallPath =  encodeURIComponent( obj.bf_uploadPath+ "/s_"+obj.bf_uuid +"_"+obj.bf_name);
								str += "<li data-path='"+obj.bf_uploadPath+"'";
								str +=" data-uuid='"+obj.bf_uuid+"' data-filename='"+obj.bf_name+"' data-type='"+obj.image+"'"
								str +" ><div>";
								str += "<p> "+ obj.bf_name+"</p>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' "
								str += "data-type='image'>x</button><br>";
								//str += "<img src='/todoBoard/display?bf_name="+fileCallPath+"'>";
								str += "</div>";
								str +"</li>";
							}else{
								var fileCallPath =  encodeURIComponent( obj.bf_uploadPath+"/"+ obj.bf_uuid +"_"+obj.bf_name);			      
							    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
							      
								str += "<li "
								str += "data-path='"+obj.bf_uploadPath+"' data-uuid='"+obj.bf_uuid+"' data-filename='"+obj.bf_name+"' data-type='"+obj.image+"' ><div>";
								str += "<p> "+ obj.bf_name;
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
								str += "><i class='fa fa-times'></i></button></p><br>";
								//str += "<img src='/resources/img/attach.png'></a>";
								str += "</div>";
								str +"</li>";
							}

					    });
					    
					    uploadUL.append(str);
					  }
				  
				  $(".uploadResult").on("click", "button", function(e){
					    
					    console.log("delete file");
					      
					    var targetFile = $(this).data("file");
					    var type = $(this).data("type");
					    
					    var targetLi = $(this).closest("li");
					    
					    $.ajax({
					      url: '/deleteFile',
					      data: {bf_name: targetFile, bf_type:type},
					      dataType:'text',
					      type: 'POST',
					        success: function(result){
					           
					           targetLi.remove();
					         }
					    }); //$.ajax
					   });
				  
		});
</script>
</body>
</html>