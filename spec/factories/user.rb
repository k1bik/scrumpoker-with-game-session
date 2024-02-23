FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    password_digest { BCrypt::Password.create("123") }
  end
end
