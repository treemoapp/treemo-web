json.array!(@checkins) do |checkin|
  json.name checkin.location.name
  json.lat checkin.location.lat
  json.lng checkin.location.lng
  # json.url checkin_url(checkin, format: :json)
end
