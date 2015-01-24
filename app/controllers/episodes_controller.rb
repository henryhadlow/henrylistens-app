class EpisodesController < ApplicationController
  def index
    lat = 47.858205
    lng = 2.294359
    puts "Latitude: #{lat}, longitude: #{lng}"

    # Access foursquare API using latitude and longitude
    url = "https://api.foursquare.com/v2/venues/search
           ?client_id = WU2GPFLW4FXM1M0Z3AACODQNF3BLOCW5B3NYXFRT1LUOQZ4T
           &client_secret = 1LYYB0DHQWNYKJ35NJSYTQRKYBOSYQVJV4RUFBRMOOR1QDSP
           &v=20130815
           &ll=#{lat},#{lng}"
    url.delete!(" ").delete!("\n")
    uri = URI(url)

    # Access the data returned from foursquare
    json = Net::HTTP.get(uri)
    response = JSON.parse(json)

    # f = File.new("output.txt", "w+")
    # f.write response.to_yaml

    venue = response["response"]["venues"][0]
    puts venue["name"]
  end

  def import
  end
end
