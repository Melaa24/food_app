FactoryGirl.define do
  factory :user do
    name     "Deborah Mugherini"
    email    "deb@example.com"
    studio	 "Yoga Now"
    ayurveda "Dr. Feel Good"
    password "foobar"
    password_confirmation "foobar"
  end
end