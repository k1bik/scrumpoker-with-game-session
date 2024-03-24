class SessionsController < ApplicationController
  def new
  end

  def create
    @view_object = ViewObjects::Login.new(session_params)

    if @view_object.valid?
      user = User.find_by(name: @view_object.name)&.authenticate(@view_object.password)

      if user
        session[:user_id] = user.id
        flash[:notice] = "Successfully logged in"
        redirect_to root_path
      else
        @view_object.errors.add(:password, "Invalid password or login")
        render :new
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
