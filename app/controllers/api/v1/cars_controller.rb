class Api::V1::CarsController < ActionController::API
  def index
    @cars = Car.all

    render json: @cars
  end

  def show
    @car = Car.find(params[:id])
    render json: @car
  rescue ActiveRecord::RecordNotFound # Ruby Error Handling
    render status: 404, json: ''
  end
end