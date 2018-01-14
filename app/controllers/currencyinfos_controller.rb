class CurrencyinfosController < ApplicationController
  before_action :set_currencyinfo, only: [:show, :update, :destroy]

  # GET /currencyinfos
  def index
    @currencyinfos = Currencyinfo.all

    render json: @currencyinfos
  end

  # GET /currencyinfos/1
  def show
    render json: @currencyinfo
  end

  # POST /currencyinfos
  def create
    @currencyinfo = Currencyinfo.new(currencyinfo_params)

    if @currencyinfo.save
      render json: @currencyinfo, status: :created, location: @currencyinfo
    else
      render json: @currencyinfo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /currencyinfos/1
  def update
    if @currencyinfo.update(currencyinfo_params)
      render json: @currencyinfo
    else
      render json: @currencyinfo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencyinfos/1
  def destroy
    @currencyinfo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currencyinfo
      @currencyinfo = Currencyinfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currencyinfo_params
      params.require(:currencyinfo).permit(:symbol, :latestPrice, :latesttxVolume)
    end
end
