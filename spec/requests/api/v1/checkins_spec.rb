require 'rails_helper'

RSpec.describe CheckinsController, :type => :controller do
  render_views

  let(:json) { JSON.parse(response.body) }


  describe "Checkins API" do
    before do
      @user1 = User.create(name:"User 01", email:"test@test.es")
      @location1 = @user1.locations.create( name: "Cockthorpe",
                                            lat: 52.939357,
                                            lng: 0.943931)
    end

    xit "updates the number of checkins" do
      puts response.body
      # get '/locations.json?lat=51.525685&lng=-0.087627'
      # expect(response).to be_success
      # json = JSON.parse(response.body)
      # expect(json.count).to eq(2)
      # expect(json.first["name"]).to eq("Old St")
    end

    it "creates new checkin" do
      post :create, format: :json, :checkin => {location_id: @location1.id, user_id: @user1.id}
      expect(response.status).to be(201)
      # json = JSON.parse(response.body)
      # expect(json.count).to eq(2)
      # expect(json.first["name"]).to eq("Cockthorpe")
    end
  end
end
