<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="/resources/todoBoard/css/projectList.css"/>
<!--===============================================================================================-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>

<body>
	<div class="container col-sm-9 page">
		<div class="row">
		<div class="col-lg-9">
		<h2>Project List</h2>
		<%-- <p>${login.m_id }</p> --%>
		<!-- <a href="#">프로젝트1</a>
		<a href="#">프로젝트2</a> -->
		<!-- <input type = "submit" name = "project" value="프로젝트2"> -->
		<c:if test="${projectList != null }">
			<c:forEach var="project" items="${projectList }">
				<div class="list">
				<ul class="project-list" id="${project.p_no }">
					<%-- <a href="/todoBoard/main3?p_no=${project.p_no }">${project.p_name }</a> --%>
					<li>
						<a style="color: #333;" href="/todoBoard/main3?p_no=${project.p_no }">${project.p_name }</a>
						<%-- <small class="text-muted">&emsp;담당자: ${project.p_admin }</small> --%>
					</li>
					<li>
					<small class="text-muted"> 
						<fmt:formatDate pattern="yyyy-MM-dd" value="${project.p_startdate }" />
						~
						<fmt:formatDate pattern="yyyy-MM-dd" value="${project.p_enddate }" />
					</small>
					</li>
				</ul>
				</div>
			</c:forEach>

		</c:if>
		<c:if test="${projectList == null }">
			<hr>
				참여중인 프로젝트가 없습니다.
			<hr>
		</c:if>
	</div>
	</div>
	</div>
<script>
$(document).ready(function() {
	$(".list").click(function() {
		var p_no = $(this).find("ul").attr("id");
		location.href = "/todoBoard/main3?p_no="+p_no;
	});
});
</script>
</body>

</html>