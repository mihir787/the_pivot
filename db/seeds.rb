User.create(name: "Rachel Warbelow", email: "demo+rachel@jumpstartlab.com", password: "password")
User.create(name: "Jeff Casimir", email: "demo+jeff@jumpstartlab.com", username: "j3", password: "password")
User.create(name: "Jorge Talez", email: "demo+jorge@jumpstartlab.com", username: "novohispano", password: "password")
User.create(name: "Josh Cheek", email: "demo+josh@jumpstartlab.com", username: "josh", password: "password", role: 1)
User.create(name: "Admin Admin", email: "admin@example.com", username: "ADMIN", password: "password", role: 1)

store1 = Store.create(name: "Tess's fish shop", image: open('app/assets/images/clown_fish_store.jpg'))
store2 = Store.create(name: "Mihir's wedding shop", image: open('app/assets/images/red_shoes_wedding.jpeg'))
store3 = Store.create(name: "Jack's landscape shop", image: open('app/assets/images/landscape_shop.jpeg'))

User.create(name: "Store Admin", email: "store+admin@example.com", username: "Store Admin", password: "password", role: 2, store_id: 1)

store1.photos.create(title: "Coral Reefs", description: "A beautiful coral reef", price: 12000, image: open('app/assets/images/coral_fish_store.jpeg'))
store1.photos.create(title: "Starfish", description: "Panko crusted - Head On - Deep fried prawns.", price: 15000, image: open('app/assets/images/starfish_fish_store.jpeg'))
store1.photos.create(title: "Jellyfish", description: "Served with spicy soy-sauce and squid ink -O- the day.", price: 2000, image: open('app/assets/images/jellyfish_fish_store.jpg'))
store2.photos.create(title: "Wedding Dress on Stairs", description: "Bacon ipsum dolor amet corned beef salami jerky pork boudin kevin frankfurter brisket.", price: 5000, image: open('app/assets/images/wedding_dress.jpg'))
store2.photos.create(title: "Wedding Flowers", description: "Turducken swine ham venison boudin. Biltong ham swine porchetta meatloaf strip steak.", price: 7000, image: open('app/assets/images/flowers_wedding.jpg'))
store2.photos.create(title: "Wedding Ring", description: "You don't think you should... But you should. And will", price: 1000, image: open('app/assets/images/wedding_ring.jpg'))
store3.photos.create(title: "Mount Doom", description: "Where are the eagles?! in this stunning photo", price: 5000, image: open('app/assets/images/mount_doom_landscape.jpg'))
store3.photos.create(title: "Minas Tirith", description: "When the Enemy began to take shape again, Minas Anor was renamed Minas Tirith, the 'Tower of Guard.' The city was also called The White City, as the courtyard in the front of the city's Citadel contained the White Tree, and was also known as the City of Kings because of its connection with the kings and stewards of Gondor (who ruled the kingdom of Gondor from the Citadel of the city).", price: 2000, image: open('app/assets/images/minas_tirith.jpg'))
store3.photos.create(title: "Bag End", description: "Great journeys begin here", price: 8000, image: open('app/assets/images/bag_end.png'))

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
Order.create(user_id: 4, subtotal: 12000, status: 0).order_photos.create(photo_id: 6)
Order.create(user_id: 4, subtotal: 12000, status: 2).order_photos.create(photo_id: 7)
Order.create(user_id: 4, subtotal: 12000, status: 1).order_photos.create(photo_id: 7)
Order.create(user_id: 3, subtotal: 12000, status: 2).order_photos.create(photo_id: 8)
Order.create(user_id: 3, subtotal: 12000, status: 2).order_photos.create(photo_id: 8)
