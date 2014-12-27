$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_sc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_sc"
  s.version     = EnjuSc::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EnjuSc."
  s.description = "TODO: Description of EnjuSc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "enju_seed", "~> 0.2.0.pre6"
  s.add_dependency "acts_as_tree"
  s.add_dependency "linkeddata"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "annotate"
end
