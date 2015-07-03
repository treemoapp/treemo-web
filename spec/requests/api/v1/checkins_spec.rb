require 'rails_helper'
require 'byebug'

RSpec.describe CheckinsController, :type => :controller do
  render_views

  let(:json) { JSON.parse(response.body) }


  describe "Checkins API" do
    before do
      @user1 = User.create(name:"User 01", email:"test@test.es", uid: 1518243131643898)
      @location1 = @user1.locations.create( name: "Cockthorpe",
                                            lat: 52.939357,
                                            lng: 0.943931,
                                            facebook_id: 2884836163367365)
      post :create, format: :json, :checkin => {fb_location_id: 2884836163367365, fb_user_id: 1518243131643898}
    end

    it "creates new check-in with user & location" do
      expect(response.status).to be(201)
      expect(JSON.parse(response.body)["user_id"]).to be @user1.id
      expect(JSON.parse(response.body)["location_id"]).to be @location1.id
    end

    it "creates record in database" do
      expect(Checkin.last.user_id).to be @user1.id
      expect(Checkin.last.location_id).to be @location1.id
    end

  end
end
