FactoryGirl.define do
  factory :default_user, class: User do
    name      "John Doe"
    username  "JDoe"
    email     "johndoe@example.com"
    password  "password"
    role      0
  end

  factory :admin_user, class: User do
    name      "Jane Doe"
    username  "JaneDoe"
    email     "janedoe@example.com"
    password  "password"
    role      1
  end

  factory :first_store_admin, class: User do
    name      "Mihir Parikh"
    username  "Mihir"
    email     "mihir@example.com"
    password  "password"
    role      2
  end

  factory :second_store_admin, class: User do
    name      "rex"
    username  "rexcool"
    email     "rex@example.com"
    password  "password"
    role      2
  end

  factory :third_store_admin, class: User do
    name      "phillip"
    username  "phillipcool"
    email     "phillip@example.com"
    password  "password"
    role      2
  end
end
