# -*- encoding: utf-8 -*-
# stub: rack-bug 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-bug"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bryan Helmkamp"]
  s.date = "2010-05-28"
  s.email = "bryan@brynary.com"
  s.extra_rdoc_files = ["README.md", "MIT-LICENSE.txt"]
  s.files = ["MIT-LICENSE.txt", "README.md"]
  s.homepage = "http://github.com/brynary/rack-bug"
  s.rubyforge_project = "rack-bug"
  s.rubygems_version = "2.4.5"
  s.summary = "Debugging toolbar for Rack applications implemented as middleware"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.0"])
  end
end
