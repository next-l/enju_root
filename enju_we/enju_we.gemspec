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

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "kaminari", "~> 0.16.2"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency "pundit"
  s.add_dependency "acts_as_list", "~> 0.6"
  s.add_dependency "normalizr", "~> 0.1"
  s.add_dependency "addressable", "~> 2.3"
  s.add_dependency "elasticsearch-model", "~> 0.1.6"
  s.add_dependency "elasticsearch-rails", "~> 0.1.6"
  s.add_dependency "nested_form"
  s.add_dependency "ruby-graphviz"
  s.add_dependency "linkeddata"
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
