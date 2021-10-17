class CompaniesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @user = current_user
    @company = @user.company
  end
end
