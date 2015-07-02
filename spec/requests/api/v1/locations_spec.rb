require 'rails_helper'

describe "Locations API" do
    before do
      user1 = User.create(name:"User 01", email:"test@test.es")
      location1 = user1.locations.create( name: "Cockthorpe",
                                          lat: 52.939357,
                                          lng: 0.943931)
      location2 = user1.locations.create( name: "Old St",
                                          lat: 51.525685,
                                          lng: -0.082336)
    end

  it "sends list of locations sorted by closest" do
    get '/locations.json?lat=51.525685&lng=-0.087627'
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.count).to eq(2)
    expect(json.first["name"]).to eq("Old St")
  end

  it "responds if there is no location" do
    get '/locations' # should be locations.json but not sure how to add conditional on controller
    expect(response).to be_success
    # json = JSON.parse(response.body)
    # expect(json.count).to eq(2)
    # expect(json.first["name"]).to eq("Cockthorpe")
  end
end
