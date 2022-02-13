class List < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 150 }
  validates :img, presence: true
  mount_uploader :img, ImgUploader
end
