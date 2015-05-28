class StoreOrder < ActiveRecord::Base
  belongs_to :store
  belongs_to :order

  validates :store_id, presence: true
  validates :order_id, presence: true
end
