require 'rails_helper'

RSpec.describe CheckinsController, :type => :controller do
  render_views

  let(:json) { JSON.parse(response.body) }
  let!(:user1) {User.create(name:"User 01", email:"test@test.es", uid: 1518243131643898)}
  let!(:location1) {user1.locations.create( name: "Cockthorpe",
                                            lat: 52.939357,
                                            lng: 0.943931,
                                            facebook_id: 2884836163367365)}

  describe "Checkins API" do
    before do
      post :create, format: :json, :checkin => {fb_location_id: 2884836163367365, fb_user_id: 1518243131643898}
    end

    it "creates new checkin" do
      expect(response.status).to be(201)
    end

    it "new checkin has user & location" do
      expect(JSON.parse(response.body)["user_id"]).to be user1.id
      expect(JSON.parse(response.body)["location_id"]).to be location1.id
    end

    it "creates user id and location records" do
      expect(Checkin.last.user_id).to be user1.id
      expect(Checkin.last.location_id).to be location1.id
    end

    it "stores record in database" do
      expect(Checkin.count).to be(1)
    end

  end
end
