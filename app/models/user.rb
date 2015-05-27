class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :picture, styles: {micro: '50x50',
                                       thumb: '100x100',
                                       small: '200x200',
                                       medium: '300x300'
                                     }, default_url: "Hipster_with_glasses.jpg"

  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]

  belongs_to :store
  has_many :orders, dependent: :destroy
  has_many :paid_orders, ->{paid}, class_name: "Order"
  has_many :photos, through: :paid_orders
  has_many :user_roles
  has_many :roles, through: :user_roles
  validates :name, length: { in: 2..32 }
  validates :username, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_attached_file :picture, styles: {thumb: '100x100>',
                                     square: '200x200#',
                                     medium: '300x300>'},
                                     default_url: "Hipster_with_glasses.jpg",
                                     storage: :s3,
                                     bucket: ENV['bucket'],
                                     s3_credentials: { access_key_id: ENV['access_key_id'],
                                               secret_access_key: ENV['secret_access_key'] }

 validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.find_or_create_by_auth(auth_data)
    user = User.find_or_create_by(id: auth_data['uid'][1..3])
    if user.name != auth_data["info"]["name"]
      user.name = auth_data["info"]["name"]
      user.username = auth_data["info"]["nickname"]
      user.email = "temp_email#{auth_data['uid']}@example.com"
      user.password = "temporarypassword"
      user.save
    end
    user
  end

  def platform_admin?
    roles.exists?(name: 'platform_admin')
  end

  def store_admin?(store_id = nil)
    if store_id
      roles.exists?(name: 'store_admin') && store.id == store_id.to_i
    else
      roles.exists?(name: 'store_admin')
    end
  end

  def registered_user?
    roles.exists?(name: 'registered_user')
  end
end
