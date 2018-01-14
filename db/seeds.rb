# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

currencies = Currencyinfo.create([
							  {symbol: 'BTC', currencyname: 'Bitcoin'},
							  {symbol: 'LTC', currencyname: 'Litecoin'},
							  {symbol: 'DOGE', currencyname: 'Dogecoin'},
							  {symbol: 'ETH', currencyname: 'Ethereum'}
							 ])
puts(currencies)

def import_currency_prices(symbol, file)
	currencyprices = []
	CSV.foreach(Rails.root.join('historicaldata',file), headers: true) do |row|
		row = row.to_h
		currencydetail = {
			symbol: symbol,
			date: row['date'],
			txVolume: row['txVolume(USD)'],
			txCount: row['txCount'],
			price: row['price(USD)'],
			marketcap: row['marketcap(USD)'],
			exchangeVolume: row['exchangeVolume(USD)'],
			generatedCoins: row['generatedCoins'],
			fees: row['fees']
		}
		histentry = Currencyprice.new(currencydetail)
		currencyprices << histentry
	end
	Currencyprice.import(currencyprices)
end

import_currency_prices('BTC','btc.csv')
import_currency_prices('LTC','ltc.csv')
import_currency_prices('DOGE','doge.csv')
import_currency_prices('ETH','eth.csv')