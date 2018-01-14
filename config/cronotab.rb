# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#
require 'rest-client'
require 'json'
require 'active_support'

class LatestCurrencyPrices
	@@uri = "https://www.alphavantage.co/query"
	@@options = {
		function: "DIGITAL_CURRENCY_INTRADAY",
		market: "USD",
		apikey: "F5UIA61WHAO4CIMQ",
		datatype: "json"
	}

	def perform()
		allcurrs = Currencyinfo.all
		allcurrs.each do |currencyinfo|
			@@options['symbol'] = currencyinfo.symbol
			recieved = JSON.parse(RestClient.get(@@uri,{params: @@options}))
			recieved = recieved["Time Series (Digital Currency Intraday)"]
			curdate = recieved.keys[0]
			recieved = recieved[curdate]
			currencyinfo.latestPrice = recieved['1a. price (USD)']
			currencyinfo.latesttxVolume = recieved['2. volume']
			currencyinfo.latestmarketcap = recieved['3. market cap (USD)']
			currencyinfo.save			
		end
	end
end

Crono.perform(LatestCurrencyPrices).every 2.minutes
