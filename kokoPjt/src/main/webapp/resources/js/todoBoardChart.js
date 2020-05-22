google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);

function drawChart() {	
		
		var result = "<c:out value='${result}'/>";
		var data = google.visualization.arrayToDataTable(
		    [["유형","글갯수"], result]
		);
		var options = {
		    title: "업무 리포트"
		};
		var chart = new google.visualization.PieChart(document.getElementById("work_piechart"));
		chart.draw(data, options);
}
	



