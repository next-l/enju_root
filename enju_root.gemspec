$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_root/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_root"
  s.version     = EnjuRoot::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/next-l/enju_root"
  s.summary     = "Next-L Enju Root"
  s.description = "bibliographic data management system"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"
  #s.add_dependency "enju_core", "~> 0.2.0.pre1"
  s.add_dependency "ruby-graphviz"
  s.add_dependency "linkeddata"
  s.add_dependency "settingslogic"
  s.add_dependency "sunspot_rails"
  s.add_dependency "validates_timeliness"
  s.add_dependency "rack-protection"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sunspot_solr"
end
