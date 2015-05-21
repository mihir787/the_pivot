FactoryGirl.define do
  factory :photo do
    title "photo name"
    description "yummy"
    price        5
    store_id Store.create(name: "Super").id


    factory :photo_with_categories do
       after(:create) do |photo, evaluator|
        category = create(:category)
        photo.photo_categories.create(category: category)
      end
    end
  end
end
