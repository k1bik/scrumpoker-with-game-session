FactoryBot.define do
  factory :poker_session do
    sequence(:name) { |n| "poker-session-#{n}" }
    password_digest { BCrypt::Password.create("123") }
    estimates { "1,2,3" }
    association :creator, factory: :user
  end
end
