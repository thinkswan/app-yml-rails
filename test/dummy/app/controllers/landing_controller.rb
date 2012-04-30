class LandingController < ApplicationController
  def index
    # Load all app.yml settings (if the initializer exists)
    if defined? App
      @app = App
    else # If the initializer hasn't been installed yet, display instructions on how to do so
      render :missing_initializer
    end
  end
end
