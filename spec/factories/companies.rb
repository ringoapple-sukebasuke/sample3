FactoryBot.define do
  factory :company do
    number { 1 }
    name { "MyString" }
    information { "MyText" }
    association :owner
  end
end
