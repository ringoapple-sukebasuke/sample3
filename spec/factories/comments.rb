FactoryBot.define do
  factory :comment do
    body { "MyText" }
    association :company
    association :user
  end
end
