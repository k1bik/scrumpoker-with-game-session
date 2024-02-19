class UsersController < ApplicationController
  before_action :authenticate_user

  def new
    @user = User.new
  end

  def show; end

  def create
    return if params[:user][:password] != params[:user][:password_confirmation]

    @user = User.new(name: params[:user][:name], password: params[:user][:password])

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end
