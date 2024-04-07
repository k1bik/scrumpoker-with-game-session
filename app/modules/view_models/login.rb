module ViewModels
  class Login
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :name
    attribute :password

    attr_accessor :name

    validates_presence_of :name, :password
    validates :name, length: {maximum: User::NAME_LENGTH}
    validates :password, length: {maximum: User::PASSWORD_LENGTH}
  end
end
