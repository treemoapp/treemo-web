class DashboardController < ApplicationController
  def index
    @checkins_count = Checkin.all.count
  end


end
