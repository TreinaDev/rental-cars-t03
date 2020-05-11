class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def search
    @customers = Customer.search(params[:q])
    render :index
  end
end