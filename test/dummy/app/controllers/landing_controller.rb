class LandingController < ApplicationController
  def index
    # If the initializer hasn't been installed yet, display instructions on how to install it using the provided generator
    render :missing_initializer unless defined? App
  end
end
