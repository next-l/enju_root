$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_we/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_we"
  s.version     = EnjuWe::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EnjuWe."
  s.description = "TODO: Description of EnjuWe."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "enju_seed", "~> 0.2.0.pre6"
  s.add_dependency "ruby-graphviz"
  s.add_dependency "linkeddata"
  s.add_dependency "settingslogic"
  s.add_dependency "sunspot_rails"
  s.add_dependency "validates_timeliness"
  s.add_dependency "rack-protection"
  s.add_dependency "closure_tree"
  s.add_dependency "faraday"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "sunspot_solr"
  s.add_development_dependency "sunspot-rails-tester"
  s.add_development_dependency "annotate"
end
