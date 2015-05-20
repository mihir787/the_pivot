require "rails_helper"

RSpec.describe "admin photos" do
  context "when logged in as admin" do
    it "can view list of photos" do
      5.times do |x|
        create(:photo, title: "Photo#{x}")
      end

      admin = create(:admin_user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      within(".admin-links") do
        click_link "All Photos"
      end

      expect(current_path).to eq(admin_photos_path)
      expect(page).to have_content("Photo0")
      expect(page).to have_content("Photo4")
      expect(page).to have_content("Photo3")
      expect(page).to have_content("Photo2")
      expect(page).to have_content("Photo1")
    end
  end
end
