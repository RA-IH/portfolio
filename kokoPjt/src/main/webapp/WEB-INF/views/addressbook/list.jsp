<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../includes/header.jsp"%>
<html>
<head>

<!--  제이쿼리 라이브러리 추가-->
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<script type="text/javascript" src="/resources/js/addressbook.js"></script>
<!--  구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Baloo+Bhai|Jua|Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 부트스트랩 아이콘 -->
<link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>


<style type="text/css">
.ck_1{
font-family: 'Noto Sans KR', sans-serif;
}



.col-sm-10 {
	
	font-size: 15px;
	margin-bottom: 5px;

}

 .modal-body{
  width: 600px;
  height: 500px;
} 

.modal-title{

font-family: 'Jua', sans-serif;
}

.col-sm-10{
padding-left:25px;
}
	

body {
	background: #ebebeb;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- viewport = 현재 접속한 디바이스에 맞게 해상도를 보여줌 장치의 너비와 일치(반응형) -->
<meta name="viewport" content="width=device-width" initial-scale="1">

		
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="col-sm-9 page">
		<div class="container" style="
    padding-top: 50px;
">
			<div style="width: 100%;">
					   <legend class="text-center header" style = "font-family: 'Noto Sans KR', sans-serif;">${login.m_name}님의 Addressbook List</legend>
				<table id="example-table-1"
					class="table table-condensed table-hover "
					style="text-align: center; solid: #dddddd">
					<thead>
						<tr>
							<th style="text-align: center;  font-family: 'Jua', sans-serif; font-size: 15px;">Name</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">#NO</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">PhoneNumber</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">E-mail</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">Group</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">Company</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">Department</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">Company Address</th>
							<th style="text-align: center;  font-family: 'Jua', sans-serif;">Update Date</th>
						</tr>
					</thead>
					<tbody id="jsonList">
				

						<c:forEach items="${ list }" var="addressbook">
							<tr class="ck_1">
					
								<td><c:out value="${addressbook.ad_name}" /></td>
								<td><c:out value="${addressbook.ad_seq}" /></td>
								<td><c:out value="${addressbook.ad_number}" /></td>
								<td><c:out value="${addressbook.ad_email}" /></td>
								<td><c:out value="${addressbook.ad_group}" /></td>
								<td><c:out value="${addressbook.ad_company}" /></td>
								<td><c:out value="${addressbook.ad_department}" /></td>
								<td><c:out value="${addressbook.ad_address}" /></td>
								<%-- <td><c:out value="${addressbook.ad_updatedate}" /></td> --%>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${addressbook.ad_updatedate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		
		<!-- 페이징 처리 -->
				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.page.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>


					</ul>
				</div>
				<div>
					<button type="button" class="btn btn-primary " data-toggle="modal"
						data-target="#exampleModal" style="font-family: 'Baloo Bhai', cursive; background: #333;"><span class="glyphicon glyphicon-download-alt"></span> Add Contact</button>
				</div>
				<!--  end Pagination -->

				<form id='actionForm' action="/addressbook/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.page.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.page.amount}'>
				</form>

			</div>
		</div>
	</div>

	<!-- The Modal -->
		<!-- class를 통해 모달을 선언하고 투명에서 밝아지는 효과(fade)를 준다.
		여기서 가장 중요한거는 id 입니다. 위에 타겟과 동일해야 합니다. #은 아이디 .은 클래스 -->
		<!-- class를 주목하시면 여기 클레스에 modal-lg, modal-sm을 입력하시면 스몰 모달, 라지 모달로 선언이 가능 합니다. -->

		<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			 <div class="modal-dialog modal-lg"  style="width:auto; display:table" role="document">
				<!-- Modal content -->
			  <div class="modal-content">
				   <div class="modal-header">
       				<!-- 모달 이름 -->
       				  <h4 class="modal-title" id="myModalLabel" style="font-size: 25pt;">Contact Detail</h4>
       				   </div>
					 <div class="modal-body" style="padding-top: 90px;">
		
        			<!-- 모달 내용 -->
        			<p id="aa" style="text-align: center; line-height: 1.5; background-color: #FFFFFF"></p>
					</div>
					
					<div	 class= "modal-footer" style="text-align: center;">
						<!-- data-dismiss="modal"를 통해 모달을 닫을수 있다. -->								
						<button id="modify_btn" type="button" class="btn btn-default"
							data-dismiss="modal" style="font-family: 'Baloo Bhai', cursive; background: #333; color:white;">Modify</button>
						<button id="delete_btn" type="button" class="btn btn-default"
							data-dismiss="modal" style="font-family: 'Baloo Bhai', cursive; background: #333; color:white;" >Delete</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" onClick="close_pop();" style="font-family: 'Baloo Bhai', cursive;">Close</button>
					</div>

				</div>
		<!--</div> -->
		</div></div>
		<!--End Modal-->



		<!-- Add Contact Modal -->
		<form role="form" action="/addressbook/insert" method="post">
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">

				<div class="modal-dialog"  role="document">

					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel" style="font-size: 25pt">Add contact</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

					<div class="modal-body" style="padding-top: 40px;">

						<!-- 	<div class="form-group">
								<label class="col-sm-2 control-label"> Image </label>
								<div class="col-sm-10" style="margin-bottom: 30px; margin-top: 30px">
								<input type="text" name="ad_img">
							</div>
							</div> -->
						
						
				
 						<input type="hidden" name="m_id" value="${login.m_id}"/>
 		
 						
						<div class="form-group">
							<label class="col-sm-2 control-label"> Name </label>
							<div class="col-sm-10">
								<input type="text" name="ad_name" placeholder="이름" style="font-family: 'Noto Sans KR', sans-serif;">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"> PhoneNumber </label>
							<div class="col-sm-10">
								<input type="text" name="ad_number" placeholder="연락처" style="font-family: 'Noto Sans KR', sans-serif;">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"> E-mail </label>
							<div class="col-sm-10" style="padding-left: 25px">
								<input type="email" name="ad_email" placeholder="이메일" style="font-family: 'Noto Sans KR', sans-serif;">
							</div>
						</div>

						<div class="heading"
							style="text-align: center; padding-top: 100px; font-family: 'Nanum Gothic', sans-serif; font-size: 15px; ">자세히 입력하기 <span class="glyphicon glyphicon-hand-down"> </span> </div>

						<div class="content">
							<label class="col-sm-2 control-label" style="padding-top: 20px;">
								Group </label>
							<div class="col-sm-10" style="padding-top: 20px;">
								<input type="text" name="ad_group" style="font-family: 'Jua', sans-serif;">
							</div>
						</div>

						<div class="content">
							<label class="col-sm-2 control-label">Company</label>
							<div class="col-sm-10">
								<input type="text" name="ad_company" style="font-family: 'Noto Sans KR', sans-serif;">
							</div>
						</div>

						<div class="content">
							<label class="col-sm-2 control-label">Department </label>
							<div class="col-sm-10">
								<input type="text" name="ad_department" align="right" style="font-family: 'Noto Sans KR', sans-serif;">
							</div>
						</div>

						<div class="content">
							<label class="col-sm-2 control-label">Company Address</label>
							<div class="col-sm-10">
								<input type="text" id="sample4_postcode" placeholder="우편번호"
									name="post" style="font-family: 'Nanum Gothic', sans-serif;"> <input type="button"
									onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style=font-family: 'Nanum Gothic', sans-serif;><br>

								<input type="text" id="sample4_roadAddress" placeholder="도로명주소"
									name="roadAddress" style="font-family: 'Nanum Gothic', sans-serif;"> <input type="text"
									id="sample4_jibunAddress" placeholder="지번주소"
									name="jibunAddress" style="font-family: 'Nanum Gothic', sans-serif;">
							</div>
						</div>

						<div class="content">
							<label class="col-sm-2 control-label">Memo </label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" name="ad_memo"></textarea>
							</div>
						</div>
						
						<span id="guide" style="color: #999"></span>

						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


						<script>
								function sample4_execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 도로명 조합형 주소 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== '') {
														extraRoadAddr = ' ('
																+ extraRoadAddr
																+ ')';
													}
													// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
													if (fullRoadAddr !== '') {
														fullRoadAddr += extraRoadAddr;
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
													document
															.getElementById('sample4_roadAddress').value = fullRoadAddr;
													document
															.getElementById('sample4_jibunAddress').value = data.jibunAddress;

													// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
													if (data.autoRoadAddress) {
														//예상되는 도로명 주소에 조합형 주소를 추가한다.
														var expRoadAddr = data.autoRoadAddress
																+ extraRoadAddr;
														document
																.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
																+ expRoadAddr
																+ ')';

													} else if (data.autoJibunAddress) {
														var expJibunAddr = data.autoJibunAddress;
														document
																.getElementById('guide').innerHTML = '(예상 지번 주소 : '
																+ expJibunAddr
																+ ')';

													} else {
														document
																.getElementById('guide').innerHTML = '';
													}
												}
											}).open();
								}
							</script>

					</div>
					<div class="modal-footer">
							<button type="submit" class="btn btn-default" style="font-family: 'Baloo Bhai', cursive;">Submit Button</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: 'Baloo Bhai', cursive;">Close</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Button trigger modal -->
</body>
<!--  바디끝-->						
</html>













