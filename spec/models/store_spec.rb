require 'rails_helper'

RSpec.describe "Store", type: :model do 
  
  let(:store) { Store.create(name: "Super store") }
  
  it "is a valid store" do 
    expect(store).to be_valid
  end

  it "is invalid without a name" do 
    store.name = ""
    expect(store).not_to be_valid
  end

  scenario "name must be unique" do 
    store1 = Store.create(name: "XYZ")

    expect(Store.count).to eq(1)

    store2 = Store.create(name: "XYZ")

    expect(Store.count).to eq(1)
  end
end