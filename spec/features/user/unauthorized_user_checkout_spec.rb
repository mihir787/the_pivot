require "rails_helper"

RSpec.describe "unauthorized user" do
  context "checkout" do

    it "can login and checkout" do
      store = Store.create(name: "Super")
      5.times do |x|
        create(:photo, title: "photo#{x}", store_id: store.id)
      end

      visit photos_path
      click_link "photo1"
      first(:button, "Add To Cart").click

      visit checkout_path

      click_button "Checkout"
      expect(current_path).to eq(new_user_path)

      fill_in "Name", with: "David"
      fill_in "Username", with: "davy"
      fill_in "Email", with: "david@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"

      visit checkout_path

      click_button "Checkout"


      expect(page).to have_content("photo1")
      expect(page).to have_content("Confirm Order")

      click_button "Confirm Order"
    end
  end
end
