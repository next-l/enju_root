$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_pc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_pc"
  s.version     = EnjuPc::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EnjuPc."
  s.description = "TODO: Description of EnjuPc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "kaminari", "~> 0.16.2"
  s.add_dependency "omniauth-identity"
  s.add_dependency "pundit"
  s.add_dependency "acts_as_list", "~> 0.6"
  s.add_dependency "normalizr", "~> 0.1"
  s.add_dependency "addressable", "~> 2.3"
  s.add_dependency "elasticsearch-model", "~> 0.1.6"
  s.add_dependency "elasticsearch-rails", "~> 0.1.6"
  s.add_dependency "nested_form"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "annotate"
end
