<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link href="/resources/docjs/jquery.bsPhotoGallery-min.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
function register() {
	location.href="/Survey/SRegister";
}

</script>
<style>
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
<div class="container">
    <div class="row">
        <div class="col-md-12">
          <fieldset>
           <legend class="text-center header">Survey List</legend>
			<table id="example-table-1" class="table table-condensed table-hover " style="text-align: center; solid: #dddddd">
					<thead>
						<tr>
							<th style="text-align: center;">#NO</th>
							<th style="text-align: center;">Question</th>
							<th style="text-align: center;">Register Date</th>
							<th style="text-align: center;">Expire Date</th>
							<th style="text-align: center;">WriterID</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Slist" items="${map.Slist}">
							<tr class="ck_1">
								<td><a href="SurveyForm?s_seq=${Slist.s_seq}">${Slist.s_seq}</td></a>
								<td>${Slist.question}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Slist.s_regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Slist.expire_date}" /></td>
								<td>${Slist.m_id}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			<div class="form-group"> 
				<br><input type="button" class="btn btn-primary" value="Register" onclick="register()" style="color: white; background: #333; font-family: 'Jua', sans-serif;">
			</div>
			
			<form action="Slist" method="get">
			<div class="form-group" style="text-align: right;"> 
				Survey Count : ${map.count} &nbsp; &nbsp;
				<select name="searchType">
	      			<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
	      			<option value="q"<c:out value="${scri.searchType eq 'q' ? 'selected' : ''}"/>>Question</option>
	     			<option value="m"<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>WriterID</option>
	     		    <option value="qm"<c:out value="${scri.searchType eq 'qm' ? 'selected' : ''}"/>>ALL</option>
	    		</select>
	   		    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
	            <button type="submit" class="btn btn-primary" style="color: white; background: #333; font-family: 'Jua', sans-serif;">Search</button>	
			</div>
			</form>			
		</fieldset>
		</div>
	</div>
</div>
</div>
</body>
</html>