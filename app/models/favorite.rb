class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, counter_cache: true
  # counter_cache 可以自動回傳 size 方法結果，計算關聯物件的數量
end
