FactoryBot.define do
  factory :user do
    username { 'nao' }
    email { Faker::Internet.free_email }
    password { 'sample2021' }
    password_confirmation { password }
  end
end
