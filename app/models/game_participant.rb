class GameParticipant < ApplicationRecord
  belongs_to :user
  belongs_to :game

  has_one :participant_estimate
end
