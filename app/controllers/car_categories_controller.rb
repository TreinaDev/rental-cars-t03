class CarCategoriesController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end

  def show
    @car_category = CarCategory.find(params[:id])
    # @car_models = CarModel.where(car_category: @car_category)
  end
end