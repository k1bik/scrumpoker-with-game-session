class PasswordsController < ApplicationController
  before_action :authenticate_user

  def new
  end

  def update
    @password = Password.new(password_params.merge(current_password_digest: current_user.password_digest))

    if @password.valid?
      current_user.update!(password_digest: @password.bcrypt_password)
      flash[:notice] = "Password updated successfully"
      redirect_to user_path
    else
      flash.now[:alert] = "Password not successfully"
      render :new
    end
  end

  def validate
    @password = Password.new(password_params.merge(current_password_digest: current_user.password_digest))
    @password.validate

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def password_params
    params.require(:password).permit(:old_password, :new_password, :new_password_confirmation)
  end
end
