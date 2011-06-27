function load_report()
{	
	report_name = $("#report option:selected").attr('name');
	report_sql = $("#report option:selected").attr('report_sql');
	report_view = get_report_view();

	if (!reported_selected(report_name)) return;

	var src = "http://"+host+":"+port+"/sql/reports/"+report_view+"/?report="+report_name+
	"&start_date="+$("#datepicker-start").val()+"&end_date="+$("#datepicker-end").val()+"&report_sql="+
	report_sql+"&caption="+report_name;

	$('iframe').attr('src', src);

	_report_loaded = true;
}

function query()
{	
	orig_sql = $("#query-text").val();
	sql = orig_sql.replace(new RegExp( "\\n", "g" )," ");
	db = $("#query-db option:selected").attr('db_class');
	
	if (!sql) {
		alert('Invalid Query.');
		return;
	}

	var src = "http://"+host+":"+port+"/sql/reports/jqgrid/?&query="+sql+"&db="+db+"&caption=Ad Hoc Query&w="+$(document).width();

	$('iframe').attr('src', src);
	
	save_query(orig_sql);
	load_saved_queries();
}

function save_query(sql) 
{
	if (typeof(localStorage) == 'undefined' ) {
		alert('Your browser does not support HTML5 localStorage. Try upgrading.');
	} else {
		try {
 			localStorage.setItem(sql, sql); //saves to the database, “key”, “value”
		} catch (e) {
			if (e == QUOTA_EXCEEDED_ERR) {
				alert('Quota exceeded!'); //data wasn’t successfully saved due to quota exceed so throw an error
			}
		}
	}
}

function load_saved_queries()
{	
	if (typeof(localStorage) == 'undefined' ) {
		alert('Your browser does not support HTML5 localStorage. Try upgrading.');
	} else {
		clear_saved_queries();
		
		for (var i = 0; i < localStorage.length; i++) {
			$('#saved-queries-list').
          		append($("<option></option>").
          		text(localStorage.getItem(localStorage.key(i)))); 
		}
	}
}

function clear_saved_queries()
{
	$('#saved-queries-list')
    	.find('option')
    	.remove()
    	.end();
}

function deleted_saved_queries() 
{
	if (typeof(localStorage) == 'undefined' ) {
		alert('Your browser does not support HTML5 localStorage. Try upgrading.');
	} else {
		localStorage.clear();
		clear_saved_queries();
	}
}

function deleted_saved_query() 
{
	if (typeof(localStorage) == 'undefined' ) {
		alert('Your browser does not support HTML5 localStorage. Try upgrading.');
	} else {
		localStorage.removeItem($("#saved-queries-list option:selected").val());
		$('#saved-queries-list')
    		.find('option:selected')
    		.remove()
    		.end();
	}
}

function reset_report()
{
	$('iframe').attr('src', "");
}

function print_report()
{
	report_name = $("#report option:selected").attr('name');
	report_sql = $("#report option:selected").attr('report_sql');
	report_view = get_report_view();

	if (!reported_selected(report_name)) return;

	var src = "http://"+host+":"+port+"/sql/reports/print/?report="+report_name+
	"&start_date="+$("#datepicker-start").val()+"&end_date="+$("#datepicker-end").val()+
	"&report_sql="+report_sql+"&desc="+$("#report option:selected").attr('desc');
	window.open(src,'Old SQL Report')
}

function export_report_to_excel()
{
	report_name = $("#report option:selected").attr('name');
	report_sql = $("#report option:selected").attr('report_sql');
	report_view = get_report_view();

	if (!reported_selected(report_name)) return;

	var src = "http://"+host+":"+port+"/sql/reports/query.csv/?report="+report_name+
	"&start_date="+$("#datepicker-start").val()+"&end_date="+$("#datepicker-end").val()+
	"&report_sql="+ report_sql+"&desc="+$("#report option:selected").attr('desc');
	window.open(src,'DB Report')
}

function reported_selected(report_name) 
{
	if (!report_name) {
		alert("You must select a report, and run it before continuing.");
		return false;
	} else {
		return true;
	}
}

function get_report_view()
{
	report_view = $("#report option:selected").attr('report_view');

	if (report_view) {
		return report_view;
	} else {
		return default_report_view;
	}
}

$(document).ready(function($){
	$("#datepicker-start").datetimepicker();
	$("#datepicker-start").datetimepicker( "option", "dateFormat", "yy/mm/dd" );
	$("#datepicker-end").datetimepicker();
	$("#datepicker-end").datetimepicker( "option", "dateFormat", "yy/mm/dd" );

	var now = new Date();
	var tomorrow = new Date();
	var two_weeks_ago = new Date();
	two_weeks_ago.setDate(now.getDate() - 14);
	tomorrow.setDate(now.getDate() + 1);
	$("#datepicker-start").attr('value', two_weeks_ago.format("yyyy/mm/dd HH:MM:ss"));
	$("#datepicker-end").attr('value', tomorrow.format("yyyy/mm/dd HH:MM:ss"));
	
	//Setup key listeners for the ad hoc query textarea
	$('#query-text').keydown(function (e) {
  		if (e.ctrlKey && e.keyCode == 13) {
    		e.preventDefault();
			query();
  		}
	});
	
	$('#tabs').bind('tabsselect', function(event, ui) {
		// Objects available in the function context:
		//ui.tab     // anchor element of the selected (clicked) tab
		//ui.panel   // element, that contains the selected/clicked tab contents
		//ui.index   // zero-based index of the selected (clicked) tab

		reset_report();
		
		if (ui.index == 1) {
			load_saved_queries();
		}
	});
});

$(document).ready(function($){
	$('#run-query').bind('click', function() {
      	query();
    });

	$('#saved-queries-list').bind('click', function() {
		$('#query-text').val($("#saved-queries-list option:selected").val()); 
    });

	$('#delete-saved-queries').bind('click', function() {
      	deleted_saved_queries();
    });

	$('#delete-saved-query').bind('click', function() {
		deleted_saved_query(); 
    });
});

$(function() {
	$( "#tabs" ).tabs();
});

$(function() {
	$( "input:submit, input:button").button();
});