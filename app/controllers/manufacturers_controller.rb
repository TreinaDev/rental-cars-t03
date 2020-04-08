class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end
end