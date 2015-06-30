class WelcomeController < ApplicationController
  def index
    User.all
  end
end
