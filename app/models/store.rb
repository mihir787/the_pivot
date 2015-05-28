class Store < ActiveRecord::Base
  has_attached_file :image, styles: {thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }, default_url: "clown_fish_store.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_many :photos
  has_many :order_photos, through: :photos
  has_many :orders, through: :store_orders
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  has_attached_file :image, styles: {thumb: '100x100>',
                                     square: '200x200#',
                                     medium: '300x300>'},
                                     default_url: "clown_fish_store.jpg",
                                     storage: :s3,
                                     bucket: ENV['bucket'],
                                     s3_credentials: { access_key_id: ENV['access_key_id'],
                                               secret_access_key: ENV['secret_access_key'] }

 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
end
