FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    studio_id	            1
    ayurveda_id           1
    password              "foobar"
    password_confirmation "foobar"
    aliment               "This is a sample aliment for a user"
    allergy               "This is a sample allergy for a user"
    phone                 "1234567890"
  end

  factory :admin, :parent => :user do
      admin true
  end

  factory :studio do
    name                "Example Studio"
  end

  factory :ayurveda do
    name                "Example Ayurveda"
  end

  factory :post do
    title "Lorem ipsum"
    content "Lorem ipsum"
    user
  end
end