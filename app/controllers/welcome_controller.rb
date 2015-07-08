class WelcomeController < ApplicationController
  def index
    @locations = Location.where(user: current_user)
    @total_checkins = Checkin.count
    @my_location_checkins = @locations.map {|location| location.checkins.count}.sum
    @balance = (Payment.where(user: current_user).sum(:amount) / 100) - @my_location_checkins * 0.20
  end
end
