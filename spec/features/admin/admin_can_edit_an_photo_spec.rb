require "rails_helper"

RSpec.describe "Admin Photos" do
  context "edit photo" do
    it "can edit an photo" do
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

      click_link "Photo1"
      click_link "Edit"

      fill_in "Photo title", with: "Edited Photo"
      fill_in "Photo description", with: "Edited Description"
      fill_in "Price", with: 600
      click_button "Submit Photo"

      expect(page).to have_content("Edited Photo")
      expect(page).to have_content("Edited Description")
      expect(page).to have_content(6)
    end

    it "can not change the photo title to an already existing title" do
      admin = create(:admin_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Photo"

      expect(current_path).to eq(new_admin_photo_path)

      fill_in "Photo title", with: "New Photo"
      fill_in "Photo description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      visit admin_dashboard_path
      click_link "Add New Photo"

      visit admin_dashboard_path
      click_link "Add New Photo"

      expect(current_path).to eq(new_admin_photo_path)

      fill_in "Photo title", with: "New Photo2"
      fill_in "Photo description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      visit admin_photos_path
      click_link "New Photo"
      click_link "Edit"

      fill_in "Photo title", with: "New Photo2"
      fill_in "Photo description", with: "Edited Description"
      fill_in "Price", with: 600
      click_button "Submit Photo"

      expect(page).to have_content("Title has already been taken")
    end
  end
end
