require "rails_helper"

RSpec.describe "User view" do
  context 'with valid attributes' do

    it 'can view order page' do
      user = create(:default_user)
      photo = create(:photo, title: "chips")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit photos_path
      click_link "chips"
      first(:button, "Add To Cart").click
      visit checkout_path
      click_button "Checkout"
      click_button "Confirm Order"

      visit user_path(user)
      click_button "Order History"

      expect(page).to have_content("Orders")
      visit user_order_path(photo.orders.first.id)
      expect(page).to have_content("chips")
      expect(page).to have_content("Order Details")
    end

  end
end
