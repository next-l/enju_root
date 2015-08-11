$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_sc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_sc"
  s.version     = EnjuSc::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_root"
  s.summary     = "TODO: Summary of EnjuSc."
  s.description = "TODO: Description of EnjuSc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "friendly_id", "~> 5.1"
  s.add_dependency "kaminari", "~> 0.16.3"
  s.add_dependency "devise"
  s.add_dependency "pundit"
  s.add_dependency "acts_as_list", "~> 0.7"
  s.add_dependency "normalize_attributes", "~> 0.2"
  s.add_dependency "addressable", "~> 2.3"
  s.add_dependency "elasticsearch-model", "~> 0.1.7"
  s.add_dependency "elasticsearch-rails", "~> 0.1.7"
  s.add_dependency "cocoon"
  s.add_dependency "closure_tree"
  s.add_dependency "linkeddata"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.3"
  s.add_development_dependency "annotate"
end
