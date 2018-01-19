class Followship < ApplicationRecord
  # 確保特定user_id下，只能有一個followings_id
  validates :following_id, uniqueness: {scope: :user_id}

  # 使用 :class_name 告知對應的 Model 名稱
  belongs_to :user
  belongs_to :following, class_name: "User"
end
