class RentalsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
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

  def search
    @q = params[:q]
    @rental = Rental.find_by(code: @q.upcase)
    # if @rental.blank? || params[:q].blank?
    #   @rentals = Rental.all
    #   flash.now[:alert] = "Nenhum resultado encontrado para: #{@q}"
    #   render :index
    # end
  end
end