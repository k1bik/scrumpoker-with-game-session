class PokerSession < ApplicationRecord
  has_secure_password

  has_many :poker_session_participants, dependent: :destroy
  has_many :participants, through: :poker_session_participants, source: :user

  belongs_to :creator, class_name: "User"
end
