# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{old_sql}
  s.version = "1.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Eddie Gonzales}]
  s.date = %q{2011-06-14}
  s.description = %q{OldSQL is a Rails Engine database reporting gem that uses plain old SQL}
  s.email = %q{egonzales@pureplay.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "Rakefile",
    "app/controllers/old_sql/report_controller.rb",
    "app/views/layouts/old_sql/report.html.erb",
    "app/views/old_sql/errors/401.html.erb",
    "app/views/old_sql/report/chart.html.erb",
    "app/views/old_sql/report/datagrid.html.erb",
    "app/views/old_sql/report/index.html.erb",
    "app/views/old_sql/report/print.html.erb",
    "app/views/old_sql/report/table.html.erb",
    "config/locales/old_sql.en.yml",
    "config/routes.rb",
    "lib/extensions/action_controller/base.rb",
    "lib/generators/old_sql/USAGE",
    "lib/generators/old_sql/copy_assets_generator.rb",
    "lib/generators/old_sql/install_devise_migrations_generator.rb",
    "lib/generators/old_sql/install_generator.rb",
    "lib/generators/old_sql/install_migrations_generator.rb",
    "lib/generators/old_sql/old_sql_generator.rb",
    "lib/generators/old_sql/templates/add_devise_to_users_migration.rb",
    "lib/generators/old_sql/templates/add_old_sql_admin_to_users_migration.rb",
    "lib/generators/old_sql/templates/devise_model.rb.template",
    "lib/generators/old_sql/templates/old_sql.rb",
    "lib/generators/old_sql/templates/reports.yml.example",
    "lib/generators/old_sql/templates/user.erb.example",
    "lib/generators/old_sql/templates/user_design_template.csv",
    "lib/generators/old_sql/templates/user_old_sql_demo_chart_design.yml",
    "lib/generators/old_sql/templates/user_processor.rb.example",
    "lib/old_sql.rb",
    "lib/old_sql/engine.rb",
    "lib/old_sql/report_design/cell.rb",
    "lib/old_sql/report_design/cell_data.rb",
    "lib/old_sql/report_design/chart.rb",
    "lib/old_sql/report_design/chart_data.rb",
    "lib/old_sql/report_design/chart_item.rb",
    "lib/old_sql/report_design/chart_parser.rb",
    "lib/old_sql/report_design/model.rb",
    "lib/old_sql/report_design/parser.rb",
    "lib/old_sql/report_design/row.rb",
    "lib/old_sql/report_processor/base.rb",
    "lib/old_sql/shell_report_facade.rb",
    "lib/old_sql/tasks/old_sql.rake",
    "public/javascripts/old_sql/MochiKit-1.4.2/Changes",
    "public/javascripts/old_sql/MochiKit-1.4.2/LICENSE.txt",
    "public/javascripts/old_sql/MochiKit-1.4.2/MANIFEST",
    "public/javascripts/old_sql/MochiKit-1.4.2/META.json",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Async.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Base.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Color.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/DOM.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/DateTime.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/DragAndDrop.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Format.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Iter.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Logging.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/LoggingPane.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Position.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Selector.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Signal.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Sortable.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Style.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/VersionHistory.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/Visual.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/html/MochiKit/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/js/toc.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Async.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Base.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Color.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/DOM.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/DateTime.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/DragAndDrop.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Format.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Iter.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Logging.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/LoggingPane.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Position.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Selector.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Signal.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Sortable.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Style.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/VersionHistory.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/Visual.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/doc/rst/MochiKit/index.rst",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/ajax_tables/ajax_tables.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/ajax_tables/ajax_tables.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/ajax_tables/domains.json",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/ajax_tables/domains.xml",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/ajax_tables/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/color_wheel/color_wheel.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/color_wheel/color_wheel.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/color_wheel/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/dnd_sortable.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/dropmarker.png",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/icon.png",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable2_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable3_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable4_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable5_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/dnd_sortable/sortable_tree_test.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/draggable/draggable.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/draggable/draggable.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/draggable/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_bigslide.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_blind.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_blindslide.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_combi.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_fadeappear.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_grow_shrink.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_onload.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_queue.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_queue_limit.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_scroll.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/effects_slide.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/full.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/icon.png",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/effects/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/interpreter/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/interpreter/interpreter.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/interpreter/interpreter.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/key_events/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/key_events/key_events.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/key_events/key_events.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/logging_pane/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/logging_pane/logging_pane.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/logging_pane/logging_pane.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mochiregexp/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mochiregexp/mochiregexp.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mochiregexp/mochiregexp.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mouse_events/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mouse_events/mouse_events.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/mouse_events/mouse_events.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/rounded_corners/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/rounded_corners/rounded_corners.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/rounded_corners/rounded_corners.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_boxes.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_full.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_ghost.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_hoverclass.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_scroll.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/dnd_snap.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/simple_dnd/simple_dnd.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/sortable_tables/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/sortable_tables/sortable_tables.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/sortable_tables/sortable_tables.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/SyntaxHighlighter.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/Tests.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushCSharp.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushDelphi.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushJScript.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushPhp.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushPython.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushSql.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushVb.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shBrushXml.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/lib/SyntaxHighlighter/shCore.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/view-source.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/view-source.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/examples/view-source/view-source.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/include/_img/bg_docheader.gif",
    "public/javascripts/old_sql/MochiKit-1.4.2/include/_img/g_bullet.gif",
    "public/javascripts/old_sql/MochiKit-1.4.2/include/_img/g_logo_doc.gif",
    "public/javascripts/old_sql/MochiKit-1.4.2/include/css/documentation.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/include/css/general.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Async.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Base.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Color.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/DOM.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/DateTime.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/DragAndDrop.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Format.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Iter.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Logging.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/LoggingPane.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/MochiKit.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/MockDOM.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Position.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Selector.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Signal.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Sortable.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Style.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Test.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/Visual.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/lib/MochiKit/__package__.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/packed/MochiKit/MochiKit.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/packed/MochiKit/__package__.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/packed/MochiKit/customize.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/FakeJSAN.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/SimpleTest/SimpleTest.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/SimpleTest/TestRunner.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/SimpleTest/test.css",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/cli.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/index.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/standalone.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Base.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Color.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_DateTime.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_DragAndDrop.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Format.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Iter.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Logging.js",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Async.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Async.json",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Base.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Color.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-DOM-Safari.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-DOM.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-DateTime.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-DragAndDrop.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Format.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Iter.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-JSAN.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Logging.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-MochiKit.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Selector.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Signal.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Style.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_MochiKit-Visual.html",
    "public/javascripts/old_sql/MochiKit-1.4.2/tests/test_Signal.js",
    "public/javascripts/old_sql/date_format.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-bg.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-bg1251.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-cat.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-cn.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-cs.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-da.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-de.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-el.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-en.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-es.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-fa.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-fi.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-fr.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-gl.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-he.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-hu.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-is.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-it.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-ja.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-nl.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-no.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-pl.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-pt-br.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-pt.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-ro.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-ru.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-sk.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-sv.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-tr.js",
    "public/javascripts/old_sql/jqgrid/i18n/grid.locale-ua.js",
    "public/javascripts/old_sql/jqgrid/jquery-ui-1.8.custom.min.js",
    "public/javascripts/old_sql/jqgrid/jquery.jqGrid.min.js",
    "public/javascripts/old_sql/jqgrid/ui.multiselect.js",
    "public/javascripts/old_sql/jquery-1.5.1.min.js",
    "public/javascripts/old_sql/jquery-ui-1.8.13.custom.min.js",
    "public/javascripts/old_sql/jquery-ui-timepicker-addon.js",
    "public/javascripts/old_sql/old_sql.js",
    "public/javascripts/old_sql/plotkit-0.9.1/COPYING",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/Base.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/Canvas.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/EasyPlot.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/Layout.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/PlotKit.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/PlotKit_Packed.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/SVG.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/SweetCanvas.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/SweetSVG.js",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/dummy.svg",
    "public/javascripts/old_sql/plotkit-0.9.1/PlotKit/excanvas.js",
    "public/javascripts/old_sql/plotkit-0.9.1/README",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/MochiKitAdditions.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/MochiKitAdditions.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Base.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Base.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Canvas.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Canvas.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.EasyPlot.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.EasyPlot.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Layout.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Layout.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.QuickStart.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.QuickStart.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Renderer.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.Renderer.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SVG.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SVG.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SweetCanvas.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SweetCanvas.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SweetSVG.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.SweetSVG.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/PlotKit.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/SVGCanvasCompat.html",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/SVGCanvasCompat.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/barsample.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/black.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/blue.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/cyan.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/doc.css",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/generate.py",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/green.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/orange.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/piesample.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/purple.png",
    "public/javascripts/old_sql/plotkit-0.9.1/doc/red.png",
    "public/javascripts/old_sql/plotkit-0.9.1/scripts/custom_rhino.jar",
    "public/javascripts/old_sql/plotkit-0.9.1/scripts/pack.py",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/axis.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/basic.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/basic.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/debug.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/demo-svg.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/demo-svg.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/demo.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/demo.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/dynamic.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/firefox.png",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/konqueror.png",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/mozilla.ico",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/msie.gif",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/opera.ico",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/img/safari.gif",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/labels-img.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/labels.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/prototype_compat.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/quickstart-easy.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/quickstart-horiz.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/quickstart-neg.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/quickstart-svg.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/quickstart.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/sample.txt",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/svg-sweet.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/svg-sweet.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/svg.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/svg.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/sweet.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/sweet.js",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/tests.css",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/testsvg.html",
    "public/javascripts/old_sql/plotkit-0.9.1/tests/testsvg.js",
    "public/javascripts/old_sql/table.js",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_diagonals-thick_90_eeeeee_40x40.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_flat_15_cd0a0a_40x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_glass_100_e4f1fb_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_glass_50_3baae3_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_glass_80_d7ebf9_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_highlight-hard_100_f2f5f7_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_highlight-hard_70_000000_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_highlight-soft_100_deedf7_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-bg_highlight-soft_25_ffef8f_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-icons_2694e8_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-icons_2e83ff_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-icons_3d80b3_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-icons_72a7cf_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/images/ui-icons_ffffff_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/default/jquery-ui-1.8.custom.css",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-anim_basic_16x16.gif",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_flat_0_aaaaaa_40x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_flat_55_fbec88_40x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_glass_75_d0e5f5_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_glass_85_dfeffc_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_glass_95_fef1ec_1x400.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_gloss-wave_55_5c9ccc_500x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_inset-hard_100_f5f8f9_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-bg_inset-hard_100_fcfdfd_1x100.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_217bc0_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_2e83ff_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_469bdd_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_6da8d5_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_cd0a0a_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_d8e7f3_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/images/ui-icons_f9bd01_256x240.png",
    "public/stylesheets/old_sql/jqgrid/themes/redroad/jquery-ui-1.8.custom.css",
    "public/stylesheets/old_sql/jqgrid/ui.jqgrid.css",
    "public/stylesheets/old_sql/jqgrid/ui.multiselect.css",
    "public/stylesheets/old_sql/old_sql.css",
    "public/stylesheets/old_sql/table.css",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_diagonals-thick_18_b81900_40x40.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_diagonals-thick_20_666666_40x40.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_flat_10_000000_40x100.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_glass_100_f6f6f6_1x400.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_glass_100_fdf5ce_1x400.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_glass_65_ffffff_1x400.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_gloss-wave_35_f6a828_500x100.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_highlight-soft_100_eeeeee_1x100.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-bg_highlight-soft_75_ffe45c_1x100.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-icons_222222_256x240.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-icons_228ef1_256x240.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-icons_ef8c08_256x240.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-icons_ffd27a_256x240.png",
    "public/stylesheets/old_sql/ui-lightness/images/ui-icons_ffffff_256x240.png",
    "public/stylesheets/old_sql/ui-lightness/jquery-ui-1.8.13.custom.css"
  ]
  s.homepage = %q{http://github.com/egonz/old_sql}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.3}
  s.summary = %q{Database Reporting for Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

