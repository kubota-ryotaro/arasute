class Map < ApplicationRecord
  after_validation :geocode
  has_many_attached :images
  # ここで暗黙の関連付けを複数形にしていることに注意
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=#{ENV['GOOGLE_MAPS_API_KEY']}")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end

  # defaltで表示させる内容。
  def self.favorite
    Map.where.not(favorite_flag: nil).order(:favorite_flag)
  end

  # 検索フォームにより絞り込まれた店のデータを出力する。
  def self.search(search, category) # Controllerから渡されたパラメータによって、station_nameとcategoryカラムを部分一致で絞り込む
    if search
      key = ""
      val = ["%#{category}%", "%#{search[0]}%"]
      (search.size - 1).times do |i|
        key += " or station_name LIKE ?"
        val = val.push("%#{search[i+1]}%")
      end
      val = val.unshift("category LIKE ? and (station_name LIKE ?#{key})")
     Map.where(val)
    else
      Map.where("category LIKE ?", "%#{category}%")
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
      val = val.unshift("station_name NOT LIKE ? and category LIKE ? and (station_name LIKE ?#{key})")
      # 駅名とカテゴリで絞り込み、ハッシュで返す。# group byによって、検索された駅の数を調べる。
      Map.select("station_name").where(val).group(:station_name).size
    else
      Map.select("station_name").where("category LIKE ? and station_name NOT LIKE ?", "%#{category}%", "%駅%").group(:station_name).size
    end
  end
end
