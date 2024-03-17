module ViewObjects
  class SignUp
    include ActiveModel::Model

    attr_accessor :name, :password, :password_confirmation

    validates_presence_of :name, :password, :password_confirmation
    validates :name, length: {maximum: User::NAME_LENGTH}
    validates :password, length: {maximum: User::PASSWORD_LENGTH}
    validates :password_confirmation, length: {maximum: User::PASSWORD_LENGTH}
    validate :validate_password_matches_confirmation

    private

    def validate_password_matches_confirmation
      unless password == password_confirmation
        errors.add(:password_confirmation, I18n.t("errors.entities.password.password_confirmation_mismatch"))
      end
    end
  end
end
