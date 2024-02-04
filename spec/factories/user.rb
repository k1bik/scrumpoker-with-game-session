FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "user-#{n}" }
    password_digest { "123" }
  end
end
