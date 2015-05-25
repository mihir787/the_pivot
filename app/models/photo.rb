class Photo < ActiveRecord::Base
  has_attached_file :image, styles: {thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }, default_url: "fork_knife1.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :order_photos
  has_many :orders, through: :order_photos
  belongs_to :store
end
