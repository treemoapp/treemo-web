json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :user_id, :location_id, :created_at
  # json.url checkin_url(checkin, format: :json)
end
