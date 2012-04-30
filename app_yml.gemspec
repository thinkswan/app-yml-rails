$:.push File.expand_path("../lib", __FILE__)

require "app_yml/version"

Gem::Specification.new do |s|
  s.name        = "app-yml-rails"
  s.version     = AppYml::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ "Graham Swan" ]
  s.email       = "thinkswan@gmail.com"
  s.homepage    = "https://github.com/thinkswan/app-yml-rails"
  s.summary     = "The easiest way to maintain project-wide settings. (Eg: App.emails.sales_email will return 'sales@example.com' anywhere in your app)"
  s.description = "An awesome app.yml gem for Rails. Supports App.settings.nested_setting syntax, all/production/staging/development/test environments, and auto-reloads app.yml changes without requiring an application restart."

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency "rails", "~> 3.1"
end
