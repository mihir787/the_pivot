class Seed

  PICTURES = %w(bag_end wedding_ring wedding_dress flowers_wedding minas_tirith 
                mount_doom_landscape galaxy2 galaxy3 jupiter balloonMoon1 
                dallas_balloon hot_air_balloon new_york koala platapus puppies baby_animals 
                beach1 beach2 beach3 saturn)

  STORE_PHOTOS = %w(clown_fish_store minas_tirith balloonMoon1 dallas_balloon 
                    hot_air_balloon new_york koala platapus puppies baby_animals)

  def call
    generate_roles
    puts "generated roles"
    generate_stores
    puts "generated stores"
    generate_photos
    puts "generated photos"
    generate_default_user
    puts "generated default user"
    generate_orders
    puts "generated orders"
  end

  def self.call
    new.call
  end

  private

  def generate_default_user
    User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password").user_roles.create(role_id: 2)
    User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password").user_roles.create(role_id: 2)
    User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password").user_roles.create(role_id: 2)
    User.create(name: "Store Admin", email: "store+admin@example.com", username: "Store Admin", password: "password", store_id: 1).user_roles.create(role_id: 1)
    User.create(name: "Store Admin 2", email: "store+admin2@example.com", username: "Store Admin2", password: "password", store_id: 2).user_roles.create(role_id: 1)
    User.create(name: "Store Admin 3", email: "store+admin3@example.com", username: "Store Admin3", password: "password", store_id: 3).user_roles.create(role_id: 1)
  end

  def generate_orders
    Order.create!(user_id: 1, subtotal: 12000, status: 2).order_photos.create(photo_id: 1)
    Order.create!(user_id: 1, subtotal: 12000, status: 0).order_photos.create(photo_id: 1)
    Order.create(user_id: 1, subtotal: 12000, status: 1).order_photos.create(photo_id: 1)
    Order.create(user_id: 1, subtotal: 12000, status: 0).order_photos.create(photo_id: 1)
    Order.create(user_id: 1, subtotal: 12000, status: 1).order_photos.create(photo_id: 2)
    Order.create(user_id: 2, subtotal: 12000, status: 0).order_photos.create(photo_id: 2)
    Order.create(user_id: 2, subtotal: 12000, status: 1).order_photos.create(photo_id: 2)
    Order.create(user_id: 2, subtotal: 12000, status: 1).order_photos.create(photo_id: 2)
    Order.create(user_id: 2, subtotal: 12000, status: 1).order_photos.create(photo_id: 3)
    Order.create(user_id: 2, subtotal: 12000, status: 1).order_photos.create(photo_id: 3)
    Order.create(user_id: 3, subtotal: 12000, status: 2).order_photos.create(photo_id: 5)
    Order.create(user_id: 3, subtotal: 12000, status: 0).order_photos.create(photo_id: 6)
    Order.create(user_id: 1, subtotal: 12000, status: 0).order_photos.create(photo_id: 6)
    Order.create(user_id: 1, subtotal: 12000, status: 0).order_photos.create(photo_id: 6)
    Order.create(user_id: 2, subtotal: 12000, status: 0).order_photos.create(photo_id: 6)
    Order.create(user_id: 1, subtotal: 12000, status: 2).order_photos.create(photo_id: 7)
    Order.create(user_id: 3, subtotal: 12000, status: 1).order_photos.create(photo_id: 7)
    Order.create(user_id: 3, subtotal: 12000, status: 2).order_photos.create(photo_id: 8)
    Order.create(user_id: 3, subtotal: 12000, status: 2).order_photos.create(photo_id: 8)
  end

  def generate_roles
    Role.create(name: "store_admin")
    Role.create(name: "registered_user")
  end

  def generate_stores
    10.times do
      Store.create!(name: Faker::Company.name,
                    description: Faker::Lorem.sentence, 
                    image: File.open("#{Rails.root}/app/assets/images/#{STORE_PHOTOS.sample}.jpg")
                    )
    end
  end

  def generate_photos
    50.times do |i|
      picture = PICTURES.sample
      photo = Photo.create(title: Faker::Commerce.product_name, 
                           description: Faker::Lorem.sentence, 
                           price: Faker::Commerce.price * 100, 
                           image: File.open("#{Rails.root}/app/assets/images/#{picture}.jpg"),
                           store_id: (1..10).to_a.sample
                           )
    end
  end
end

Seed.call