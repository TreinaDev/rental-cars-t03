class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
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
  end

  # PATCH ou PUT
  def update
    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy
    redirect_to manufacturers_path
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end