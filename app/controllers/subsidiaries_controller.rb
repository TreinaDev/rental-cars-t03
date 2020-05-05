class SubsidiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subsidiary, only: %i[show edit update]

  def index
    @subsidiaries = Subsidiary.all
  end

  def show; end

  def new
    @subsidiary = Subsidiary.new
  end

  def edit; end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    return redirect_to @subsidiary if @subsidiary.save

    render :new
  end

  def update
    return redirect_to @subsidiary if @subsidiary.update(subsidiary_params)

    render :edit
  end

  private

  def subsidiary_params
    params.require(:subsidiary).permit(:name, :cnpj, :address)
  end

  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:id])
  end
end
