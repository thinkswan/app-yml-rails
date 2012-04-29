class LandingController < ApplicationController
  def index
    # Load all app.yml settings
    @app = AppYml
  end
end
