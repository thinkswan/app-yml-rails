module AppYml
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
  
      desc 'Creates a SugarCRM gem configuration file at config/sugarcrm.yml, and an initializer at config/initializers/sugarcrm.rb'

      def create_config_file
        template 'app.yml', File.join('config', 'app.yml')
      end

      def create_initializer_file
        template 'app.rb', File.join('config', 'initializers', 'app.rb')
      end
     
    end
  end
end


