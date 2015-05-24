require "rails_helper"

RSpec.describe "First store admin" do
  let(:store) {create(:store)}
  let(:first_store_admin) { create(:first_store_admin) }
  let(:second_store_admin) { create(:second_store_admin) }

  it "can view other store admins" do
    store.users << [first_store_admin, second_store_admin]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(first_store_admin)
    visit new_store_admin_path(store: store )

    fill_in "Name", with: "steve"
    fill_in "Email", with: "steve@admin.com"
    fill_in "Username", with: "steve_admin"
    click_link_or_button "Create Store Admin"

    visit store_admins_path(store: store)

    expect(page).to have_content("Admins List")
    expect(page).to have_content("steve")
  end
end
