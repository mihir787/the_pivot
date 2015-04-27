class Order < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :status, presence: true
  validates :subtotal, presence: true
end
