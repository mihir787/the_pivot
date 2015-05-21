class Store < ActiveRecord::Base
  has_attached_file :image, styles: {thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }, default_url: "fork_knife1.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]
  
  has_many :photos
  has_many :order_photos, through: :photos
  has_many :orders, through: :store_orders

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end