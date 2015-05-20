require "rails_helper"

RSpec.describe "Admin photos" do

  context "as an admin" do
    it "can create a new photo" do
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
      expect(page).to have_content("curries")
      expect(page).to have_content("breakfast")
      expect(page).to have_content("New Photo")
      expect(page).to have_content("New Description")
      expect(page).to have_content(5)
      visit admin_photos_path

      expect(page).to have_content("New Photo")
    end   

    it "cannot create a new photo with empty title" do
      admin = create(:admin_user)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path
      click_link "Add New Photo"

      expect(current_path).to eq(new_admin_photo_path)

      fill_in "Photo title", with: ""
      fill_in "Photo description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      expect(page).to have_content("Title can't be blank")
    end

    it "can not create the same photo twice" do
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

      expect(current_path).to eq(new_admin_photo_path)

      fill_in "Photo title", with: "New Photo"
      fill_in "Photo description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      expect(page).to have_content("Title has already been taken")
    end

    it "can not create the same photo twice" do
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

      expect(current_path).to eq(new_admin_photo_path)

      fill_in "Photo title", with: "New Photo"
      fill_in "Photo description", with: "New Description"
      fill_in "Price", with: 500
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      expect(page).to have_content("Title has already been taken")
    end
  end
end
