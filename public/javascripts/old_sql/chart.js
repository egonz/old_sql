var chart = null;

// Load the Visualization API and the piechart package.
google.load('visualization', '1', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table, 
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
	// Create our data table.
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Title');
	data.addColumn('number', 'Data');
	data.addRows(chart_data);

	// Instantiate and draw our chart, passing in some options.
	if (chart_type=='pie') {
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	} else if (chart_type=='bar') {
		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	}
	
	chart.draw(data, {
		width: width, 
		height: height,
		title:chart_title,
       	colors:['#E35F18','#307CC7','#D95117','#0A4592','#B33A13','#073D8D','#902811','#052D79','#7A1904','#061E59','#6E0E02','#071253','#530005','#1F3058','#2A437F','#3657A8','#5675BB','#7A94CC','#F38200','#C4794B','#BF5D29','#B8410B','#AD3300','#802205','#36170F'],
		is3D: true
	});
}