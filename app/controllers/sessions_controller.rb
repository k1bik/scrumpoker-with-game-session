class SessionsController < ApplicationController
  def new; end

  # def create
  #   user = User.find_by(nickname: session_params[:nickname])&.authenticate(session_params[:password])

  #   unless user
  #     @invalid_password = true
  #     @nickname = session_params[:nickname]
  #     render :new
  #     return
  #   end

  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end

  # def destroy
  #   session.delete(:user_id)
  #   redirect_to root_path
  # end

  # private

  # def session_params
  #   params.require(:session).permit(:nickname, :password)
  # end
end
