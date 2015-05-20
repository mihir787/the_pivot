require 'rails_helper'

describe PhotoCategory do
  it { should validate_presence_of :category_id}
  it { should validate_presence_of :photo_id}
end
