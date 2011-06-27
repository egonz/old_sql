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
		title: chart_title,
		backgroundColor:'#F0F0F0',
       	colors: chart_colors,
		is3D: true
	});
}