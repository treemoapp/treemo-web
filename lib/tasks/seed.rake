namespace :seed do

  def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

  def rand_in_range(from, to)
    rand * (to - from) + from
  end


  desc "Creates 100 checkins or existing locations"
  task checkins: :environment do
    500.times do |i|
      Checkin.create(user_id: User.all.sample.id,
                    location_id: Location.all.sample.id,
                    created_at: rand_time(45.days.ago))
    end

  end

end
