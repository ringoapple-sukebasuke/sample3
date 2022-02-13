FactoryBot.define do
  factory :user do
    name { "ringo" }
    sequence(:email) { |n| "ringo#{n}@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end
