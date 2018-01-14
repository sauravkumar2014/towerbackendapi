class CurrencypricesController < ApplicationController
  before_action :set_currencyprice, only: [:show, :update, :destroy]

  # GET /currencyprices
  def index
    @currencyprices = Currencyprice.all

    render json: @currencyprices
  end

  # GET /currencyprices/1
  def show
    render json: @currencyprice
  end

  # POST /currencyprices
  def create
    @currencyprice = Currencyprice.new(currencyprice_params)

    if @currencyprice.save
      render json: @currencyprice, status: :created, location: @currencyprice
    else
      render json: @currencyprice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencyprices/1
  def update
    if @currencyprice.update(currencyprice_params)
      render json: @currencyprice
    else
      render json: @currencyprice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencyprices/1
  def destroy
    @currencyprice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currencyprice
      @currencyprice = Currencyprice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currencyprice_params
      params.require(:currencyprice).permit(:date, :txVolume, :txCount, :marketcap, :price, :exchangeVolume, :generatedCoins, :fees)
    end
end
