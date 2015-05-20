require 'rails_helper'

describe OrderPhoto do

  it {should validate_presence_of :photo_id}
  it {should validate_presence_of :order_id}
end
