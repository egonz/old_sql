function load_report()
{	
  report_name = jQuery("#report option:selected").attr('name');
  report_sql = jQuery("#report option:selected").attr('report_sql');

  if (!reported_selected(report_name)) return;
  
	var src = "http://"+host+":"+port+"/sql/reports/"+report_view+"/?report="+report_name+
	"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+"&report_sql="+
	report_sql;
	
	jQuery('iframe').attr('src', src);
	
	_report_loaded = true;
}

function print_report()
{
	report_name = jQuery("#report option:selected").attr('name');
  report_sql = jQuery("#report option:selected").attr('report_sql');
	
	if (!reported_selected(report_name)) return;
	
	var src = "http://"+host+":"+port+"/sql/reports/print/?report="+report_name+
		"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+
		"&report_sql="+report_sql+"&desc="+jQuery("#report option:selected").attr('desc');
	window.open(src,'Old SQL Report')
}

function export_report_to_excel()
{
	report_name = jQuery("#report option:selected").attr('name');
  report_sql = jQuery("#report option:selected").attr('report_sql');
	
	if (!reported_selected(report_name)) return;
	
	var src = "http://"+host+":"+port+"/sql/reports/query.csv/?report="+report_name+
		"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+
		"&report_sql="+ report_sql+"&desc="+jQuery("#report option:selected").attr('desc');
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

jQuery(document).ready(function($){
	jQuery("#datepicker-start").datetimepicker();
	jQuery("#datepicker-start").datetimepicker( "option", "dateFormat", "yy/mm/dd" );
	jQuery("#datepicker-end").datetimepicker();
	jQuery("#datepicker-end").datetimepicker( "option", "dateFormat", "yy/mm/dd" );
	
	var now = new Date();
	var tomorrow = new Date();
	var two_weeks_ago = new Date();
	two_weeks_ago.setDate(now.getDate() - 14);
	tomorrow.setDate(now.getDate() + 1);
	jQuery("#datepicker-start").attr('value', two_weeks_ago.format("yyyy/mm/dd HH:MM:ss"));
	jQuery("#datepicker-end").attr('value', tomorrow.format("yyyy/mm/dd HH:MM:ss"));
});