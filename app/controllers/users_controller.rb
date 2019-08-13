class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @user = current_user
    puts @user.id
  end


end
