require 'faker'

200.times do |i|
  user = User.create(name:Faker::Name.name,
              email:Faker::Internet.email,
              image:Faker::Avatar.image,
              )

  user.locations.create(name: Faker::Company.name,
                        lat: Faker::Address.latitude,
                        lng: Faker::Address.longitude)
end

