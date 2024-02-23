class Password
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :old_password, :new_password, :new_password_confirmation, :current_password_digest

  validates_presence_of :old_password, :new_password, :new_password_confirmation, :current_password_digest
  validate :validate_old_password_matches_current, :validate_new_password_matches_confirmation

  def bcrypt_password
    BCrypt::Password.create(new_password)
  end

  private

  def validate_old_password_matches_current
    unless BCrypt::Password.new(current_password_digest) == old_password
      errors.add(:old_password, I18n.t("errors.entities.password.current_password_mismatch"))
    end
  end

  def validate_new_password_matches_confirmation
    unless new_password == new_password_confirmation
      errors.add(:new_password_confirmation, I18n.t("errors.entities.password.new_password_confirmation_mismatch"))
    end
  end
end
