json.array!(@locations) do |location|
  json.extract! location, :id, :facebook_id, :name, :lat, :lng, :distance
end
