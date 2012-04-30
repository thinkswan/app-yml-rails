# Public: Injects a filter into the project's ApplicationController to refresh the 'app.yml' settings for every request.
require 'action_controller'

ActionController::Base.class_eval do
  private

  # Private: Refreshes all settings from 'app.yml' for every request (no app restarts required).
  #
  # Provides a global 'App' constant holding project-wide settings.
  def _reload_app_yml
    App::build_settings_hash
  end
end

ActionController::Base.instance_eval do
  helper_method :_reload_app_yml
  
  # Refresh 'app.yml' settings if the 'app.rb' initializer has been installed
  before_filter :_reload_app_yml, :if => Proc.new { defined? App }
end
