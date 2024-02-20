class PokerSession < ApplicationRecord
  has_many :poker_session_participants
  has_many :participants, through: :poker_session_participants, source: :user

  belongs_to :creator, class_name: "User"
end
