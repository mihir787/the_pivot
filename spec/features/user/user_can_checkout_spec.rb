require "rails_helper"

RSpec.describe "user checkout" do
  context "authenticated user" do

    it "can checkout" do
      user = create(:default_user)
      5.times do |x|
        create(:photo, title: "photo#{x}")
      end

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit photos_path
      click_link "photo1"
      first(:button, "Add To Cart").click

      visit checkout_path

      click_button "Checkout"

      expect(page).to have_content("photo1")
      expect(page).to have_content("Confirm Order")

      click_button "Confirm Order"
      expect(page).to have_content("Would you like to pay now?")
      click_button "No thanks, Ill pay later."
      expect(page).to have_content("Dashboard")
    end

    it "can not checkout without anything in cart" do
      user = create(:default_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit checkout_path

      click_button "Checkout"

      expect(page).to have_content("Reality Check! Cart can't be empty!")
    end
  end
end
