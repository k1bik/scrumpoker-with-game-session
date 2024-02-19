class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: session_params[:name])&.authenticate(session_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      @invalid_password = true
      @name = session_params[:name]
      render :new
      return
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
