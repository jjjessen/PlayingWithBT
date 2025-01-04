FactoryBot.define do
  factory :trade do
    association :team
    description { "MyString" }
  end
end
