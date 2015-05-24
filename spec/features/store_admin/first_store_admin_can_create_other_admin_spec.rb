require "rails_helper"

RSpec.describe "Store admin can add other store admin" do
  let(:store) {create(:store)}
  let(:first_store_admin) { create(:first_store_admin) }

  it "should should be create another admin" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(first_store_admin)
    visit new_store_admin_path(store: store )

    fill_in "Name", with: "steve"
    fill_in "Email", with: "steve@admin.com"
    fill_in "Username", with: "steve_admin"
    click_link_or_button "Create Store Admin"
    save_and_open_page

    expect(page).to have_content("Store Admin Dashboard - Welcome Mihir Parikh!")

  end
end
