class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  has_many :photo_categories
  has_many :photos, through: :photo_categories
  extend FriendlyId
  friendly_id :name, use: :slugged

  def can_destroy?
    photos.count < 1
  end
end
