FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@regalii.com" }
    password "secret123"
  end
end
