class User < ApplicationRecord
  has_secure_password

  NAME_LENGTH = 25

  has_many :created_poker_sessions, class_name: "PokerSession", foreign_key: :creator_id
  has_many :poker_session_participants
  has_many :poker_sessions, through: :poker_session_participants, source: :poker_session

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: NAME_LENGTH}
end
