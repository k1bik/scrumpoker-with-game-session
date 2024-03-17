class ValidatesController < ApplicationController
  def validate_login_form
    @view_object = ViewObjects::Login.new(params.to_unsafe_h[:session])
    @view_object.validate

    respond_to do |format|
      format.turbo_stream
    end
  end

  def validate_sign_up_form
    @view_object = ViewObjects::SignUp.new(params.to_unsafe_h[:user])
    @view_object.validate

    respond_to do |format|
      format.turbo_stream
    end
  end

  def validate_user_password_form
    @view_object =
      ViewObjects::Password.new(
        params.to_unsafe_h[:password].merge(current_password_digest: current_user.password_digest)
      )

    @view_object.validate

    respond_to do |format|
      format.turbo_stream
    end
  end
end
