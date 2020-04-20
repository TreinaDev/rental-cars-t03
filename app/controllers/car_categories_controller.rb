class CarCategoriesController < ApplicationController
  def index
    @car_categories = CarCategory.all
  end
end