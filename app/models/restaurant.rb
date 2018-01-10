class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader

  belongs_to :category, optional: true
  delegate :name, to: :category, prefix: true, allow_nil: true

  has_many :comments, dependent: :destroy   #以後刪除 Restaurant 時，就可以一併刪掉關聯的評論

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

end
