FactoryGirl.define do
  factory :user do
    name                  "Example User"
    email                 "tester@example.com"
    studio_id	            2
    ayurveda_id           3
    password              "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end