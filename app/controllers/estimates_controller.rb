class EstimatesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @company = 
    @customers = @user.customers
    @estimates = @user.estimates.order("created_at DESC")
    
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
  end
  def create
    @estimate = EstimateForm.new(estimate_params)
    if @estimate.save
      redirect_to estimates_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    # @estimate = EstimateForm.find()
    # @user = current_user
  end
  def update
    # @estimate = EstimateForm.new(estimate_params, @estimate)
  end
  private
  def estimate_params
    params.require(:estimate_form).permit(
  :company_name, :department, :position, :name, :effective, :note, items: [:item_name, :volume, :price]
      ).merge(user_id: current_user.id)
  end
end
