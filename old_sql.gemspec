# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{old_sql}
  s.version = "0.9.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Eddie Gonzales}]
  s.date = %q{2011-06-06}
  s.description = %q{OldSQL is a Rails Engine database reporting gem that uses plain old SQL}
  s.email = %q{egonzales@pureplay.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "app/controllers/old_sql/report_controller.rb",
    "app/views/layouts/old_sql/report.html.erb",
    "app/views/old_sql/report/datagrid.html.erb",
    "app/views/old_sql/report/index.html.erb",
    "app/views/old_sql/report/print.html.erb",
    "config/locales/old_sql.en.yml",
    "config/routes.rb",
    "lib/extensions/action_controller/base.rb",
    "lib/old_sql.rb",
    "lib/old_sql/engine.rb",
    "lib/old_sql/report_processor/base.rb",
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
      s.add_runtime_dependency(%q<sanitize>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<sanitize>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<sanitize>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

