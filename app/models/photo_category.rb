class PhotoCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :photo
  validates :photo_id, presence: true
  validates :category_id, presence: true
end
