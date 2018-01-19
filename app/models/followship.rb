class Followship < ApplicationRecord
  # 使用 :class_name 告知對應的 Model 名稱
  belongs_to :user
  belongs_to :following, class_name: "User"
end
