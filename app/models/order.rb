class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  has_many :order_photos
  has_many :photos, through: :order_photos

  validates :user_id, presence: true
  validates :status, presence: true
  validates :subtotal, presence: true


  enum status: %w(pending paid cancelled)

  default_scope { order(created_at: :desc) }

  def self.number_currently_pending
    pending.count
  end

  def self.number_currently_paid
    paid.count
  end

  def self.number_currently_cancelled
    cancelled.count
  end

  def date_of_order(order_created_at)
    order_created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def date_created
    created_at.strftime(" %d %b %Y %l:%M %p")
  end

  def date_updated
    updated_at.strftime(" %d %b %Y %l:%M %p")
  end

  def total
    subtotal
  end

  def show_status
    if status == "paid"
      status
    else
      "#{status} -  updated on: #{self.updated_at.strftime("%A, %d %b %Y %l:%M %p")}"
    end
  end

end
