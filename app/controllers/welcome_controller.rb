class WelcomeController < ApplicationController
  def index
    User.all
    @checkins_count = Checkin.all.count
  end
end
