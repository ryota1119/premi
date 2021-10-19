class CustomersController < ApplicationController

  def index
    @user = current_user
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
    @contact_person = @customer.contact_person.build
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      @customer = Customer.new(customer_params)
      render new
    end
  end

  private
  def customer_params
    params.require(:customer).permit(
      :customer_company,
      contact_people_attribute: [:id, :department, :position, :name]
    )
  end
end
