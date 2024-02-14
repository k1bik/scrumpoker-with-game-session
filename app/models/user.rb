class User < ApplicationRecord
  has_secure_password

  has_many :created_games, class_name: "Game", foreign_key: :creator_id
  has_many :game_participants
  has_many :games, through: :game_participants, source: :game

  NAME_LENGTH = 25

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
  validates :name, length: {maximum: NAME_LENGTH}
end
