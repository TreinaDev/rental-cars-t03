class Api::V1::CarsController < ActionController::API
  def index
    @cars = Car.all

    render json: @cars
  end
end