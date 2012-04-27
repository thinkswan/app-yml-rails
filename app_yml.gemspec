$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "app_yml/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_yml"
  s.version     = AppYml::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AppYml."
  s.description = "TODO: Description of AppYml."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "mysql2"
end
