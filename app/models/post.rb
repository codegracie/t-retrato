class Post < ApplicationRecord
  validates_presence_of :title, :image

  mount_uploader :image, PhotoUploader
end
