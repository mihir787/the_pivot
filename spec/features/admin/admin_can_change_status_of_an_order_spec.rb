require "rails_helper"

RSpec.describe "Admin" do
  context "when viewing orders" do
    it "can change status of an individual order" do

      admin = create(:admin_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      5.times do |x|
        create(:photo, title: "photo#{x}")
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

      first(:link, 1).click
      click_link("Completed")

      expect(page).to have_content("Current Status: completed")
    end
  end
end
