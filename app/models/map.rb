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

  # 検索フォームにより絞り込まれた店のデータを出力する。
  def self.search(search, category) # Controllerから渡されたパラメータによって、station_nameとlarge_categoryカラムを部分一致で絞り込む
    if search
      key = ""
      val = ["%#{category}%", "%#{search[0]}%"]
      (search.size - 1).times do |i|
        key += " or station_name LIKE ?"
        val = val.push("%#{search[i+1]}%")
      end
      val = val.unshift("large_category LIKE ? and (station_name LIKE ?#{key})")
     Map.where(val)
    else
      Map.where("large_category LIKE ?", "%#{category}%")
    end
  end

  # 検索フォームにより絞り込まれた駅のデータを出力する。
  def self.station_num(search, category) # Controllerから渡されたパラメータによって、検索された駅の数を調べる。
    if search
      key = ""
      val = ["%駅%", "%#{category}%", "%#{search[0]}%"]
      (search.size - 1).times do |i|
        key += " or station_name LIKE ?"
        val = val.push("%#{search[i+1]}%")
      end
      val = val.unshift("station_name NOT LIKE ? and large_category LIKE ? and (station_name LIKE ?#{key})")
      # 駅名とカテゴリで絞り込み、ハッシュで返す。# group byによって、検索された駅の数を調べる。
      Map.select("station_name").where(val).group(:station_name).size
    else
      Map.select("station_name").where("large_category LIKE ? and station_name NOT LIKE ?", "%#{category}%", "%駅%").group(:station_name).size
    end
  end
end
