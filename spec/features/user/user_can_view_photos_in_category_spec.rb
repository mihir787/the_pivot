require 'rails_helper'

RSpec.describe "user can view photos in category" do

  it "can view photos in a corresponding category" do
    default_user = create(:default_user)
    photo = create(:photo)
    photo1 = Photo.create(title: "wings", description: "good food", price: 11)
    category = create(:category)

    category.photos << [photo, photo1]

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

    visit category_path(category)

    expect(page).to have_content(photo.title)
    expect(page).to have_content(photo.description)
    expect(page).to have_content(photo1.title)
    expect(page).to have_content(photo1.description)
  end
end
