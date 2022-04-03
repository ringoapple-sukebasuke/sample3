FactoryBot.define do
  factory :company do
    number { 1 }
    name { "MyString" }
    total { 1 }
    dividend { 1.0}
    information { "MyText" }
    association :owner
  end
end
