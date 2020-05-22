<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
function register() {
	location.href="/Survey/SRegister";
}

$(function() {
	 $.datepicker.setDefaults({
		 dateFormat: 'yy-mm-dd',
		 showMonthAfterYear : true
	 });
 	
	 $("#datepicker").datepicker();		
	 
	 var rs = document.getElementById("sModifySubmitBtn");
		rs.addEventListener("click", function(e) {
			
		var date = new Date();	
		var expire_date = document.getElementById("datepicker").value.split('-'); // expire_date[0] = year, (month)1, (day)2 
		
		var dueDate = new Date();
		dueDate.setYear(expire_date[0]);
		dueDate.setMonth(expire_date[1]-1);
		dueDate.setDate(expire_date[2]);
		
		let k = date >= dueDate;
		
		if(k) {
			alert("해당 날짜를 설문만료일로 등록할 수 없습니다.");
			e.preventDefault();	
		}
		});
});
</script>
<style type="text/css">

.header {
    color: #36A0FF;
    font-size: 27px;
    padding: 10px;
    font-family: 'Jua', sans-serif;
}
</style>
</head>
<body>
<div class="col-sm-9 page">
<br><br>
<form action="/Survey/modify" method="post">
<fieldset>
    <legend class="text-center header">Survey Modify</legend>
    <!-- 작성자 -->
    <div class="form-group"> 
		<label class="control-label">question</label>
		<input type="text" class="form-control" name="m_id" placeholder="설문내용입력" value="${scommand.m_id }" readonly="readonly"/>
	</div>
	<div class="form-group"> 
		<label class="control-label">question</label>
		<input type="text" class="form-control" name="question" placeholder="설문내용입력" value="${scommand.question }"/>
	</div>	

	<div class="form-group"> 
		<label  class="control-label">Answer 1</label>
		<input type="text" class="form-control" name="ans1" placeholder="answer1" value="${scommand.ans1}"/>
	</div>					
							
	<div class="form-group"> 
		<label class="control-label">Answer 2</label>
		<input type="text" class="form-control" name="ans2" placeholder="answer2" value="${scommand.ans2}"/>
	</div>	
	
	<div class="form-group"> 
		<label class="control-label">Answer 3</label>
		<input type="text" class="form-control" name="ans3" placeholder="answer3" value="${scommand.ans3}"/>
	</div>	
	
	<div class="form-group"> 
		<label class="control-label">Answer 4</label>
		<input type="text" class="form-control" name="ans4" placeholder="answer4" value="${scommand.ans4}"/>
	</div>	

	<div class="form-group">
		<label class="control-label">expire_date </label>
		<input class="form-control" id="datepicker" name="expire_datess" type="text" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${scommand.expire_date}" />'/>
	</div>									

	<div class="form-group"> 
		<!-- <input type="hidden" name="m_id" > -->
		<input type="hidden" name="s_seq" value="${scommand.s_seq }"/>
		<input id="sModifySubmitBtn" class="btn btn-primary" type="submit" value="수정하기" style="color: white; background: #333; font-family: 'Jua', sans-serif;"/>
	</div>     
</fieldset>
</form>
</div>
</body>
</html>