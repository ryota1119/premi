class SignupController < ApplicationController

  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def step1
    @user = User.new
    @user.build_company
  end

  def save_step1_to_session
    session[:user_params] = user_params
    @user = User.new(session[:user_params])
    render '/signup/step1' unless @user.valid?
  end 

  def step2
    session[:user_params] = user_params
    @user = User.new
    @user.build_company
  end

  def create
    @user = User.new(session[:user_params])
    @user.build_company(user_params[:companies_attributes])
    if @user.save
      session[:id] = @user.id
      sign_in @user
      redirect_to root_path
    else
      @user.build_company(user_params[:companies_attributes])
      render '/signup/step2'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password, 
      :password_confirmation, 
      companies_attributes: [:id, :company_name, :tel, :fax, :postal_code, :address]
    )
  end
end
