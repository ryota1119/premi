class EstimatesController < ApplicationController

  def index
  end

  def new
    @estimate = Estimate.new()
  end

  def create
    
  end

  private

  def estimate_params
    params.require(:estimate).permit(
      :effective,
      :note,
      customer_attributes: [:id, :customer_company],
      contact_people_attributes: [:id, :department, :position, :name, :customer_id]
    )
  end
end
