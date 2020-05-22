<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- document(자료실) 부트스트랩 환경-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>자료실</title>

<!-- document(자료실) 폴더 경로 체크하기 -->
<link href="/resources/docjs/jquery.bsPhotoGallery-min.css" rel="stylesheet">
<script src="/resources/docjs/jquery.bsPhotoGallery-min.js"></script>
<!--  구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Baloo+Bhai|Jua|Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">

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
			<div class="row"
				style="text-align: center; border-bottom: 1px dashed #ccc; padding: 30px 0 20px 0; margin-bottom: 40px;">
				<div class="col-lg-12">
					<h3 style="font-size: 30px;">
						<a style="text-decoration: none; color: #36A0FF; font-family: 'Jua', sans-serif;">Document</a>
					</h3>
					
				</div>
			</div>
			
			
			<button id='regBtn' type="button" class="btn btn-default" style="height: 50px; color:white; background: #333; font-family: 'Jua', sans-serif;">Register</button>
			<p>
				
			<ul class="row first">
				<c:forEach items="${list}" var="document">
					<li>
						<a href='/document/detail?doc_seq=<c:out value="${document.doc_seq}"/>'>
							<img alt="Colors" src="http://demo.michaelsoriano.com/images/photodune-460760-colors-xs.jpg">
						</a>
						<!-- 해결해야돼 -->
						<p>
							<c:out value="${document.doc_seq}" />
							<br>
							<!-- 임시로 시퀀스를 클릭했을 때 이동하도록 하자 js 고고 -->
							<%-- <a class='move' href='<c:out value="${document.doc_title}"/>'> --%>
							<a href='/document/detail?doc_seq=<c:out value="${document.doc_seq}"/>'>
								<c:out value="${document.doc_title }" />
							</a>
							<br>
							<c:out value="${document.m_name}" />  (<c:out value="${document.c_name}" />)
							<br>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${document.doc_regdate}" />
						</p>
					</li>
				</c:forEach>			
			
			</ul> <!-- row first 글 리스트 끝 -->
				
			
			
			<%-- <!-- 페이징 처리 시작-->
			<div class='pull-right'>
				<ul class="pagination">

					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">이전</a></li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.docPage.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a><!-- a태그가 동작하지 못하도록 js처리 해주자 -->
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<!-- 페이징 처리 끝--> --%>
			
			<!-- Modal  추가 p248 실패-->
			<!-- /* 이 부분 입력후 모달창 뜨도록 수정해라 */ -->
			<!-- 
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">삭제 완료</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>
					</div>
					/.modal-content
				</div>
				/.modal-dialog
			</div>
			/.modal
			 -->
		
		
		
		
		
		
		
		<!-- paging start -->
		
		<%-- <div class="pager">
    <ul>
        <c:if test="${ curPageNum > 12 && !empty kwd }">
            <li><a href="/mysite/board?page=${ blockStartNum - 1 }&kwd=${ kwd }">◀</a></li>
        </c:if>
        
        <c:if test="${ curPageNum > 12 }">
            <li><a href="/mysite/board?page=${ blockStartNum - 1 }">◀</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
            <c:choose>
                <c:when test="${ i > lastPageNum }">
                    <li>${ i }</li>
                </c:when>
                <c:when test="${ i == curPageNum }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${ !empty kwd}">
                    <li><a href="/mysite/board?a=search&page=${ i }&kwd=${ kwd }">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/mysite/board?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${ lastPageNum > blockLastNum && !empty kwd }">
            <li><a href="/mysite/board?a=search&page=${ blockLastNum + 1 }&kwd=${ kwd }">▶</a></li>
        </c:if>
        
        <c:if test="${ lastPageNum > blockLastNum }">
            <li><a href="/mysite/board?page=${ blockLastNum + 1 }">▶</a></li>
        </c:if>
    </ul>
</div>   --%>
		
		<!-- paging end -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			


			
			
			<!-- 페이징 처리에서 a태그가 동작하지 않도록 하기위해 form 태그를 이용해서 js가 처리하도록 함 -->
			<form id='actionForm' action="/document/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.docPage.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.docPage.amount}'>
			</form>
			
			
			
		</div>
		
		
		<!-- /container -->
	</div>
	<!-- /col-sm-9 page 끝 -->



	
	<!-- JavaScript 시작 -->
	<script type="text/javascript">
		/* 중복글 방지 모달창 */
		/* 이 부분 입력후 모달창 뜨도록 수정해라 */
		 
		$(document).ready(function() {
			var result = '${result}';
			
			checkModal(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
				if (result === '' || history.state ) {
					return;
				}

				if (parseInt(result) > 0) {
					/* $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다."); */
				}
				$("#myModal").modal("show");
			}
				$("#regBtn").on("click", function() {
					self.location = "/document/insert";
				});
				
					/* var actionForm = $("#actionForm");
					$(".paginate_button a").on( "click", function(e) {
						e.preventDefault();
						console.log('click');
						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					}); */
			
		});
		

		
	
		/* 페이징 js */
		/* $(document).ready(function() {
			var result = '<c:out value="${result}"/>';
			
			
			checkModal(result);
			history.replaceState({}, null, null);
				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					
					if (parseInt(result) > 0) {
						$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
					}
						$("#myModal").modal("show");
					}
						$("#regBtn").on("click", function() {
							self.location = "/document/insert";
						});
							var actionForm = $("#actionForm");
							$(".paginate_button a").on( "click", function(e) {
								e.preventDefault();
								console.log('click');
								actionForm.find("input[name='pageNum']").val($(this).attr("href"));
								actionForm.submit();
								});
		}); */
		
		/* list.jsp 게시글 조회 js - 디테일로 안넘어 가니까 확인하기 */
		/* $(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='doc_seq' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/document/detail");
			actionForm.submit();		
		}); */
	</script>
	<!-- JavaScript 끝 -->
</body>
</html>