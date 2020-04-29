class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @customers = Customer.all
    @car_categories = CarCategory.all
  end

  def create
    @rental = Rental.create(params.require(:rental).permit(:start_date, 
                                                           :end_date,
                                                           :customer_id,
                                                           :car_category_id))
    redirect_to rentals_path
  end
end