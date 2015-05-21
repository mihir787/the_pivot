FactoryGirl.define do
  factory :photo do
    title "photo name"
    description "yummy"
    price        5

    factory :photo_with_categories do
       after(:create) do |photo, evaluator|
        category = create(:category)
        photo.photo_categories.create(category: category)
      end
    end
  end
end
