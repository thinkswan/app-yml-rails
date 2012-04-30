$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "app_yml/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "app_yml"
  s.version     = AppYml::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ "Graham Swan" ]
  s.email       = [ "thinkswan@gmail.com" ]
  s.homepage    = "https://github.com/thinkswan/app-yml-rails"
  s.summary     = "The easiest way to maintain project-wide settings. (Eg: App.emails.sales_email will return 'sales@example.com' anywhere in your app)"
  s.description = "An awesome app.yml gem for Rails. Supports App.settings.nested_setting syntax, all/production/staging/development/test environments, and auto-reloads app.yml changes without requiring an application restart."




  s.summary = "Use backbone.js with rails 3.1"
  s.description = "Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started."



  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["test/**/*"]
end
