FactoryBot.define do
  factory :tutor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    active { true }
    association :course, factory: :course
  end
end
