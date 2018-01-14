require 'test_helper'

class CurrencyinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currencyinfo = currencyinfos(:one)
  end

  test "should get index" do
    get currencyinfos_url, as: :json
    assert_response :success
  end

  test "should create currencyinfo" do
    assert_difference('Currencyinfo.count') do
      post currencyinfos_url, params: { currencyinfo: { latestPrice: @currencyinfo.latestPrice, latesttxVolume: @currencyinfo.latesttxVolume, symbol: @currencyinfo.symbol } }, as: :json
    end

    assert_response 201
  end

  test "should show currencyinfo" do
    get currencyinfo_url(@currencyinfo), as: :json
    assert_response :success
  end

  test "should update currencyinfo" do
    patch currencyinfo_url(@currencyinfo), params: { currencyinfo: { latestPrice: @currencyinfo.latestPrice, latesttxVolume: @currencyinfo.latesttxVolume, symbol: @currencyinfo.symbol } }, as: :json
    assert_response 200
  end

  test "should destroy currencyinfo" do
    assert_difference('Currencyinfo.count', -1) do
      delete currencyinfo_url(@currencyinfo), as: :json
    end

    assert_response 204
  end
end
