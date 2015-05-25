require "rails_helper"

RSpec.describe "First store admin" do
  let(:store) {create(:store)}
  let(:first_store_admin) { create(:first_store_admin) }
  let(:second_store_admin) { create(:second_store_admin) }

  it "can view other store admins" do
    store.users << [first_store_admin, second_store_admin]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(first_store_admin)

    visit store_admin_index_path(store: store)
    page.all(:button, "Delete Store Admin").last.click

    expect(page).to have_content("Store admin has been deleted.")
    expect(page).not_to have_content("rex")
  end
end
