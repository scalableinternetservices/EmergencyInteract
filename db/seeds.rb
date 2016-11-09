
def find_region(lat,long)
  closest = ""
  minDist = 99999
  cities = File.read('public/cities.json')
  citiesMap = JSON.parse(cities)
  citiesMap.each do |city|
    dist = haversineDist(lat,long,city['latitude'],city['longitude'])
    if dist < minDist
      minDist = dist
      closest = city['city']
    end
  end
  closest
end
def haversineDist(lat1,long1,lat2,long2)
  lat1 = lat1*Math::PI/180
  lat2 = lat2*Math::PI/180
  long1 = long1*Math::PI/180
  long2 = long2*Math::PI/180
  (1-Math.cos(lat2-lat1))/2 + Math.cos(lat1)*Math.cos(lat2)*((1-Math.cos(long2-long1))/2)
end





Event.destroy_all

low_lat = 24.0
high_lat = 48.0
start_long = -120.0
end_long = -70.0

delta = (end_long - start_long)/100

100.times do |index|
  long = start_long + index*delta
  lat = rand(low_lat..high_lat)

  Event.create!(title: "event #{index}",
                description: "description #{index}",
                location: find_region(lat,long),
                lat: lat,
                long: long)
end

p "Created #{Event.count} movies"