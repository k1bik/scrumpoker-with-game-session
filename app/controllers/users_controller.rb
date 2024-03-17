class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :new]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @view_object = ViewObjects::SignUp.new(user_params)

    if @view_object.invalid?
      render :new
      return
    end

    @user = User.new(name: @view_object.name, password: @view_object.password)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully account created"
      redirect_to root_path
    else
      render :new
    end
  end

  private def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
