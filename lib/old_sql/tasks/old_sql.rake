require 'erubis'
require 'old_sql/shell_report_facade'
require 'old_sql/report_design/parser'
require 'old_sql/report_processor/base'

namespace :old_sql do
  namespace :print do
    desc 'Print report (see reports.yml) using a date range. Pass true for clean to just include data.'
    task :range, :report, :env, :start, :end, :clean do |t, args|
      report = args[:report]
      env = args[:env]
      start_date = args[:start]
      end_date = args[:end]
      clean = args[:clean].nil? ? false : true
    
      OldSql::ShellReportFacade.run_report(report, env, start_date, end_date, clean)
    end
  
    desc 'Print report for today. Pass true for clean to just include data.'
    task :today, :report, :env, :clean do |t, args|
      report = args[:report]
      env = args[:env]
      clean = args[:clean].nil? ? false : true
      
      now = Date.today
      start_date = now
      end_date = now + 1
    
      OldSql::ShellReportFacade.run_report(report, env, start_date.to_s, end_date.to_s, clean)
    end
  
    desc 'Print report for the current week. Pass true for clean to just include data.'
    task :week, :report, :env, :clean do |t, args|
      report = args[:report]
      env = args[:env]
      clean = args[:clean].nil? ? false : true
      
      now = Date.today
      start_date = now - now.cwday + 1
      end_date = now - now.cwday + 8
    
      OldSql::ShellReportFacade.run_report(report, env, start_date.to_s, end_date.to_s, clean)
    end
  end
end