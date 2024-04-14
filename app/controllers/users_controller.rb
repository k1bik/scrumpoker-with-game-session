class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :new]

  def new
    @view_model = ViewModels::SignUp.new
  end

  def show
  end

  def create
    @view_model = ViewModels::SignUp.new(user_params)

    if @view_model.valid?
      @user = User.create!(name: @view_model.name, password: @view_model.password)

      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully account created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
