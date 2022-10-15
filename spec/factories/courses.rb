FactoryBot.define do
  factory :course do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.paragraph }
  end
end
