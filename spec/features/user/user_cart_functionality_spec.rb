require "rails_helper"

RSpec.describe "checkout" do
  context "as an authenticated user" do
    it "can add photos to the cart" do
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      5.times do |x|
        create(:photo, title: "Photo#{x}", description: "Description #{x}")
      end

      user = create(:default_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit photos_path

      click_link "Photo1"
      first(:button, "Add To Cart").click

      visit checkout_path

      visit photos_path

      click_link "Photo2"
      first(:button, "Add To Cart").click

      visit checkout_path
      expect(page).to have_content("Photo1")
      expect(page).to have_content("Photo2")
      expect(page).to have_content(10)
    end
  end
end
