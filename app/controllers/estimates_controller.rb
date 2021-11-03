class EstimatesController < ApplicationController

  def index

  end

  def show
    @estimate = Estimate.find(params[:id])
    @customer = @estimate.customer_id
    @user = current_user

  end

  def new
    @estimate = EstimateForm.new
    @user = current_user
  end

  def create
    @estimate = EstimateForm.new(estimate_params)
    if @estimate.save
      redirect_to root_path
    else
      1 / 0
    end
  end

  private

  def estimate_params
    params.require(:estimate_form).permit(
      :company_name, :department, :position, :name, :effective, :item_name, :volume, :price, :note
      ).merge(user_id: current_user.id)
  end
end
