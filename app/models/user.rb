class User < ApplicationRecord
  has_secure_password

  NAME_LENGTH = 30
  PASSWORD_LENGTH = 30

  has_many :created_poker_sessions, class_name: "PokerSession", foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :poker_session_participants, dependent: :destroy
  has_many :poker_sessions, through: :poker_session_participants, source: :poker_session, dependent: :destroy

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: NAME_LENGTH}
  validates :password, length: {maximum: PASSWORD_LENGTH}
end
