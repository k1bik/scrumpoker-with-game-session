class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    current_user = User.first
  end

end
