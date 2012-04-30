class LandingController < ApplicationController
  def index
    # Load all app.yml settings (if the initializer exists)
    if defined? App
      @app = App
    # If the initializer hasn't been installed yet, display instructions on how to install it using the provided generator
    else
      render :missing_initializer
    end
  end
end
