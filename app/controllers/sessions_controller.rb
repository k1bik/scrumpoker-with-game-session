class SessionsController < ApplicationController
  def new
    @view_model = ViewModels::Login.new
  end

  def create
    @view_model = ViewModels::Login.new(session_params)

    if @view_model.valid?
      user = User.find_by(name: @view_model.name)&.authenticate(@view_model.password)

      if user
        session[:user_id] = user.id
        redirect_to root_path, turbo_frame: "_top", notice: "Successfully logged in"
      else
        @view_model.errors.add(:password, "wrong")
        render :new, status: :unprocessable_entity
      end
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

  private def session_params
    params.require(:session).permit(:name, :password)
  end
end
