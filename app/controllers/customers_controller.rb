class CustomersController < ApplicationController

  def index
    @user = current_user
    @customers = @user.customers
  end

  def show
  end

  def new
    @customer = Customer.new
    @customer.contact_persons.build
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      @customer = Customer.new(customer_new)
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :customer_company,
      contact_persons_attributes: [:id, :customer_id, :department, :position, :name]
    ).merge(user_id: current_user.id)
  end

end
