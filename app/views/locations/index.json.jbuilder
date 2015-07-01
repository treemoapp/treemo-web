json.array!(@locations) do |location|
  json.extract! location, :id, :facebook_id, :name, :lat, :lng
  json.url location_url(location, format: :json)
end
