FactoryGirl.define do
  factory :user do
    name     "Example User"
    email    "tester@example.com"
    studio	 "Yoga Now"
    ayurveda "Dr. Feel Good"
    password "foobar"
    password_confirmation "foobar"
  end
end