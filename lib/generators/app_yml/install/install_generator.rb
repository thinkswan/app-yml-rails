# Public: A generator used to install the app.yml config file and the app.rb initializer.
#   Copies lib/generators/app_yml/install/templates/app.yml to config/app.yml
#   Copies lib/generators/app_yml/install/templates/app.rb to config/initializers/app.rb
#
# Usage: rails generate app_yml:install
module AppYml
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
  
      desc "Creates an app.yml config file in 'config/app.yml' and an app.rb initializer (providing access to the App constant) in 'config/initializers/app.rb'."

      def create_config_file
        template 'app.yml', File.join('config', 'app.yml')
      end

      def create_initializer_file
        template 'app.rb', File.join('config', 'initializers', 'app.rb')
      end
     
    end
  end
end


