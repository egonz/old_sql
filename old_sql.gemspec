# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "old_sql/version"

Gem::Specification.new do |s|
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.name        = "old_sql"
  s.version     = OldSql::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eddie Gonzales"]
  s.email       = ["eddiemgonzales@gmail.com"]
  s.homepage    = "https://github.com/egonz/old_sql"
  s.summary     = %q{Database Reporting for Rails}
  s.description = %q{OldSQL is a Ruby on Rails database reporting gem that uses plain old SQL}

  s.rubyforge_project = "old_sql"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
