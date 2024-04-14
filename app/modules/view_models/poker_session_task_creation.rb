module ViewModels
  class PokerSessionTaskCreation
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :description
    attribute :poker_session_id

    validates_presence_of :description, :poker_session_id
  end
end
