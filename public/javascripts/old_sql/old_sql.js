var _report_sql = '';
var _report_loaded = false;

function report_selected()
{
	var virality = jQuery("#report option:selected").attr('virality');
	_report_sql = jQuery("#report option:selected").attr('report_sql');
	
  	if (virality == 'true')
	{
		jQuery("#select-generation").removeAttr('disabled');
	}
	else
	{
		jQuery("#select-generation").attr('disabled', 'disabled');
		jQuery("#select-generation option:first").attr('selected','selected');
	}
}

function load_report()
{	
	var src = "http://"+host+":"+port+"/sql/reports/datagrid/?report="+jQuery("#report").val()+
	"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+"&generation="+
	jQuery("#select-generation").val()+"&report_sql="+
	_report_sql;
	
	jQuery('iframe').attr('src', src);
	
	_report_loaded = true;
}

function print_report()
{
	if(_report_loaded == false) 
	{
		alert("You must select a report, and run it before continuing.");
		return;
	}
	
	var src = "http://"+host+":"+port+"/sql/reports/print/?report="+jQuery("#report").val()+
		"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+"&generation="+
		jQuery("#select-generation").val()+"&report_sql="+_report_sql+"&desc="+jQuery("#report option:selected").attr('desc');
	window.open(src,'Old SQL Report')
}

function export_report_to_excel()
{
	if(_report_loaded == false) 
	{
		alert("You must select a report, and run it before continuing.");
		return;
	}
	
	var src = "http://"+host+":"+port+"/sql/reports/query.csv/?report="+jQuery("#report").val()+
		"&start_date="+jQuery("#datepicker-start").val()+"&end_date="+jQuery("#datepicker-end").val()+
		"&generation="+jQuery("#select-generation").val()+"&report_sql="+
		_report_sql+"&desc="+jQuery("#report option:selected").attr('desc');
	window.open(src,'DB Report')
}

jQuery(document).ready(function($){
	jQuery("#datepicker-start").datetimepicker();
	jQuery("#datepicker-start").datetimepicker( "option", "dateFormat", "yy/mm/dd" );
	jQuery("#datepicker-end").datetimepicker();
	jQuery("#datepicker-end").datetimepicker( "option", "dateFormat", "yy/mm/dd" );

	jQuery("#select-generation").attr('disabled', 'disabled');
	
	var now = new Date();
	var tomorrow = new Date();
	var two_weeks_ago = new Date();
	two_weeks_ago.setDate(now.getDate() - 14);
	tomorrow.setDate(now.getDate() + 1);
	jQuery("#datepicker-start").attr('value', two_weeks_ago.format("yyyy/mm/dd HH:MM:ss"));
	jQuery("#datepicker-end").attr('value', tomorrow.format("yyyy/mm/dd HH:MM:ss"));
});