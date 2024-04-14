class ValidatesController < ApplicationController
  def validate_login_form
    @view_model = ViewModels::Login.new(params.to_unsafe_h[:session])
    @view_model.validate

    respond_to do |f|
      f.turbo_stream
    end
  end

  def validate_sign_up_form
    @view_model = ViewModels::SignUp.new(params.to_unsafe_h[:user])
    @view_model.validate

    respond_to do |f|
      f.turbo_stream
    end
  end

  def validate_user_password_form
    @view_model =
      ViewModels::Password.new(
        params.to_unsafe_h[:password].merge(current_password_digest: current_user.password_digest)
      )

    @view_model.validate

    respond_to do |f|
      f.turbo_stream
    end
  end

  def validate_poker_session_creation_form
    @view_model = ViewModels::PokerSessionCreation.new(params.to_unsafe_h[:poker_session].merge(creator: current_user))
    @view_model.validate

    respond_to do |f|
      f.turbo_stream
    end
  end
end
