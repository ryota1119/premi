class EstimatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @customers = @user.customers
    @estimates = @user.estimates
    
  end

  def show
    @estimate = Estimate.find(params[:id])
    @customer = @estimate.customer
    @contact_person = @estimate.contact_person
    @user = current_user
  end

  def new
    @estimate = EstimateForm.new
    @user = current_user
    # @item = ItemCollection.new
  end

  def create
    @estimate = EstimateForm.new(estimate_params)
    if @estimate.save
      redirect_to estimates_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def estimate_params
    params.require(:estimate_form).permit(
      :company_name, :department, :position, :name, :effective, :item_name, :volume, :price, :note
      ).merge(user_id: current_user.id)
  end
end
