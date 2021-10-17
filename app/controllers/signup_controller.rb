class SignupController < ApplicationController

  before_action :save_step1_to_session, only: :step2
  before_action :save_step2_to_session, only: :step3

  def step1
    @user = User.new
    @user.build_company
  end

  def save_step1_to_session
    session[:user_params] = user_params
    session[:company_attributes_after_step1] = user_params[:company_attributes]
    @user = User.new(session[:user_params])
    @user.build_company(session[:company_attributes_after_step1])
    render '/signup/step1' unless @user.valid?
  end 

  def step2
    session[:user_params] = user_params  #userモデルの値をぶっこむ。
    @user = User.new
    @user.build_company
  end

  def create
    @user = User.new(session[:user_params])
    @user.build_company(user_params[:company_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render '/signup/step1'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password, 
      :password_confirmation, 
      company_attributes: [:id, :company_name, :tel, :fax, :postal_code, :address]
    )
  end
end
