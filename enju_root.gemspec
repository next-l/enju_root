$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_root/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_root"
  s.version     = EnjuRoot::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_root"
  s.summary     = "Next-L Enju Root"
  s.description = "FRBR/FRSAD-based bibliographic record management system"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "kaminari", "~> 0.16.3"
  s.add_dependency "devise", "~> 4.0.0.rc1"
  s.add_dependency "pundit", "~> 1.1"
  s.add_dependency "acts_as_list", "~> 0.7"
  s.add_dependency "strip_attributes", "~> 1.7"
  s.add_dependency "addressable", "~> 2.3"
  s.add_dependency "refile", "~> 0.6"
  s.add_dependency "refile-mini_magick"
  #s.add_dependency "elasticsearch-model", "~> 0.1.8"
  #s.add_dependency "elasticsearch-rails", "~> 0.1.8"
  s.add_dependency "cocoon"
  s.add_dependency "ruby-graphviz"
  s.add_dependency "linkeddata"
  s.add_dependency "sunspot_rails", "~> 2.2.4"
  s.add_dependency "validates_timeliness", "~> 4.0"
  s.add_dependency "closure_tree"
  s.add_dependency "faraday"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.4"
  s.add_development_dependency "sunspot_solr", "2.2.0"
  s.add_development_dependency "sunspot-rails-tester"
  s.add_development_dependency "annotate"
end
