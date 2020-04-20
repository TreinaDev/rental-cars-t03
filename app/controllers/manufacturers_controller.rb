class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  # POST
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = 'Fabricante criada com sucesso'
      redirect_to @manufacturer
    else
      render :new
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  # PATCH ou PUT
  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end