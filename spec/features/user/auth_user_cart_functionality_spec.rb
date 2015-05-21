require "rails_helper"

RSpec.describe "Cart after checkout" do
  it "cart is cleared after checkout" do
    user = create(:default_user)
    store = Store.create(name: "Super")
    5.times do |x|
      create(:photo, title: "photo#{x}", store_id: store.id)
    end
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit photos_path
    click_link "photo1"
    first(:button, "Add To Cart").click
    visit checkout_path
    expect(page).to have_content("photo1")
    click_button "Checkout"
    click_button "Confirm Order"

    visit checkout_path
    expect(page).to_not have_content("photo1")
  end

  it "cart is cleared with muliple photos in the cart" do
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
    visit photos_path
    click_link "photo3"
    first(:button, "Add To Cart").click
    visit checkout_path
    expect(page).to have_content("photo1")
    expect(page).to have_content("photo2")
    expect(page).to have_content("photo3")
    click_button "Checkout"
    click_button "Confirm Order"

    visit checkout_path
    expect(page).to_not have_content("photo1")
    expect(page).to_not have_content("photo2")
    expect(page).to_not have_content("photo3")
  end

end
