require "rails_helper"

RSpec.describe "admin page" do
 it "shows the status selected" do

   admin = create(:admin_user)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
   store = Store.create(name: "Super")
   5.times do |x|
     create(:photo, title: "photo#{x}", store_id: store.id)
   end

   visit photos_path
   click_link "photo1"
   first(:button, "Add To Cart").click

   visit photos_path
   click_link "photo2"
   first(:button, "Add To Cart").click

   visit checkout_path

   click_button "Checkout"
   click_button "Confirm"

   visit admin_orders_dashboard_path
   select("cancelled", from: "order[filter_status]")

   expect(page).to have_content(10)
 end
end
