class PasswordsController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def update
    @view_object =
      ViewObjects::Password.new(password_params.merge(current_password_digest: current_user.password_digest))

    if @view_object.valid?
      current_user.update!(password_digest: @view_object.bcrypt_password)
      flash[:notice] = "Password updated successfully"
      redirect_to user_path
    else
      render :new
    end
  end

  private def password_params
    params.require(:password).permit(:old_password, :new_password, :new_password_confirmation)
  end
end
