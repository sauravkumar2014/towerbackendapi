require 'test_helper'

class CurrencypricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currencyprice = currencyprices(:one)
  end

  test "should get index" do
    get currencyprices_url, as: :json
    assert_response :success
  end

  test "should create currencyprice" do
    assert_difference('Currencyprice.count') do
      post currencyprices_url, params: { currencyprice: { date: @currencyprice.date, exchangeVolume: @currencyprice.exchangeVolume, fees: @currencyprice.fees, generatedCoins: @currencyprice.generatedCoins, marketcap: @currencyprice.marketcap, price: @currencyprice.price, txCount: @currencyprice.txCount, txVolume: @currencyprice.txVolume } }, as: :json
    end

    assert_response 201
  end

  test "should show currencyprice" do
    get currencyprice_url(@currencyprice), as: :json
    assert_response :success
  end

  test "should update currencyprice" do
    patch currencyprice_url(@currencyprice), params: { currencyprice: { date: @currencyprice.date, exchangeVolume: @currencyprice.exchangeVolume, fees: @currencyprice.fees, generatedCoins: @currencyprice.generatedCoins, marketcap: @currencyprice.marketcap, price: @currencyprice.price, txCount: @currencyprice.txCount, txVolume: @currencyprice.txVolume } }, as: :json
    assert_response 200
  end

  test "should destroy currencyprice" do
    assert_difference('Currencyprice.count', -1) do
      delete currencyprice_url(@currencyprice), as: :json
    end

    assert_response 204
  end
end
