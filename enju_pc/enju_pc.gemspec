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

  s.add_dependency "enju_seed", "~> 0.2.0.pre6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.1"
  s.add_development_dependency "annotate"
end
