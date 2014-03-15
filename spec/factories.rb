FactoryGirl.define do
  factory :user do
    name                  "Example User"
    email                 "tester@example.com"
    studio_id	            1
    ayurveda_id           1
    password              "foobar"
    password_confirmation "foobar"
    aliment               "This is a sample aliment for a user"
    allergy               "This is a sample allergy for a user"
    phone                 "1234567890"

    factory :admin do
      admin true
    end
  end
end