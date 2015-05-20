class Photo < ActiveRecord::Base
  has_attached_file :image, styles: {micro: '50x50',
                                     thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }, default_url: "fork_knife1.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :photo_categories
  has_many :categories, through: :photo_categories
  has_many :order_photos
  has_many :orders, through: :order_photos
  belongs_to :store

  # scope :active, -> { where(status: true) }


  # def show_status
  #   if status == true
  #     "active"
  #   else
  #     "retired"
  #   end
  # end
  #
  # def retired
  #   status == false
  # end
  #
  # def active
  #   status == true
  # end

  def unique_categories
    errors.add :base, "Photo already belongs to that category" if categories.each { |category| categories.include?(category) }
  end

  def empty_categories?
    params[:photo][:category_ids].reject(&:empty?).empty?
  end

  # def modify_status(status_param)
  #   if status_param == "false"
  #     status = false
  #   else
  #     status = true
  #   end
  # end
end
