class Store < ActiveRecord::Base
  has_many :photos
  has_many :order_photos, through: :photos
  has_many :orders, through: :store_orders

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end