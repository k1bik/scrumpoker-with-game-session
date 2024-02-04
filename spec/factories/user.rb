FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    password_digest { "123" }
  end
end
