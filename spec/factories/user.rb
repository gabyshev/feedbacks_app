FactoryGirl.define do
  factory :user do
    name 'Isaac'
    sequence(:email) { |n| "email_#{n}@test.com" }
    password '123123'
  end
end
