require 'csv'
csv = CSV.read('db/fixtures/development/002_maps.csv')
csv.each do |maps|
  Map.seed do |s|
    s.id = maps[0]
    s.station_name = maps[1]
    s.large_category = maps[2]
    s.small_category = maps[3]
    s.store_name = maps[4]
    s.address = maps[5]
    s.latitude = maps[6]
    s.longitude = maps[7]
    s.business_hours = maps[8]
    s.regular_holiday = maps[9]
  end
end
