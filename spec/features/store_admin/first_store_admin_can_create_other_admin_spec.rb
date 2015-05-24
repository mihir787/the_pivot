require "rails_helper"

RSpec.describe "Store admin can add other store admin" do

  let(:admin) { create(:admin) }

  context "only the first store admin can create the other admins" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    end
  end
end
