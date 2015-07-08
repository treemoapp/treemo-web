require 'byebug'
class FbPlacesController < ApplicationController
  def index
    @oauth = Koala::Facebook::OAuth.new( ENV["TREEMO_APP_ID"], ENV["TREEMO_APP_SECRET"])
    require 'byebug'
    # I will explain this part in a moment.
    if params[:term]
      oauth_token = ENV["TREEMO_FB_OAUTH"]
      # oauth_token = @oauth.get_user_info_from_cookies(cookies)
      # @people = Location.where('name ILIKE ?', "#{params[:term]}%")
      # byebug
      # puts @graph.get_object("367457470014643")["username"]
      # puts @graph.get_connection('me','friends').count
      # oauth_token = Koala::Facebook::OAuth.new(ENV["TREEMO_APP_ID"], ENV["TREEMO_APP_SECRET"], user_omniauth_callback_path)
      @graph = Koala::Facebook::API.new(oauth_token)
      @people =  @graph.get_connection('search', '?type=place&q=' + params[:term] + '&center=51.517975,-0.073274')
    else
      @people = Location.all
    end

    respond_to do |format|
      format.html # index.html.erb
      # Here is where you can specify how to handle the request for "/people.json"
      format.json { render json: @people.to_json }
    end
end
end
