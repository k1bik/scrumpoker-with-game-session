class Game < ApplicationRecord
  has_many :game_participants
  has_many :participants, through: :game_participants, source: :user

  belongs_to :creator, class_name: "User"
end
