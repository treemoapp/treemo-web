class CheckinsController < ApplicationController
  # before_action :set_checkin, only: [:show, :edit, :update, :destroy]
  protect_from_forgery unless: -> { request.format.json? }

  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.all
  end

  # POST /checkins
  # POST /checkins.json
  def create
    user_id = User.where(uid: checkin_params["fb_user_id"]).first.id
    location_id = Location.where(facebook_id: checkin_params["fb_location_id"]).first.id
    @checkin = Checkin.new(user_id: user_id, location_id: location_id)

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
        format.json { render :show, status: :created, location: @checkin }
      else
        format.html { render :new }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkin_params
      params.require(:checkin).permit(:user_id, :location_id, :fb_user_id, :fb_location_id)
    end
end
