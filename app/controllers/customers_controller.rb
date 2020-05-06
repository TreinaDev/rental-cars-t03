class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def search
    @customers = Customer.search(params[:q])
    render :index
  end
end