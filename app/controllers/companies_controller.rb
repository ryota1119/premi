class CompaniesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_company

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_company_path
    end
  end

  private

  def set_company
    @user = current_user
    @company = @user.company
  end

  def company_params
    params.require(:company).permit(:name, :tel, :fax, :postal_code, :address)
  end
end
