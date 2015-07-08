
namespace :facebook do
  desc "TODO"
  task get_places: :environment do
    oauth_access_token = 'CAACEdEose0cBAEOZBsZAKOUuKidCZCn0c0FIUpoIo0NnWkQVIAAVYtLU292cMWp9dvjCu6YSSHDNnQDMEE4BsDENrf7EdmPRCBH8DkxzDtkZBa8jdAu8lINkmISMRFYrlYVeSZAmTwbHFEyo2fHcyMtdMZCK02ygNi0TFujtW2ZBinYhuoJjVrz3fiMV3IRYVgRbKc9um6CCx4IfbEUYSGWJS1AZBjfWZAqZAjOZCKKlAMSXwZDZD'
    @graph = Koala::Facebook::API.new(oauth_access_token)
    # puts @graph.get_object("367457470014643")["username"]
    # puts @graph.get_connection('me','friends').count
    data =  @graph.get_connection('search', "?type=place&center=51.517975,-0.073274&distance=1000")
    puts data.inspect
  end

end
