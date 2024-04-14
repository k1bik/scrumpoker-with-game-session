class PasswordsController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def update
    @view_model =
      ViewModels::Password.new(password_params.merge(current_password_digest: current_user.password_digest))

    if @view_model.valid?
      current_user.update!(password_digest: @view_model.bcrypt_password)
      redirect_to user_path, turbo_frame: "_top", notice: "Password updated successfully"
    else
      render :new
    end
  end

  private def password_params
    params.require(:password).permit(:old_password, :new_password, :new_password_confirmation)
  end
end
