<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
//에러아님
function drawChart() {
	var data = google.visualization.arrayToDataTable([
		['ano', 'rate'],
		${result}		
	]);

	var options = {
		title: '${map.scommand.question}'
	};

	var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	chart.draw(data, options);
}
</script>
<style>
.header {
    color: #36A0FF;
    font-size: 27px;
    padding: 10px;
    font-family: 'Jua', sans-serif;
}

.aa{
	float: left;
	margin-right:-300px;
}

.bb{
	margin-right: 200px;
	margin-top: 100px;
	margin-left: 200px;
	text-align: top;
	float: right;
	font-size: 20px;
}

thead th {
  background: #96A5FF;
  color: #fff;
  font-weight: initial;
}

tr { background: #f6f6f6; }

tr:nth-child(2n) { background: #eaeaea; }

th, td {
  text-align: center;
}

table{
	border-color: #fff;
}

fieldset{
 	background: white;
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
           <legend class="text-center header">Survey Result</legend>
			<div class="aa" style="width: 50%">
				<div id="piechart" style="width: 600px; height: 400px; "></div>
			</div>
			
			<div class="bb">
				<p> Question : ${map.scommand.question}</p>
			<table border="1">
			<thead>
				<tr align="center">
					<th>문항</th>
					<th>응답수</th>
					<th>응답비율</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="row" items="${map.list}">
				<tr align="center">
					<th>${row.ano}</th>
					<th>${row.s_ano}</th>
					<th>${row.rate}%</th>
				</tr>	
			</c:forEach>
			</tbody>	
			</table>
			</div>
			</fieldset>
		</div>
	</div>
</div>
</div>
</body>
</html>