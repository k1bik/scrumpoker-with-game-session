class Task < ApplicationRecord
  belongs_to :poker_session, inverse_of: :tasks

  validates :description, presence: true
end
