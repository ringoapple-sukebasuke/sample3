FactoryBot.define do
  factory :comment do
    body { "MyText" }
    user { nil }
    company { nil }
  end
end
