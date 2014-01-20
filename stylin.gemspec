$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stylin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stylin"
  s.version     = Stylin::VERSION
  s.authors     = ["Bob Burbach"]
  s.email       = ["bob@criticaljuncture.org"]
  s.homepage    = "https://github.com/criticaljuncture/stylin"
  s.summary     = "Rails engine for a living style guide."
  s.description = "Rails engine for a living style guide."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails",           ">= 3.2.0"
  s.add_development_dependency "sass-rails",      "~> 3.2.6"
  s.add_development_dependency "bootstrap-sass",  "~> 3.0.3.0"
  s.add_dependency "jquery-rails",    "~> 3.0.0"
  s.add_dependency "kss",             "~> 0.5.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'pry'
end
