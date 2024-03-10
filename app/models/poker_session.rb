class PokerSession < ApplicationRecord
  extend FriendlyId
  friendly_id :friendly_name, use: :slugged

  has_secure_password

  belongs_to :creator, class_name: "User"

  has_many :poker_session_participants, dependent: :destroy
  has_many :participants, through: :poker_session_participants, source: :user
  has_many :tasks, dependent: :destroy, inverse_of: :poker_session

  validates :name, :estimates, presence: true
  validates :friendly_name, uniqueness: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
