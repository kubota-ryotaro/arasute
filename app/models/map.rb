class Map < ApplicationRecord
  after_validation :geocode

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end

  def self.search(search, category) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータにおいて、titleカラムを部分一致で絞り込む
      search.gsub!('駅', '') if search.include?('駅')
      Map.where('station_name LIKE ? and large_category LIKE ?', "%#{search}%", "%#{category}%")
    else
      Map.all #全て表示。
    end
  end
end
