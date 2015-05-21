require "rails_helper"

RSpec.describe 'Users' do
  context 'all users' do
    it "can remove cart photo" do
      user = create(:default_user)
      store = Store.create(name: "Super")
      5.times do |x|
        create(:photo, title: "photo#{x}", store_id: store.id)
      end
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit photos_path
      click_link "photo1"
      first(:button, "Add To Cart").click
      visit photos_path
      click_link "photo2"
      first(:button, "Add To Cart").click
      visit checkout_path
      first(:button, "Remove").click

      expect(page).to_not have_content('photo1')
      expect(page).to have_content('photo2')
    end
  end
end