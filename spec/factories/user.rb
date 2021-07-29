FactoryBot.define do
  factory :user do
    username              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { 'secret-password' }
    password_confirmation { 'secret-password' }
  end
end
