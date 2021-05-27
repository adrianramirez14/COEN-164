# -*- encoding: utf-8 -*-
# stub: do_sqlite3 0.10.17 ruby lib
# stub: ext/do_sqlite3/extconf.rb

Gem::Specification.new do |s|
  s.name = "do_sqlite3".freeze
  s.version = "0.10.17"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dirkjan Bussink".freeze]
  s.date = "2016-01-24"
  s.description = "Implements the DataObjects API for Sqlite3".freeze
  s.email = "d.bussink@gmail.com".freeze
  s.extensions = ["ext/do_sqlite3/extconf.rb".freeze]
  s.extra_rdoc_files = ["ChangeLog.markdown".freeze, "LICENSE".freeze, "README.markdown".freeze]
  s.files = ["ChangeLog.markdown".freeze, "LICENSE".freeze, "README.markdown".freeze, "ext/do_sqlite3/extconf.rb".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "DataObjects Sqlite3 Driver".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<data_objects>.freeze, ["= 0.10.17"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 0.7"])
    else
      s.add_dependency(%q<data_objects>.freeze, ["= 0.10.17"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<data_objects>.freeze, ["= 0.10.17"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.7"])
  end
end
