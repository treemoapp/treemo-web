class WelcomeController < ApplicationController
  def index
    @locations = Location.where(user: current_user)
  end
end
