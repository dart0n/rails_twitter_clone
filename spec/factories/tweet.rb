FactoryBot.define do
  factory :tweet do
    text { Faker::String.random(length: 3..140) }
    user
  end
end
