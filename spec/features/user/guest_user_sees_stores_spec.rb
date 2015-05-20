require 'rails_helper'

RSpec.describe "user can view stores index" do
  it "user sees stores index" do
    default_user = create(:default_user)
    store = Store.create(name: "Super Store")
    photo = create(:photo)
    store.photos << [photo]

    visit root_path

    expect(page).to have_content("Super Store")
  end
end