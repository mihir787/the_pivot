require "rails_helper"

RSpec.describe "Admin can add categories to photo" do
  context "by editting the photo" do
    it "categories can be added to an photo" do
      admin = create(:admin_user)
      photo = create(:photo)
      category = create(:category)
      category1 = create(:category1)
      category2 = create(:category2)
      category3 = create(:category3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_photo_path(photo)

      fill_in "Photo title", with: "Edited Photo"
      fill_in "Photo description", with: "Edited Description"
      fill_in "Price", with: 60
      page.check("curries")
      page.check("breakfast")
      click_button "Submit Photo"

      expect(page).to have_content("Edited Photo")
      expect(page).to have_content("curries")
      expect(page).to have_content("breakfast")
    end

  end

end
