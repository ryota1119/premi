class UsersController < ApplicationController

  def index
  end
  
  def show
    @user = User.find(params[:id])
    @company = @user.company
  end

  def edit
  end
end
