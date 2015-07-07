require 'faker'

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end


200.times do |i|
  user = User.create(name:Faker::Name.name,
              email:Faker::Internet.email,
              image:Faker::Avatar.image,
              uid: Faker::Number.number(16)
              )

  user.locations.create(name: Faker::Company.name,
                        lat: Faker::Address.latitude,
                        lng: Faker::Address.longitude,
                        facebook_id: Faker::Number.number(16))
end

1000.times do |i|
  Checkin.create(user_id: User.all.sample.id,
                location_id: Location.all.sample.id,
                created_at: rand_time(30.days.ago))
end

400.times do |i|
  Checkin.create(user_id: User.all.sample.id,
                location_id: [1,2,3].sample,
                created_at: rand_time(30.days.ago))
end
