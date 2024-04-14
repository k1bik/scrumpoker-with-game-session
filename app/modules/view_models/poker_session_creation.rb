module ViewModels
  class PokerSessionCreation
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name
    attribute :password
    attribute :estimates
    attribute :creator
    attribute :friendly_name

    validates_presence_of :name, :password, :estimates, :creator, :friendly_name
  end
end
