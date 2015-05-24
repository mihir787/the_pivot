require "rails_helper"

RSpec.describe "Store admin can add other store admin" do
  let(:store) {create(:store)}
  let(:first_store_admin) { create(:first_store_admin) }
  let(:second_store_admin) { create(:second_store_admin) }

  it "first admin should be able to create another admin" do
    store.users << first_store_admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(first_store_admin)
    visit new_store_admin_path(store: store )

    fill_in "Name", with: "steve"
    fill_in "Email", with: "steve@admin.com"
    fill_in "Username", with: "steve_admin"
    click_link_or_button "Create Store Admin"

    expect(page).to have_content("Store Admin Dashboard - Welcome Mihir Parikh!")
    expect(page).to have_content("New store admin has been created.")

  end

  it "second admin should not be able to create another store admin" do
    store.users << [first_store_admin, second_store_admin]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(second_store_admin)
    visit new_store_admin_path(store: store )

    fill_in "Name", with: "steve"
    fill_in "Email", with: "steve@admin.com"
    fill_in "Username", with: "steve_admin"
    click_link_or_button "Create Store Admin"

    expect(page).to have_content("You do not have proper admin credentials to perform this action.")

  end

end
