module ViewObjects
  class Login
    include ActiveModel::Model

    attr_accessor :name, :password

    validates_presence_of :name, :password
    validates :name, length: {maximum: User::NAME_LENGTH}
    validates :password, length: {maximum: User::PASSWORD_LENGTH}
  end
end
