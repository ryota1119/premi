class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  
  def show
    @user = User.find(params[:id])
    @company = @user.company
    @estimates = @user.estimates.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

end
