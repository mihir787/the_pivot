class OrderPhoto < ActiveRecord::Base
  belongs_to :photo
  belongs_to :order
  validates :order_id, presence: true
  validates :photo_id, presence: true
end
