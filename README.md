Old SQL
=======

Old SQL is a Rails Engine database reporting gem that uses plain old SQL.

Some features of Old SQL are:

* Reports can be created using little or no Ruby code.
  - SQL for the report to be designed by a DBA, or other database developer independent of Ruby.
  - Reports can be designed using a design file that mocks the reports. This file can contain data 
    from the SQL, as well as String literals, and formulas (that can also use numeric literals).
  - The design documents, which are nothing more than CSV files, can also serve as documentation, 
    and describe the layout of the report in an intuitive way.
  - If you want more fine grained control, a custom report processor can parse the SQL.
  - Simple to convert legacy reports into Old SQL reports.  
* Multiple report views (jqGrid, HTML table, and chart).
* Bar and Pie charts using Google Charts.
* In the report design all data is rounded to a precision that can be set in the old_sql initializer. 
  This feature can also be disabled in the initializer.
* Old SQL has rake tasks for running the reports and outputting the result as CSV. This can simplify testing. 
  It also allows reports to be run as a cron task.
* The look of Old SQL can be customized.
* Support for printing and exporting to CSV.
* Old SQL uses Devise for authentication, and will install it for you. It can
  even add Devise support to an existing model (by default users).
* Support for multiple database connections.

Quick Setup and Demo
--------------------

1. Add gem 'old_sql', and gem 'devise' to your Gemfile.
2. bundle install
3. rails g old_sql:install, or rails g old_sql:install <model>
4. rake db:migrate
5. Ensure you have at least one user record, and that old_sql_admin=true.
6. If you didn't previously have Devise installed open rails console, and select your old_sql_admin user, 
   and set password and password_confirmation. Save, and exit.
7. Type rails s to start your rails server.
8. Navigate to http://localhost:3000/sql/reports
9. Authenticate using your old_sql_admin user.
10. Select user from the Reports drop down list. Click run.

Screenshots
-----------
#### jqGrid

![jqGrid view](https://github.com/egonz/old_sql/raw/master/screenshots/jqgrid.png "jqGrid view")

#### HTML Table

![table view](https://github.com/egonz/old_sql/raw/master/screenshots/table.png "Table view")

#### Google Charts

![table view](https://github.com/egonz/old_sql/raw/master/screenshots/chart.png "Chart view")

Installation
------------

To install Old SQL type:

rails g old_sql:install

This will create the following directories:

* config/old_sql
* lib/old_sql

This generator will also create a migration that will add a old_sql_admin column to the model used for authentication (by default users).

If not already installed Devise is setup.

Creating Reports
----------------

Configure your reports config/old_sql/report.yml. An example configuration is created when you run the old_sql:install generator.

	# Old SQL Reports YAML
	# This is an example report. Replace it with your actual reports.
	#
	# 'description' is the value displayed in the 'SELECT A REPORT' drop down list.
	#
	# The 'report_sql' file should be located under config/old_sql/report_sql.
	# See config/old_sql/report_sql/user_old_sql_demo.sql for an example.
	#
	# The 'processor' parameter is optional, and should point to a class in lib/old_sql.
	# See lib/old_sql/user_old_sql_demo_processor.rb for an example.
	# 
	# 'report_processor' names should be capitalized and separated with underscores. The file
	# itself should follow normal ruby class naming conventions.
	#
	# 'report_design' is also optional, and should point to a file in config/old_sql/report_design.
	# See config/old_sql/report_design/user_old_sql_demo.CSV for an example.
	#
	# 'report_view' is optional. It overrides the default_report_view defined in the initializer. It
	# can be set to jqgrid, table, or chart.
	#
	# 'query_vars' are variables that are passed into the SQL file and can be parsed using ERB. 
	# E.g. <%=foo%>
	#
	# Optionally use 'report_db' to specify a class that extends ActiveRecord::Base. Use the require
	# path for your class. E.g. foo/my_alternative_db.
	#
	# The 'fields' are the headers for the report.

	user_jqgrid:
	  description: User jqGrid
	  report_sql: user_old_sql_demo
	  report_design: user_old_sql_demo.CSV
	  report_view: jqgrid
	  query_vars:
        - 
          foo: bar
	  fields: 
        - 'id'
        - 'name'
    
	user_table:
	  description: User HTML Table
	  report_sql: user_old_sql_demo
	  report_processor: User_Old_Sql_Demo_Processor
	  report_view: table
	  fields: 
	    - 'id'
	    - 'name'
    
	user_chart:
	  description: User Chart
	  report_sql: user_old_sql_demo
	  report_design: user_old_sql_demo.yml
	  report_view: chart
	  fields: 
	    - 'id'
	    - 'name'

Create a sql file under config/old_sql/report_sql. The following example is included:

	SELECT u.id, u.name
	FROM users u
	WHERE u.created_at > date('<%=start_date.gsub('/','-')%>')
	AND u.created_at < date('<%=end_date.gsub('/','-')%>')

Optionally create a CSV DESIGN file under config/old_sql/report_design:

	# Old SQL Example Report Design Document
	#
	# Text not in quotes are column names from the SQL query.
	# Quoted text are labels that will appear in the report.
	# Expressions like ( id + id ) * 10 below must be single 
	# space delimited. So (id+id) will not parse correctly.
	#
	# NaN and Infinity are returned as zero. 
	#
	# Comments are lines beginning with a hash #. They are 
	# stripped when this document is parsed.
	#
	# Values (either columns or expressions) are rounded by default. 
	# To disable this set round_report_values to false in
	# config/initializers/old_sql.rb. You can also change the
	# precision, which is 2 by default.
	
	id,name
	"Example Math Operation",id + id
	"Totals","..."
	"Expression",( id + id ) * 10
	"Divide by Zero 1",0 / 0
	"Divide by Zero 2",1.0 / 0
	"Divide by Zero 3",0.0 / 0.0
	"Rounding",200.0 / 43.0

Optionally create a CHART DESIGN file under config/old_sql/report_design:
	
	# Old SQL Chart Design Example
	#
	# The key for the YAML entry can either be pie or bar.
	# 'title' is a label describing the data.
	# 'data' can be either a column name, or a formula.

	pie:
	  - 
	    title: Id
	    data: id
	  - 
	    title: Id + 20
	    data: id + 20
	  - 
	    title: Id + 50
	    data: id + 50
	  - 
	    title: Id + 70
	    data: id + 70
	  - 
	    title: Id + 10
	    data: id + 10  

Optionally create a processor under lib/old_sql_report_processor:

	require 'old_sql/report_processor/base'

	module OldSql
	  module ReportProcessor
	    class UserOldSqlDemoProcessor < OldSql::ReportProcessor::Base
   
	      def parse(resultset)
	        init(resultset)
     
	        Rails.logger.debug "REC: #{@rec}"
     
	        add_row([@rec['id'], @rec['name']])
	        add_row(['Totals', '...'])
     
	        @data
	      end
	    end
	  end
	end

Design File Tips
----------------

Design files, both CSV and CHART, work best (only?) with queries that return a single record.
Ideally the query returns aggregate results, from one or more tables. For example:

	SELECT
		IFNULL(SUM(f.total),0) AS foo_total,
		IFNULL(SUM(CASE WHEN f.attempts IS NOT NULL THEN 1 ELSE 0 END),0) AS foo_attempts,
		IFNULL(bar_totals.bar_count,0) AS bar_count
	FROM
		foo f
	JOIN
		(SELECT COUNT(id) AS bar_count FROM bar) AS bar_totals
	WHERE
		1=1
		AND f.created_at > '<%=start_date%>'
		AND f.created_at < '<%=end_date%>'
		
If you need to process more than a single record create a subclass of OldSql::ReportProcessor::Base. See 
[UserOldSqlDemoProcessor](https://github.com/egonz/old_sql/blob/master/lib/generators/old_sql/templates/user_processor.rb.example).
		
Customize
---------

All css and html template files can be copied to your installation by executing: 

	rails g old_sql:copy_assets
	
Settings for Old SQL can be configured in config/initializers/old_sql.rb.

Rake Examples
-------------

	rake old_sql:print:range[user_table,'development','2011-03-01','2011-09-01']

	rake old_sql:print:today[user_table,'development']

	rake old_sql:print:week[user_table,'development']

Contributing to old_sql
-----------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Eddie Gonzales. See LICENSE.txt for
further details.

