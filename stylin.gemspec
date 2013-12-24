$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stylin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stylin"
  s.version     = Stylin::VERSION
  s.authors     = ["Bob Burbach"]
  s.email       = ["bob@criticaljuncture.org"]
  s.homepage    = "https://github.com/peregrinator/stylin"
  s.summary     = "Rails engine for a living style guide."
  s.description = "Rails engine for a living style guide."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
end
