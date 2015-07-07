class WelcomeController < ApplicationController
  def index
    @locations = Location.where(user: current_user)
    @total_checkins = Checkin.count
  end
end
