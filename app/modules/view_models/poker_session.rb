module ViewModels
  class PokerSession
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name
    attribute :password
    attribute :estimates

    validates_presence_of :name, :password, :estimates
  end
end
