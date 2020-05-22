<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>
<script type="text/javascript">
function selectList() {
	console.log("여기가 문제?");
	location.href="show_result.do?s_seq=${scommand.s_seq}";
}

function sdelete() {
	location.href="remove?s_seq=${scommand.s_seq}";
}

function supdate() {
	location.href="/Survey/SModify?s_seq=${scommand.s_seq}";
}

$(function() {
	var i = '<c:out value="${limit}"/>';

	if(i>1){
		alert("설문조사 기간이 아닙니다..");
		location.href="/Survey/Slist";
	}
});

window.onload = function() {
	var i = '<c:out value="${limit}"/>';
	console.log("I : " + i);
	if(i<0){
		alert("설문조사 기간이 아닙니다..");
		location.href="/Survey/Slist";
	}
}

window.onload = function() {
	var aa = document.getElementById("succes");
	aa.addEventListener("click", function(e) {
		alert("설문이 완료되었습니다.");
	});
}
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
<form method="post" action="save_survey.do">
		<fieldset>
		    <legend class="text-center header">Survey Form</legend>
		<div style="display: flex;justify-content: center;">
		<div style="width: 50%;"><br>
		    <div>
			    <div class="form-group row">
					<div class="col-md-4" style="font-size: 20px;">
						<label for="name">question : </label>
					</div>
					<div class="col-md-" style="font-size: 18px;">
						${scommand.question}
					</div>
				</div>
			
				<div class="form-group"> 
					<label class="col-md-4" style="font-size: 20px;">answer : </label>
					<div class="col-sm-5">
						<div class="radio">
							<label style="font-size: 16px;">
								<input type="radio" name="ano" value="${scommand.ans1}">${scommand.ans1}<br>
							</label>
						</div>
						<div class="radio">
							<label style="font-size: 16px;">
								<input type="radio" name="ano" value="${scommand.ans2}">${scommand.ans2}<br>		
							</label>
						</div>	
						<div class="radio">
							<label style="font-size: 16px;">
								<input type="radio" name="ano" value="${scommand.ans3}">${scommand.ans3}<br>	
							</label>
						</div>		
															
						<div class="radio">
							<label style="font-size: 16px;">
								<input type="radio" name="ano" value="${scommand.ans4}">${scommand.ans4}<br>	
							</label>
						</div>											
					</div>
			</div>							

			<div class="form-group"> 
				<div class="col-sm-10 col-sm-offset-2">
					<br><br>    
					<input type="hidden" name="s_seq" value="${scommand.s_seq}">
					<input class="btn btn-primary" type="submit" value="투표" id="succes" style="color: white; background: #333; font-family: 'Jua', sans-serif;">
					<input class="btn btn-primary" type="button" value="결과확인" onclick="selectList()" style="color: white; background: #333; font-family: 'Jua', sans-serif;">
		
					<c:if test="${scommand.m_id == login.m_id}">
						<input class="btn btn-primary" type="button" value="삭제" onclick="sdelete()" style="color: white; background: #333; font-family: 'Jua', sans-serif;">
						<input class="btn btn-primary" type="button" value="수정" onclick="supdate()" style="color: white; background: #333; font-family: 'Jua', sans-serif;">
					</c:if>                 
				</div>
			</div> 
		</div>     	 
		</div>     	 
		</fieldset>  

</form>  
</div>
</body>
</html>